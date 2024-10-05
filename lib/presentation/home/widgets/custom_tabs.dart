import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark.dart';
import 'package:spotify/core/config/size_config.dart';
import 'package:spotify/core/resourses/height_size_manager.dart';
import 'package:spotify/core/resourses/string_manager.dart';
import 'package:spotify/core/resourses/width_size_manager.dart';
import 'package:spotify/core/theme/app_color.dart';

class CustomTabs extends StatelessWidget {
  final TabController tabController;
  const CustomTabs({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicatorColor: AppColor.primary,
      indicatorPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth! * WidthSizeManager.s12),
      dividerColor: Colors.transparent,
      padding: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight!*HeightSizeManager.s30),
      tabs: [
        Tab(
          child: Text(
            StringManager.news,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color:
                    context.isDark ? AppColor.lightBackground : Colors.black),
          ),
        ),
        Tab(
          child: Text(
            StringManager.video,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color:
                    context.isDark ? AppColor.lightBackground : Colors.black),
          ),
        ),
        Tab(
          child: Text(
            StringManager.artist,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color:
                    context.isDark ? AppColor.lightBackground : Colors.black),
          ),
        ),
        Tab(
          child: Text(
            StringManager.podcast,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color:
                    context.isDark ? AppColor.lightBackground : Colors.black),
          ),
        ),
      ],
    );
  }
}
