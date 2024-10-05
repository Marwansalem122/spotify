import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/is_dark.dart';
import 'package:spotify/core/config/size_config.dart';
import 'package:spotify/core/resourses/assets_manager.dart';
import 'package:spotify/core/resourses/width_size_manager.dart';
import 'package:spotify/core/theme/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: InkWell(
        onTap: () {},
        child: Icon(Icons.search,
            color: context.isDark ? AppColor.grey : AppColor.lightBackground),
      ),
      title: SvgPicture.asset(AssetsManager.logo,
          width: SizeConfig.screenWidth! * WidthSizeManager.s135),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert,
              color: context.isDark ? AppColor.grey : AppColor.lightBackground),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/*
 CustomArrowBack(onTap: onTap,),
        SizedBox(width: SizeConfig.screenWidth! * WidthSizeManager.s90),
        SvgPicture.asset(AssetsManager.logo,
            width: SizeConfig.screenWidth! * WidthSizeManager.s135),
*/