
import 'package:flutter/material.dart';
import 'package:spotify/core/resourses/string_manager.dart';
import 'package:spotify/core/route/app_router.dart';
import 'package:spotify/core/route/routes.dart';
import 'package:spotify/core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringManager.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: Routes.splashPage,
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}