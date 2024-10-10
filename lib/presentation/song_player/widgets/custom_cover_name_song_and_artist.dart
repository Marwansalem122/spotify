import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/widget/favorite_button/favorite_button.dart';
import 'package:spotify/core/config/constants/app_urls.dart';
import 'package:spotify/core/config/size_config.dart';
import 'package:spotify/core/resourses/height_size_manager.dart';
import 'package:spotify/core/resourses/width_size_manager.dart';
import 'package:spotify/presentation/song_player/bloc/song_player_cubit.dart';
import 'package:spotify/presentation/song_player/bloc/song_player_state.dart';

class CustomCoverNameSongAndArtist extends StatelessWidget {
  const CustomCoverNameSongAndArtist({super.key});

  @override
  Widget build(BuildContext context) {
    // log("${AppUrls.coverFirestorage}${song.artist} - ${song.title}.jpg?${AppUrls.mediaAlt}");
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
        builder: (context, state) {
      final song = context.read<SongPlayerCubit>().getCurrentSong();
      return Container(
        margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth! * WidthSizeManager.s25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.screenHeight! * HeightSizeManager.s24),
            Container(
              height: SizeConfig.screenHeight! * HeightSizeManager.s320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "${AppUrls.coverFirestorage}${song.artist} - ${song.title}.jpg?${AppUrls.mediaAlt}"))),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(song.title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(song.artist,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400)),
                  ],
                ),
                FavoriteButton(
                  songEntity: song,
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
