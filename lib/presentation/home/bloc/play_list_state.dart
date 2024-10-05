import 'package:spotify/domain/entities/song/song.dart';

abstract class PlayListState {}

class PlayListLoadingState extends PlayListState {}

class PlayListLoadedState extends PlayListState {
  final List<SongEntity> songs;

  PlayListLoadedState({required this.songs});
}

class PlayListFailureState extends PlayListState {}
