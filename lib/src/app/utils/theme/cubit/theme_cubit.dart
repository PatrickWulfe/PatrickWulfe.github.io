import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_project/src/app/utils/theme/theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({required this.useLightTheme}) : super(ThemeInitial());

  bool useLightTheme;

  ThemeData get currentTheme => useLightTheme ? lightThemeData : darkThemeData;

  ThemeData get lightTheme => lightThemeData;

  ThemeData get darkTheme => darkThemeData;
}
