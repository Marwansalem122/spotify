import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark.dart';
import 'package:spotify/common/widget/button/basic_app_button.dart';
import 'package:spotify/controllers/signup_controller.dart';
import 'package:spotify/core/config/size_config.dart';
import 'package:spotify/core/resourses/assets_manager.dart';
import 'package:spotify/core/resourses/height_size_manager.dart';
import 'package:spotify/core/resourses/string_manager.dart';
import 'package:spotify/core/resourses/width_size_manager.dart';
import 'package:spotify/core/theme/app_color.dart';
import 'package:spotify/presentation/auth/widgets/custom_appbar_signin_and_signup.dart';
import 'package:spotify/presentation/auth/widgets/custom_text_form_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: SizeConfig.screenHeight! * HeightSizeManager.s24),
              CustomAppbarSigninAndSignup(onTap: () {
                SignupController().navigateToSignInOrSignUpPage(context);
              }),
              SizedBox(
                  height: SizeConfig.screenHeight! * HeightSizeManager.s80),
              Text(StringManager.register,
                  style: TextStyle(
                      fontSize: 26,
                      color: context.isDark ? Colors.white : Colors.black)),
              SizedBox(
                  height: SizeConfig.screenHeight! * HeightSizeManager.s15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(StringManager.registerSubTitle,
                      style: TextStyle(fontSize: 12, color: AppColor.grey)),
                  InkWell(
                    onTap: () {},
                    child: Text(StringManager.clickHere,
                        style: TextStyle(
                            fontSize: 12,
                            color: context.isDark
                                ? AppColor.primaryDark
                                : AppColor.primary)),
                  ),
                ],
              ),
              SizedBox(
                  height: SizeConfig.screenHeight! * HeightSizeManager.s32),
              CustomTextFormField(
                hintText: "Full Name",
                isSecurse: false,
              ),
              SizedBox(
                  height: SizeConfig.screenHeight! * HeightSizeManager.s16),
              CustomTextFormField(
                hintText: "Enter Email",
                isSecurse: false,
              ),
              SizedBox(
                  height: SizeConfig.screenHeight! * HeightSizeManager.s16),
              CustomTextFormField(
                hintText: "Password",
                isSecurse: true,
              ),
              SizedBox(
                  height: SizeConfig.screenHeight! * HeightSizeManager.s32),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth! * WidthSizeManager.s36),
                child: BasicAppButton(
                  onPressed: () {},
                  title: 'Create Account',
                  textColor: Colors.white,
                ),
              ),
              SizedBox(
                  height: SizeConfig.screenHeight! * HeightSizeManager.s32),
              const Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: AppColor.grey,
                      thickness: 1.5,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Or"),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColor.grey,
                      thickness: 1.5,
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: SizeConfig.screenHeight! * HeightSizeManager.s24),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(
                    onPressed: () {},
                    icon: const Image(
                        width: 50,
                        image: AssetImage(AssetsManager.googleIcon))),
                SizedBox(
                  width: SizeConfig.screenWidth! * WidthSizeManager.s30,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Image(
                        color: context.isDark ? Colors.white : Colors.black,
                        width: 50,
                        image: const AssetImage(AssetsManager.macIcon))),
              ]),
              SizedBox(
                  height: SizeConfig.screenHeight! * HeightSizeManager.s21),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(StringManager.haveAccount,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: context.isDark
                              ? AppColor.hintTextFormField
                              : Colors.black,
                          fontSize: 14)),
                  InkWell(
                    onTap: () {
                      SignupController().navigateToSignInPage(context);
                    },
                    child: const Text(StringManager.signIn,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                            fontSize: 14)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
