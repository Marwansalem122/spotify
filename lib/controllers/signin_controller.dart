import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/navigate_extensions.dart';
import 'package:spotify/core/route/routes.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/domain/usecases/auth/signin_usecase.dart';
import 'package:spotify/service_locator.dart';

class SigninController {
  void navigateToSignUpPage(BuildContext context) {
    context.pushReplacementNamed(Routes.signUpPage);
  }

  void navigateToSignInOrSignUpPage(BuildContext context) {
    context.pushReplacementNamed(Routes.signInOrSignUpPage);
  }
   void signin(
      {required BuildContext context,
    
      required String email,
      required String password}) async {
    var result = await sl<SigninUsecase>().call(params: 
        SigninUserReq( email: email, password: password));
    result.fold((l) {
      var snakbar = SnackBar(content: Text(l));

      ScaffoldMessenger.of(context).showSnackBar(snakbar);
    }, (r) {
      context.pushNamedAndRemoveUntil(Routes.homePage);
    });
  }
}
