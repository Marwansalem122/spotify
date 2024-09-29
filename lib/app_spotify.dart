import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/resourses/string_manager.dart';
import 'package:spotify/core/route/app_router.dart';
import 'package:spotify/core/route/routes.dart';
import 'package:spotify/core/theme/app_theme.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp(
            title: StringManager.appTitle,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: mode,
            initialRoute: Routes.splashPage,
            onGenerateRoute: AppRouter().generateRoute,
          );
        },
      ),
    );
  }
}
