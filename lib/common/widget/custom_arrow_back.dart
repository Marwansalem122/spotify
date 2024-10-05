import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark.dart';
import 'package:spotify/core/config/size_config.dart';
import 'package:spotify/core/resourses/height_size_manager.dart';
import 'package:spotify/core/resourses/width_size_manager.dart';
import 'package:spotify/core/theme/app_color.dart';

class CustomArrowBack extends StatelessWidget {
  final void Function()onTap;
  const CustomArrowBack({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: SizeConfig.screenWidth! * WidthSizeManager.s30,
      ),
      width: SizeConfig.screenWidth! * WidthSizeManager.s45,
      height: SizeConfig.screenHeight! * HeightSizeManager.s40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: context.isDark
              ? AppColor.darkGrey.withOpacity(0.7)
              : AppColor.grey.withOpacity(0.4)),
      child: InkWell(
        onTap:onTap,
        child: const Icon(Icons.arrow_back_ios_new),
      ),
    );
  }
}
