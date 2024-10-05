import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/navigate_extensions.dart';
import 'package:spotify/core/route/routes.dart';

class SigninOrSignupController {
  void navigateToChooseModePge(BuildContext context) {
    context.pushReplacementNamed(Routes.chooseModePage);
  }
  void navigateToSignUpPage(BuildContext context) {
    context.pushNamed(Routes.signUpPage);
  }
  void navigateToSignInPage(BuildContext context) {
    context.pushNamed(Routes.signInPage);
  }
}
