import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ThemeName {
  light,
  dark,
}

extension SelectedThemeExtension on ThemeName {
  String get name => describeEnum(this);

  ThemeData get themeData {
    switch (this) {
      case ThemeName.dark:
        return darkThemeData;
      case ThemeName.light:
        return lightThemeData;
    }
  }
}

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
  // colorScheme: addCommonColors(darkColorScheme),
  colorScheme: darkColorScheme,
  textTheme: getTextTheme(darkColorScheme.onSurface),
);

final darkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xff00272b),
  brightness: Brightness.dark,
);

// Default text color needed for web deployment
TextTheme getTextTheme(Color defaultTextColor) => TextTheme(
      displayLarge: GoogleFonts.montserrat(
        color: defaultTextColor,
      ),
      displayMedium: GoogleFonts.montserrat(
        color: defaultTextColor,
      ),
      displaySmall: GoogleFonts.montserrat(
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
      bodyLarge: GoogleFonts.hindMadurai(
        color: defaultTextColor,
      ),
      bodyMedium: GoogleFonts.hindMadurai(
        color: defaultTextColor,
      ),
      bodySmall: GoogleFonts.hindMadurai(
        color: defaultTextColor,
      ),
      labelLarge: GoogleFonts.hindMadurai(
        color: defaultTextColor,
      ),
      labelMedium: GoogleFonts.hindMadurai(
        color: defaultTextColor,
      ),
      labelSmall: GoogleFonts.hindMadurai(
        color: defaultTextColor,
      ),
    );

ColorScheme addCommonColors(ColorScheme colorScheme) {
  return colorScheme.copyWith(
    primary: const Color(0xffff2ecc),
    secondary: const Color(0xffff6663),
  );
}
