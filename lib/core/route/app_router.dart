import 'package:flutter/material.dart';
import 'package:spotify/core/route/routes.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/home/pages/home.dart';
import 'package:spotify/presentation/auth/pages/signin.dart';
import 'package:spotify/presentation/auth/pages/signin_or_signup.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';
import 'package:spotify/presentation/choose_mode/pages/choose_mode.dart';
import 'package:spotify/presentation/on_boarding/pages/on_boarding.dart';
import 'package:spotify/presentation/song_player/pages/song_player.dart';
import 'package:spotify/presentation/splash/pages/splash.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //  this arguments to be passed in any screen  like this (arguments & className)
    final argument = settings.arguments;

    switch (settings.name) {
      case Routes.splashPage:
        return materialPageBuilder(const SplashPage());
      case Routes.onBoardingPage:
        return materialPageBuilder(const OnBoardingPage());
      case Routes.chooseModePage:
        return materialPageBuilder(const ChooseModePage());
      case Routes.signInOrSignUpPage:
        return materialPageBuilder(const SignInOrSignUpPage());
      case Routes.signUpPage:
        return materialPageBuilder( SignUpPage());
      case Routes.signInPage:
        return materialPageBuilder( SignInPage());
      case Routes.homePage:
        return materialPageBuilder(const HomePage());
      case Routes.songPlayerPage:
        if(argument is SongEntity){
            return materialPageBuilder( SongPlayerPage(song: argument,));
       }else{
         return materialPageBuilder(const ErrorPage());
       }
      
      // case Routes.playMusicScreen:
      //  if(argument is Map<String,dynamic>){
      //    return materialPageBuilder( PlayMusicScreen(data:argument ));
      //  }else{
      //    return materialPageBuilder(const ErrorPage());
      //  }
      default:
        return materialPageBuilder(const ErrorPage());
    }
  }
}

dynamic materialPageBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: const Center(
        child: Text("Error"),
      ),
    );
  }
}
