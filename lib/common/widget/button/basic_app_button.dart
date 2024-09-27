import 'package:flutter/material.dart';
import 'package:spotify/core/config/size_config.dart';
import 'package:spotify/core/resourses/height_size_manager.dart';

class BasicAppButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final double? height;
  final Color textColor;
  const BasicAppButton(
      {required this.onPressed,
      required this.title,
      this.height,
      super.key,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(
              height ?? SizeConfig.screenHeight! * HeightSizeManager.s80),
        ),
        child: Text(
          title,
          style: TextStyle(color: textColor),
        ));
  }
}
