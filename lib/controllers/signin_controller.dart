import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/extensions.dart';
import 'package:spotify/core/route/routes.dart';

class SigninController {
  void navigateToSignUpPage(BuildContext context) {
    context.pushReplacementNamed(Routes.signUpPage);
  }

  void navigateToSignInOrSignUpPage(BuildContext context) {
    context.pushReplacementNamed(Routes.signInOrSignUpPage);
  }
}
