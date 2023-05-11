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

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF8931B9),
  background: const Color(0xFF1A1C23),
  surface: const Color(0xFFFDF0ED),
  outline: const Color(0xFFF9CEC3),
);

final darkThemeData = ThemeData.dark(
  useMaterial3: true,
).copyWith(
  // colorScheme: addCommonColors(darkColorScheme),
  colorScheme: darkColorScheme,
  textTheme: getTextTheme(darkColorScheme.onSurface),
  extensions: [
    const GradientColors(
      firstColor: Color(0xFF16161C),
      secondColor: Color(0xFF1c1E26),
      thirdColor: Color(0xFF232530),
    )
  ],
);

final darkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFFB877DB),
  brightness: Brightness.dark,
  background: const Color(0xFF1A1C23),
  surface: const Color(0xFF2E303E),
  outline: const Color(0xFF6C6F93),
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

class GradientColors extends ThemeExtension<GradientColors> {
  const GradientColors({
    required this.firstColor,
    required this.secondColor,
    required this.thirdColor,
  });

  final Color? firstColor;
  final Color? secondColor;
  final Color? thirdColor;

  @override
  ThemeExtension<GradientColors> copyWith({
    Color? firstColor,
    Color? secondColor,
    Color? thirdColor,
  }) {
    return GradientColors(
      firstColor: firstColor ?? this.firstColor,
      secondColor: secondColor ?? this.secondColor,
      thirdColor: thirdColor ?? this.thirdColor,
    );
  }

  @override
  ThemeExtension<GradientColors> lerp(
    covariant ThemeExtension<GradientColors>? other,
    double t,
  ) {
    if (other is! GradientColors) {
      return this;
    }
    return GradientColors(
      firstColor: Color.lerp(firstColor, other.firstColor, t),
      secondColor: Color.lerp(secondColor, other.secondColor, t),
      thirdColor: Color.lerp(thirdColor, other.thirdColor, t),
    );
  }
}
