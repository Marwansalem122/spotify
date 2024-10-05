import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/navigate_extensions.dart';
import 'package:spotify/core/route/routes.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/domain/usecases/auth/signup_usecase.dart';
import 'package:spotify/service_locator.dart';

class SignupController {
  void navigateToSignInPage(BuildContext context) {
    context.pushReplacementNamed(Routes.signInPage);
  }

  void navigateToSignInOrSignUpPage(BuildContext context) {
    context.pushReplacementNamed(Routes.signInOrSignUpPage);
  }

  void createAccount(
      {required BuildContext context,
      required String fullName,
      required String email,
      required String password}) async {
    var result = await sl<SignupUsecase>().call(params: 
        CreateUserReq(fullName: fullName, email: email, password: password));
    result.fold((l) {
      var snakbar = SnackBar(content: Text(l));

      ScaffoldMessenger.of(context).showSnackBar(snakbar);
    }, (r) {
      context.pushNamedAndRemoveUntil(Routes.homePage);
    });
  }
}
