import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widget/custom_arrow_back.dart';
import 'package:spotify/controllers/signin_or_signup_controller.dart';
import 'package:spotify/core/config/size_config.dart';
import 'package:spotify/core/resourses/assets_manager.dart';
import 'package:spotify/core/resourses/height_size_manager.dart';
import 'package:spotify/core/resourses/width_size_manager.dart';
import 'package:spotify/core/theme/app_color.dart';

class CustomAppBar extends StatelessWidget {
 final void Function() onTap;

  const CustomAppBar({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         CustomArrowBack(onTap: onTap,),
        SvgPicture.asset(
          AssetsManager.topPattern,
        ),
      ],
    );
  }
}
