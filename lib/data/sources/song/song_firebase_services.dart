import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/common/helpers/song_model_extension.dart';
import 'package:spotify/data/models/song/song.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/domain/usecases/song/is_favourit_song.dart';
import 'package:spotify/service_locator.dart';

abstract class SongFirebaseServices {
  Future<Either> getNewsSongs();

  Future<Either> getPlayList();
  Future<Either> addOrRemoveFavouriteSongs(String songId);
  Future<bool> isFavouritSong(String songId);
    Future<Either> getUserFavoriteSongs();

}

class SongFirebaseServicesImpl implements SongFirebaseServices {
  @override
  Future<Either> getNewsSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection("songs")
          .orderBy("releaseDate", descending: true)
          .limit(3)
          .get();
      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        bool isFavourit = await sl<IsFavoriteSongUseCase>()
            .call(params: element.reference.id);
        songModel.isFavourit = isFavourit;
        songModel.songId = element.reference.id;
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } on FirebaseException catch (e) {
      return Left("An Error occurred: ${e.message!}");
    }
  }

  @override
  Future<Either> getPlayList() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection("songs")
          .orderBy("releaseDate", descending: true)
          .get();
      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
 bool isFavourit = await sl<IsFavoriteSongUseCase>()
     .call(params: element.reference.id);
 songModel.isFavourit = isFavourit;
 songModel.songId = element.reference.id;
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } on FirebaseException catch (e) {
      return Left("An Error occurred: ${e.message!}");
    }
  }

  @override
  Future<Either> addOrRemoveFavouriteSongs(String songId) async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      var user = firebaseAuth.currentUser;
      late bool isFavourit;
      String uId = user!.uid;
      QuerySnapshot favouritSongs = await firebaseFirestore
          .collection("users")
          .doc(uId)
          .collection("Favorites")
          .where("songId", isEqualTo: songId)
          .get();
      if (favouritSongs.docs.isNotEmpty) {
        await favouritSongs.docs.first.reference.delete();
        isFavourit = false;
      } else {
        await firebaseFirestore
            .collection("users")
            .doc(uId)
            .collection("Favorites")
            .add({"songId": songId, "addedDate": Timestamp.now()});
        isFavourit = true;
      }
      return Right(isFavourit);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<bool> isFavouritSong(String songId) async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      var user = firebaseAuth.currentUser;
      String uId = user!.uid;

      QuerySnapshot favoriteSongs = await firebaseFirestore
          .collection('users')
          .doc(uId)
          .collection('Favorites')
          .where('songId', isEqualTo: songId)
          .get();

      if (favoriteSongs.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
  
  @override
  Future<Either> getUserFavoriteSongs()async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      var user = firebaseAuth.currentUser;
      List<SongEntity> favoriteSongs = [];
      String uId = user!.uid;
      QuerySnapshot favoritesSnapshot = await firebaseFirestore.collection(
        'users'
      ).doc(uId)
      .collection('Favorites')
      .get();
      
      for (var element in favoritesSnapshot.docs) { 
        String songId = element['songId'];
        var song = await firebaseFirestore.collection('songs').doc(songId).get();
        SongModel songModel = SongModel.fromJson(song.data()!);
        songModel.isFavourit = true;
        songModel.songId = songId;
        favoriteSongs.add(
          songModel.toEntity()
        );
      }
      
      return Right(favoriteSongs);

    } catch (e) {
      return const Left(
        'An error occurred'
      );
    }
  }
}
