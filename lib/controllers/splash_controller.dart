import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/navigate_extensions.dart';
import 'package:spotify/core/route/routes.dart';

class SplashController {
  void navigateToOnBoardingPage(BuildContext context) {
     User? user = FirebaseAuth.instance.currentUser;
    Future.delayed(const Duration(seconds: 2), () {
       
 context.pushReplacementNamed(Routes.onBoardingPage);

//   if (user != null) {
//     // User is signed in
//  context.pushReplacementNamed(Routes.homePage);
//   } else {
//     // No user is signed in
//  context.pushReplacementNamed(Routes.onBoardingPage);

//   }
    });
  }
}
