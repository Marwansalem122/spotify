import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/extensions.dart';
import 'package:spotify/core/route/routes.dart';

class SignupController {
  void navigateToSignInPage(BuildContext context) {
    context.pushReplacementNamed(Routes.signInPage);
  }
   void navigateToSignInOrSignUpPage(BuildContext context) {
    context.pushReplacementNamed(Routes.signInOrSignUpPage);
  }
}
