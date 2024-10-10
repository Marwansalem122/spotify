
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/widget/custom_app_bar_general.dart';
import 'package:spotify/controllers/song_player_controller.dart';
import 'package:spotify/core/resourses/string_manager.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/song_player/bloc/song_player_cubit.dart';
import 'package:spotify/presentation/song_player/widgets/custom_cover_name_song_and_artist.dart';
import 'package:spotify/presentation/song_player/widgets/custom_song_play.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity song;
  final List<SongEntity> songs;
  final int songIndex;
  const SongPlayerPage({super.key, required this.song, required this.songs, required this.songIndex});

  @override
  Widget build(BuildContext context) {
    // log("from song :${AppUrls.songFirestorage}${song.artist} - ${song.title}.mp3?${AppUrls.mediaAlt}");
    return Scaffold(
      body: BlocProvider(
        create: (context) => SongPlayerCubit(songs)..setCurrentSong(songIndex),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBarGeneral(
                    title: StringManager.nowPlaying,
                    icon: Icons.more_vert,
                    
                    onTap: () {
                      SongPlayerController().navigateToHomePage(context);
                    }),
                const CustomCoverNameSongAndArtist(),
                const CustomSongPlay()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
