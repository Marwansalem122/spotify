import 'package:spotify/domain/entities/song/song.dart';

abstract class NewsSongsState {}

class NewsSongsLoadingState extends NewsSongsState {}

class NewsSongsLoadedState extends NewsSongsState {
  final List<SongEntity> songs;

  NewsSongsLoadedState({required this.songs});
}

class NewsSongsFailureState extends NewsSongsState {

}
