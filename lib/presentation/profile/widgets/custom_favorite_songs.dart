import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark.dart';
import 'package:spotify/common/widget/favorite_button/favorite_button.dart';
import 'package:spotify/controllers/profile_controller.dart';
import 'package:spotify/core/config/constants/app_urls.dart';
import 'package:spotify/core/config/size_config.dart';
import 'package:spotify/core/resourses/height_size_manager.dart';
import 'package:spotify/core/resourses/string_manager.dart';
import 'package:spotify/core/resourses/width_size_manager.dart';
import 'package:spotify/core/theme/app_color.dart';
import 'package:spotify/presentation/profile/bloc/favorite_songs_cubit.dart';
import 'package:spotify/presentation/profile/bloc/favorite_songs_state.dart';

class CustomFavoriteSongs extends StatelessWidget {
  const CustomFavoriteSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteSongsCubit()..getFavoriteSongs(),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth! * WidthSizeManager.s25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.screenHeight! * HeightSizeManager.s30),
            Text(StringManager.favoriteSongs,
                style: TextStyle(
                    fontSize: 24,
                    color: context.isDark
                        ? AppColor.whiteColor
                        : AppColor.darkBackground)),
            SizedBox(height: SizeConfig.screenHeight! * HeightSizeManager.s16),
            BlocBuilder<FavoriteSongsCubit, FavoriteSongsState>(
                builder: (context, state) {
              if (state is FavoriteSongsLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is FavoriteSongsLoaded) {
                return ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.favoriteSongs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          ProfileController().navigateToSongePlayer(context, state.favoriteSongs[index], state.favoriteSongs,index);
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: SizeConfig.screenWidth! *
                                        WidthSizeManager.s70,
                                    height: SizeConfig.screenHeight! *
                                        HeightSizeManager.s70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "${AppUrls.coverFirestorage}${state.favoriteSongs[index].artist} - ${state.favoriteSongs[index].title}.jpg?${AppUrls.mediaAlt}")),
                                    ),
                                  ),
                                  SizedBox(
                                      width: SizeConfig.screenWidth! *
                                          WidthSizeManager.s10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.favoriteSongs[index].title,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                      SizedBox(
                                          height: SizeConfig.screenHeight! *
                                              HeightSizeManager.s5),
                                      Text(
                                        state.favoriteSongs[index].artist,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // SizedBox(width: SizeConfig.screenWidth! * 0.3),

                              Row(children: [
                                Text(
                                    state.favoriteSongs[index].duration
                                        .toString()
                                        .padRight(4, "0")
                                        .replaceAll('.', ':'),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: context.isDark
                                            ? AppColor.whiteColor
                                            : AppColor.darkBackground)),
                                SizedBox(
                                    width: SizeConfig.screenWidth! *
                                        WidthSizeManager.s20),
                                FavoriteButton(
                                  songEntity: state.favoriteSongs[index],
                                  key: UniqueKey(),
                                  function: () {
                                    context
                                        .read<FavoriteSongsCubit>()
                                        .removeSong(index);
                                  },
                                )
                              ])
                            ]),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                        height:
                            SizeConfig.screenHeight! * HeightSizeManager.s21));
              } else {
                return Text(StringManager.pleaseTryAgain,
                    style: TextStyle(
                        fontSize: 24,
                        color: context.isDark
                            ? AppColor.whiteColor
                            : AppColor.darkBackground));
              }
            }),
          ],
        ),
      ),
    );
  }
}
