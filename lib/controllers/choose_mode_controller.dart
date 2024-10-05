import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/navigate_extensions.dart';
import 'package:spotify/core/route/routes.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseModeController {
  void chooseLightTheme(BuildContext context) {
    context.read<ThemeCubit>().updateTheme(ThemeMode.light);
  }

  void chooseDarkTheme(BuildContext context) {
    context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
  }

  void navigateToSignInOrSignUpPage(BuildContext context) {
    context.pushNamed(Routes.signInOrSignUpPage);
  }
}
