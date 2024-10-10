import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify/core/config/constants/app_urls.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/song_player/bloc/song_player_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;
  bool isPlaying = false;
  List<SongEntity> songList = []; 
  List<String> songsUrl = [];// List of song URLs

  int currentSongIndex = 0; // Track the current song index
  SongPlayerCubit(this.songList) : super(SongPlayerStateLoading()) {
    loadSongsUrl();  // Ensure song URLs are loaded at initialization
    _loadSavedState(); // Load the saved position and playing state when initializing.
    audioPlayer.positionStream.listen((position) {
      songPosition = position;
      updateSongPlayer();
      _saveSongState(); // Save the position whenever it updates.
    });

    audioPlayer.durationStream.listen((duration) {
      if (duration != null) {
        songDuration = duration;
        updateSongPlayer();
      }
    });
  }
  loadSongsUrl() {
    for (var i = 0; i < songList.length; i++) {
      songsUrl.add(
          "${AppUrls.songFirestorage}${songList[i].artist} - ${songList[i].title}.mp3?${AppUrls.mediaAlt}");
    }
    log(songList.toString());
  }

  Future<void> _loadSavedState() async {
    final prefs = await SharedPreferences.getInstance();
    final savedPosition = prefs.getInt('song_position') ?? 0;
    final wasPlaying = prefs.getBool('is_playing') ?? false;

    if (savedPosition > 0) {
      songPosition = Duration(seconds: savedPosition);
      await audioPlayer.seek(songPosition); // Seek to the saved position
    }
    if (wasPlaying) {
      audioPlayer.play(); // Start playing if the song was playing before
    }
    emit(SongPlayerStateLoaded());
  }

  Future<void> _saveSongState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('song_position', songPosition.inSeconds);
    await prefs.setBool('is_playing', audioPlayer.playing);
  }

  void updateSongPlayer() {
    if (!isClosed) {
      emit(SongPlayerStateLoaded());
    }
  }

  Future<void> loadSong(String url) async {
    try {
      await audioPlayer.setUrl(url);
      // After loading a new song, reset position and duration
      songPosition = Duration.zero;
      songDuration = audioPlayer.duration ?? Duration.zero;
      emit(SongPlayerStateLoaded());
    } catch (e) {
      emit(SongPlayerStateError());
    }
  }

  void playOrPauseSong() {
    if (audioPlayer.playing) {
      audioPlayer.pause();
      isPlaying = false; // Update isPlaying status
    } else {
      audioPlayer.play();
      isPlaying = true; // Update isPlaying status
    }
    _saveSongState(); // Save the playing state whenever play/pause is toggled
    emit(SongPlayerStateLoaded());
  }

  // Method to play the next song
  void playNextSong() {
    if (currentSongIndex < songList.length - 1) {
      currentSongIndex++;
      
      loadSong(songsUrl[currentSongIndex]);
      emit(SongPlayerStateLoaded());
    }
  }

  // Method to play the previous song
  void playPreviousSong() {
    if (currentSongIndex > 0) {
      currentSongIndex--;
      loadSong(songsUrl[currentSongIndex]);
      emit(SongPlayerStateLoaded());
    }
  }
   SongEntity getCurrentSong() {
    return songList[currentSongIndex];  // Get the current song
  }

  // Set the current song index based on the clicked song
  void setCurrentSong(int songIndex) {
    currentSongIndex = songIndex;  // Set the index to the clicked song
    loadSong(songsUrl[currentSongIndex]);  // Load the selected song
    
  }
  
  @override
  Future<void> close() {
     // Cancel all streams before closing the Cubit
  audioPlayer.positionStream.drain();
  audioPlayer.durationStream.drain();
    audioPlayer.dispose();
    return super.close();
  }
}
