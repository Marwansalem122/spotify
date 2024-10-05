import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark.dart';
import 'package:spotify/common/widget/custom_arrow_back.dart';
import 'package:spotify/core/theme/app_color.dart';

class CustomAppBarGeneral extends StatelessWidget {
  final String title;
  double? fontSizeText;
  final IconData icon;
  final void Function() onTap;
   CustomAppBarGeneral({super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomArrowBack(
          onTap:onTap
        ),
        Text(title, style: TextStyle(fontSize: fontSizeText ?? 18)),
        IconButton(
            onPressed: () {},
            icon: Icon(icon,
                color:
                    context.isDark ? AppColor.grey : AppColor.lightBackground))
      ],
    );
  }
}
