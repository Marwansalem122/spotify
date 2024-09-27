import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/extensions.dart';
import 'package:spotify/core/route/routes.dart';

class SplashController {
  void navigateToOnBoardingPage(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      context.pushReplacementNamed(Routes.onBoardingPage);
    });
  }
}
