import 'package:flutter/material.dart';
import 'package:spotify/core/config/size_config.dart';
import 'package:spotify/core/resourses/height_size_manager.dart';
import 'package:spotify/core/theme/app_color.dart';

class BasicAppButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final double? height;
  final Color textColor;
  final Color? buttonColor;
  final FontWeight? fontWeight;
  const BasicAppButton(
      {required this.onPressed,
      required this.title,
      this.height,
      super.key,
      required this.textColor,
      this.buttonColor,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? AppColor.primary,
          minimumSize: Size.fromHeight(
              height ?? SizeConfig.screenHeight! * HeightSizeManager.s80),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: textColor, fontWeight: fontWeight ?? FontWeight.normal),
        ));
  }
}
