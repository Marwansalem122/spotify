import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark.dart';
import 'package:spotify/controllers/home_controller.dart';
import 'package:spotify/core/config/size_config.dart';
import 'package:spotify/core/resourses/height_size_manager.dart';
import 'package:spotify/core/resourses/width_size_manager.dart';
import 'package:spotify/core/theme/app_color.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/home/bloc/play_list_cubit.dart';
import 'package:spotify/presentation/home/bloc/play_list_state.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayListCubit, PlayListState>(builder: (context, state) {
      if (state is PlayListLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is PlayListLoadedState) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth! * WidthSizeManager.s22f5,
              vertical: SizeConfig.screenHeight! * HeightSizeManager.s45),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Playlist',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    'See More',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xffC6C6C6)),
                  ),
                ],
              ),
              SizedBox(
                  height: SizeConfig.screenHeight! * HeightSizeManager.s21),
              _songs(state.songs)
            ],
          ),
        );
      }
      return Container();
    });
  }
}

Widget _songs(List<SongEntity> songs) {
  return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            HomeController().navigateToSongPlayer(context, songs[index]);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: SizeConfig.screenHeight! * HeightSizeManager.s45,
                    width: SizeConfig.screenWidth! * WidthSizeManager.s45,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.isDark
                            ? AppColor.darkGrey
                            : AppColor.backgroundCircle),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: context.isDark
                          ? AppColor.greyIconColor
                          : AppColor.darkGreyIconColor,
                    ),
                  ),
                  SizedBox(
                      width: SizeConfig.screenWidth! * WidthSizeManager.s10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songs[index].title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                          height:
                              SizeConfig.screenHeight! * HeightSizeManager.s5),
                      Text(
                        songs[index].artist,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 11),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Text(songs[index]
                      .duration
                      .toString()
                      .padRight(4, "0")
                      .replaceAll('.', ':')),
                  SizedBox(
                      width: SizeConfig.screenWidth! * WidthSizeManager.s20),
                  // FavoriteButton(
                  //   songEntity: songs[index],
                  // )
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        size: 25,
                        color: AppColor.darkGrey,
                      ))
                ],
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) =>
          SizedBox(height: SizeConfig.screenHeight! * HeightSizeManager.s21),
      itemCount: songs.length);
}

String formatDuration(Duration duration) {
  final minutes = duration.inMinutes.remainder(60);
  final seconds = duration.inSeconds.remainder(60);
  return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
}
