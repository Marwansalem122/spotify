import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/navigate_extensions.dart';
import 'package:spotify/core/route/routes.dart';
import 'package:spotify/domain/entities/song/song.dart';

class HomeController {
  void navigateToSongPlayer(BuildContext context, SongEntity song,
      List<SongEntity> songsUrl, int songIndex) {
    context.pushNamed(Routes.songPlayerPage,
        arguments: [song, songsUrl, songIndex]);
  }

  void navigateToProfilePage(BuildContext context) {
    context.pushNamed(Routes.profilePage);
  }
}
