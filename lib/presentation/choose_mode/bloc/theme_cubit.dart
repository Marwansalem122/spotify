import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';


class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);
  void updateTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    // Convert the JSON to ThemeMode. Ensure it matches the values stored in toJson.
    switch (json['theme'] as String?) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    // Convert the ThemeMode to JSON
    return {
      'theme': state == ThemeMode.light
          ? 'light'
          : state == ThemeMode.dark
              ? 'dark'
              : 'system',
    };
  }
}
