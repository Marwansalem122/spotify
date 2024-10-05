import 'package:spotify/data/models/song/song.dart';
import 'package:spotify/domain/entities/song/song.dart';

extension SongModelX on SongModel {
  SongEntity toEntity() => SongEntity(
      title: title!,
      artist: artist!,
      duration: duration!,
      releaseDate: releaseDate!);
}
