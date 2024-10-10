import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark.dart';
import 'package:spotify/core/config/size_config.dart';
import 'package:spotify/core/resourses/height_size_manager.dart';
import 'package:spotify/core/resourses/width_size_manager.dart';
import 'package:spotify/core/theme/app_color.dart';
import 'package:spotify/presentation/profile/bloc/profile_info_cubit.dart';
import 'package:spotify/presentation/profile/bloc/profile_info_state.dart';

class CustomTopProfile extends StatelessWidget {
  const CustomTopProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight! * HeightSizeManager.s228f57,
      width: double.infinity,
      decoration: BoxDecoration(
          color:
              context.isDark ? AppColor.darkProfileColor : AppColor.whiteColor,
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50))),
      child: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
          builder: (context, state) {
        if (state is ProfileInfoLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProfileInfoLoaded) {
          return Column(
            children: [
              SizedBox(
                  height: SizeConfig.screenHeight! * HeightSizeManager.s21),
              Container(
                  width: SizeConfig.screenWidth! * WidthSizeManager.s90,
                  height: SizeConfig.screenHeight! * HeightSizeManager.s90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:
                            NetworkImage(state.userEntity.imageURL.toString())),
                  )),
              SizedBox(
                  height: SizeConfig.screenHeight! * HeightSizeManager.s10),
              Text(
                state.userEntity.email.toString(),
                style: TextStyle(
                  color: context.isDark
                      ? AppColor.whiteColor
                      : AppColor.darkProfileColor,
                ),
              ),
              SizedBox(
                  height: SizeConfig.screenHeight! * HeightSizeManager.s10),
              Text(
                state.userEntity.fullName.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: context.isDark
                      ? AppColor.whiteColor
                      : AppColor.darkProfileColor,
                ),
              ),
            ],
          );
        } else {
          return Text(
            "Please Try agin",
            style: TextStyle(
                color: context.isDark
                    ? AppColor.whiteColor
                    : AppColor.darkProfileColor),
          );
        }
      }),
    );
  }
}
