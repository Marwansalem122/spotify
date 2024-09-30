import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widget/custom_arrow_back.dart';
import 'package:spotify/core/resourses/assets_manager.dart';

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
