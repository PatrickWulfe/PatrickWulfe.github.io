import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightThemeData = ThemeData.light(
  useMaterial3: true,
).copyWith(
  colorScheme: lightColorScheme,
  textTheme: getTextTheme(lightColorScheme.onSurface),
);

const lightColorScheme = ColorScheme.light();

final darkThemeData = ThemeData.dark(
  useMaterial3: true,
).copyWith(
  colorScheme: darkColorScheme,
  textTheme: getTextTheme(darkColorScheme.onSurface),
);

const darkColorScheme = ColorScheme.dark();

TextTheme getTextTheme(Color defaultTextColor) => TextTheme(
      displayLarge: GoogleFonts.josefinSans(
        color: defaultTextColor,
      ),
      displayMedium: GoogleFonts.josefinSans(
        color: defaultTextColor,
      ),
      displaySmall: GoogleFonts.josefinSans(
        color: defaultTextColor,
      ),
      headlineLarge: GoogleFonts.josefinSans(
        color: defaultTextColor,
      ),
      headlineMedium: GoogleFonts.josefinSans(
        color: defaultTextColor,
      ),
      headlineSmall: GoogleFonts.josefinSans(
        color: defaultTextColor,
      ),
      titleLarge: GoogleFonts.montserrat(
        color: defaultTextColor,
      ),
      titleMedium: GoogleFonts.montserrat(
        color: defaultTextColor,
      ),
      titleSmall: GoogleFonts.montserrat(
        color: defaultTextColor,
      ),
      bodyLarge: GoogleFonts.karma(
        color: defaultTextColor,
      ),
      bodyMedium: GoogleFonts.karma(
        color: defaultTextColor,
      ),
      bodySmall: GoogleFonts.karma(
        color: defaultTextColor,
      ),
      labelLarge: GoogleFonts.montserrat(
        color: defaultTextColor,
      ),
      labelMedium: GoogleFonts.montserrat(
        color: defaultTextColor,
      ),
      labelSmall: GoogleFonts.montserrat(
        color: defaultTextColor,
      ),
    );
