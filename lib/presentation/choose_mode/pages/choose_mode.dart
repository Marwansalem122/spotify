import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widget/button/basic_app_button.dart';
import 'package:spotify/controllers/choose_mode_controller.dart';
import 'package:spotify/core/config/size_config.dart';
import 'package:spotify/core/resourses/assets_manager.dart';
import 'package:spotify/core/resourses/height_size_manager.dart';
import 'package:spotify/core/resourses/string_manager.dart';
import 'package:spotify/core/resourses/width_size_manager.dart';
import 'package:spotify/core/theme/app_color.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

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
                image: AssetImage(AssetsManager.chooseModeBgImage),
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
                  SizedBox(
                    height: SizeConfig.screenHeight! * HeightSizeManager.s264,
                  ),
                  const Text(StringManager.chooseMode,
                      style: TextStyle(
                          color: AppColor.titleColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                      height: SizeConfig.screenHeight! * HeightSizeManager.s40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                width: SizeConfig.screenWidth! *
                                    WidthSizeManager.s80,
                                height: SizeConfig.screenHeight! *
                                    HeightSizeManager.s80,
                                decoration: BoxDecoration(
                                    color: AppColor.moonAndSunIconColor
                                        .withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(50)),
                                child: IconButton(
                                  onPressed: () {
                                    ChooseModeController()
                                        .chooseDarkTheme(context);
                                  },
                                  icon: SvgPicture.asset(AssetsManager.moon),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight! *
                                HeightSizeManager.s15,
                          ),
                          const Text(StringManager.darkMode,
                              style: TextStyle(
                                  color: AppColor.titleColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13))
                        ],
                      ),
                      Column(
                        children: [
                          ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                width: SizeConfig.screenWidth! *
                                    WidthSizeManager.s80,
                                height: SizeConfig.screenHeight! *
                                    HeightSizeManager.s80,
                                decoration: BoxDecoration(
                                    color: AppColor.moonAndSunIconColor
                                        .withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(50)),
                                child: IconButton(
                                  onPressed: () {
                                    ChooseModeController()
                                        .chooseLightTheme(context);
                                  },
                                  icon: SvgPicture.asset(AssetsManager.sun),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight! *
                                HeightSizeManager.s15,
                          ),
                          const Text(StringManager.lightMode,
                              style: TextStyle(
                                  color: AppColor.titleColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                      height: SizeConfig.screenHeight! * HeightSizeManager.s80),
                  BasicAppButton(
                    onPressed: () {
                      ChooseModeController()
                          .navigateToSignInOrSignUpPage(context);
                    },
                    title: StringManager.continueText,
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
