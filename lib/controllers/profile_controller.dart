import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/navigate_extensions.dart';
import 'package:spotify/core/route/routes.dart';
import 'package:spotify/domain/entities/song/song.dart';

class ProfileController {
  void navigateToHomePage(BuildContext context) {
    context.pop();
  }

  void navigateToSongePlayer(BuildContext context,SongEntity song,List<SongEntity> songsUrl, int songIndex) {
    context.pushNamed(Routes.songPlayerPage,arguments: [song, songsUrl, songIndex]);
  }
}
