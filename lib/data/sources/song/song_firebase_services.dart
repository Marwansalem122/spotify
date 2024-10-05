import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/common/helpers/song_model_extension.dart';
import 'package:spotify/data/models/song/song.dart';
import 'package:spotify/domain/entities/song/song.dart';

abstract class SongFirebaseServices {
  Future<Either> getNewsSongs();

  Future<Either> getPlayList();
}

class SongFirebaseServicesImpl implements SongFirebaseServices {
  @override
  Future<Either> getNewsSongs() async {
 try{   List<SongEntity> songs = [];
    var data = await FirebaseFirestore.instance
        .collection("songs")
        .orderBy("releaseDate", descending: true)
        .limit(3)
        .get();
    for (var element in data.docs) {
      var songModel = SongModel.fromJson(element.data());
      songs.add(songModel.toEntity());

    }
    return Right(songs);
    }on FirebaseException catch(e){
      return Left("An Error occurred: ${e.message!}");
    }
  }
  
  @override
  Future<Either> getPlayList()async {
 try{   List<SongEntity> songs = [];
    var data = await FirebaseFirestore.instance
        .collection("songs")
        .orderBy("releaseDate", descending: true)
        .get();
    for (var element in data.docs) {
      var songModel = SongModel.fromJson(element.data());
      songs.add(songModel.toEntity());

    }
    return Right(songs);
    }on FirebaseException catch(e){
      return Left("An Error occurred: ${e.message!}");
    }
  } 
}
