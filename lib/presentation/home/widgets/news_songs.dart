import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark.dart';
import 'package:spotify/controllers/home_controller.dart';
import 'package:spotify/core/config/constants/app_urls.dart';
import 'package:spotify/core/config/size_config.dart';
import 'package:spotify/core/resourses/height_size_manager.dart';
import 'package:spotify/core/resourses/width_size_manager.dart';
import 'package:spotify/core/theme/app_color.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/home/bloc/news_songs_cubit.dart';
import 'package:spotify/presentation/home/bloc/news_songs_state.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsSongsCubit, NewsSongsState>(
        builder: (context, state) {
      if (state is NewsSongsLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is NewsSongsLoadedState) {
        return _songs(state.songs);
      }
      return Container();
    });
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(
              width: SizeConfig.screenWidth! * WidthSizeManager.s14,
            ),
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              HomeController().navigateToSongPlayer(context, songs[index],songs,index);
            },
            child: SizedBox(
              width: SizeConfig.screenWidth! * WidthSizeManager.s160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "${AppUrls.coverFirestorage}${songs[index].artist} - ${songs[index].title}.jpg?${AppUrls.mediaAlt}"))),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            width:
                                SizeConfig.screenWidth! * WidthSizeManager.s40,
                            height: SizeConfig.screenHeight! *
                                HeightSizeManager.s40,
                            transform: Matrix4.translationValues(10, 10, 0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: context.isDark
                                    ? AppColor.darkGrey
                                    : AppColor.backgroundCircle),
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: context.isDark
                                  ? AppColor.greyIconColor
                                  : AppColor.darkGreyIconColor,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: SizeConfig.screenWidth! * HeightSizeManager.s10),
                  Text(songs[index].title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16)),
                  SizedBox(
                      height: SizeConfig.screenWidth! * HeightSizeManager.s5),
                  Text(songs[index].artist,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12))
                ],
              ),
            ),
          );
        });
  }
}
