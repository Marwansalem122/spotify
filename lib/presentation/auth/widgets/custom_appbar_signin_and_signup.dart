import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widget/custom_arrow_back.dart';
import 'package:spotify/core/config/size_config.dart';
import 'package:spotify/core/resourses/assets_manager.dart';
import 'package:spotify/core/resourses/width_size_manager.dart';

class CustomAppbarSigninAndSignup extends StatelessWidget {
final void Function() onTap;
  const CustomAppbarSigninAndSignup({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         CustomArrowBack(onTap: onTap,),
        SizedBox(width: SizeConfig.screenWidth! * WidthSizeManager.s90),
        SvgPicture.asset(AssetsManager.logo,
            width: SizeConfig.screenWidth! * WidthSizeManager.s135),
      ],
    );
  }
}
