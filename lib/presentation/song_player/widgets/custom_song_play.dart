import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark.dart';
import 'package:spotify/core/config/size_config.dart';
import 'package:spotify/core/resourses/assets_manager.dart';
import 'package:spotify/core/resourses/height_size_manager.dart';
import 'package:spotify/core/resourses/width_size_manager.dart';
import 'package:spotify/core/theme/app_color.dart';
import 'package:spotify/presentation/song_player/bloc/song_player_cubit.dart';
import 'package:spotify/presentation/song_player/bloc/song_player_state.dart';

class CustomSongPlay extends StatelessWidget {
  const CustomSongPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
      builder: (context, state) {
        if (state is SongPlayerStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SongPlayerStateLoaded) {
          return Column(
            children: [
              Slider(
                  value: context
                      .read<SongPlayerCubit>()
                      .songPosition
                      .inSeconds
                      .toDouble(),
                  min: 0.0,
                  max: context
                      .read<SongPlayerCubit>()
                      .songDuration
                      .inSeconds
                      .toDouble(),
                  onChanged: (value) {
                    // Update the position and seek the audio player
                    final newPosition = Duration(seconds: value.toInt());
                    context
                        .read<SongPlayerCubit>()
                        .audioPlayer
                        .seek(newPosition);
                    context.read<SongPlayerCubit>().songPosition =
                        newPosition; // Update local position
                  }),
              // SizedBox(height: SizeConfig.screenHeight! * -0.001),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth! * WidthSizeManager.s14),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatDuration(
                          context.read<SongPlayerCubit>().songPosition)),
                      Text(formatDuration(
                          context.read<SongPlayerCubit>().songDuration))
                    ]),
              ),
              SizedBox(
                  height: SizeConfig.screenHeight! * HeightSizeManager.s21),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                IconButton(
                  onPressed: () {
                    context.read<SongPlayerCubit>().playPreviousSong();
                  },
                  icon: context.isDark
                      ? Image.asset(AssetsManager.previousWhiteIcon)
                      : Image.asset(AssetsManager.previousBlackIcon),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<SongPlayerCubit>().playOrPauseSong();
                  },
                  child: Container(
                      width: SizeConfig.screenWidth! * WidthSizeManager.s60,
                      height: SizeConfig.screenHeight! * HeightSizeManager.s60,
                      decoration: const BoxDecoration(
                          color: AppColor.primary, shape: BoxShape.circle),
                      child: Icon(
                          context.read<SongPlayerCubit>().audioPlayer.playing
                              ? Icons.pause
                              : Icons.play_arrow_outlined)),
                ),
                IconButton(
                  onPressed: () {
                    context.read<SongPlayerCubit>().playNextSong();
                  },
                  icon: context.isDark
                      ? Image.asset(AssetsManager.nextWhiteIcon)
                      : Image.asset(AssetsManager.nextBlacIcon),
                ),
              ])
            ],
          );
        }
        return Container();
      },
    );
  }
}

String formatDuration(Duration duration) {
  final minutes = duration.inMinutes.remainder(60);
  final seconds = duration.inSeconds.remainder(60);
  return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
}
