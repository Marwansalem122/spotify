import 'package:dartz/dartz.dart';

abstract class SongsRepository{

  Future<Either> getNewsSongs();
  Future<Either> getPlayList();
  Future<Either> addOrRemoveFavouritSongs(String songId);
  Future<bool> isFavouritSong(String songId);
    Future<Either> getUserFavoriteSongs();



}