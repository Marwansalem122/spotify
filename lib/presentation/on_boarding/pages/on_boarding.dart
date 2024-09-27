import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widget/button/basic_app_button.dart';
import 'package:spotify/controllers/on_board_controller.dart';
import 'package:spotify/core/config/size_config.dart';
import 'package:spotify/core/resourses/assets_manager.dart';
import 'package:spotify/core/resourses/height_size_manager.dart';
import 'package:spotify/core/resourses/string_manager.dart';
import 'package:spotify/core/resourses/width_size_manager.dart';
import 'package:spotify/core/theme/app_color.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth! * WidthSizeManager.s45,
                  vertical: SizeConfig.screenHeight! * HeightSizeManager.s45),
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AssetsManager.intoBgImage),
              )),
            ),
            Container(
              color: Colors.black.withOpacity(0.15),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth! * WidthSizeManager.s45,
                  vertical: SizeConfig.screenHeight! * HeightSizeManager.s45),
              child: Column(
                children: [
                  SvgPicture.asset(
                    AssetsManager.logo,
                    width: SizeConfig.screenWidth! * WidthSizeManager.s225,
                  ),
                  const Spacer(),
                  const Text(StringManager.titleOnBoarding,
                      style: TextStyle(
                          color: AppColor.titleColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                      height: SizeConfig.screenHeight! * HeightSizeManager.s21),
                  const Text(StringManager.subTitleOnBoarding,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColor.subTitleColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 13)),
                  SizedBox(
                      height: SizeConfig.screenHeight! * HeightSizeManager.s21),
                  BasicAppButton(
                    onPressed: () {
                      OnBoardController().navigateToChooseModePage(context);
                    },
                    title: StringManager.getStarted,
                    textColor: AppColor.titleColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
