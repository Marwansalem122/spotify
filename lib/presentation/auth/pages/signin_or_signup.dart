import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/is_dark.dart';
import 'package:spotify/common/widget/button/basic_app_button.dart';
import 'package:spotify/controllers/signin_or_signup_controller.dart';
import 'package:spotify/core/config/size_config.dart';
import 'package:spotify/core/resourses/assets_manager.dart';
import 'package:spotify/core/resourses/height_size_manager.dart';
import 'package:spotify/core/resourses/string_manager.dart';
import 'package:spotify/core/resourses/width_size_manager.dart';
import 'package:spotify/core/theme/app_color.dart';
import 'package:spotify/presentation/auth/widgets/app_bar.dart';

class SignInOrSignUpPage extends StatelessWidget {
  const SignInOrSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          CustomAppBar(onTap: () {
            SigninOrSignupController().navigateToChooseModePge(context);
          }),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              AssetsManager.topPattern,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              AssetsManager.authBgImage,
              width: 370,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight! * 0.2),
                SvgPicture.asset(
                  AssetsManager.logo,
                  width: SizeConfig.screenWidth! * WidthSizeManager.s225,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * HeightSizeManager.s21,
                ),
                Text(
                  StringManager.title,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: context.isDark ? Colors.white : Colors.black),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * HeightSizeManager.s15,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  StringManager.subTitleSignInOrSignUp,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColor.hintTextFormField),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * HeightSizeManager.s15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.screenWidth! * WidthSizeManager.s22f5,
                    ),
                    Expanded(
                      child: BasicAppButton(
                          height:
                              SizeConfig.screenHeight! * HeightSizeManager.s70,
                          onPressed: () {
                            SigninOrSignupController()
                                .navigateToSignUpPage(context);
                          },
                          title: StringManager.register,
                          textColor: Colors.white),
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * WidthSizeManager.s112f5,
                    ),
                    Expanded(
                      child: BasicAppButton(
                        height:
                            SizeConfig.screenHeight! * HeightSizeManager.s70,
                        onPressed: () {
                          SigninOrSignupController()
                              .navigateToSignInPage(context);
                        },
                        title: StringManager.signIn,
                        textColor: context.isDark ? Colors.white : Colors.black,
                        buttonColor: context.isDark
                            ? AppColor.darkBackground
                            : AppColor.lightBackground,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
