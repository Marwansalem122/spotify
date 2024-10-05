import 'package:dartz/dartz.dart';
import 'package:spotify/data/sources/song/song_firebase_services.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/service_locator.dart';

class SongRepositoryImpl extends SongsRepository {
  @override
  Future<Either> getNewsSongs()async {
   return await sl<SongFirebaseServices>().getNewsSongs();
  }
  
  @override
  Future<Either> getPlayList()async {
     return await sl<SongFirebaseServices>().getPlayList();
  }
}
