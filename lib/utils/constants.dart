import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFFA62C2C);     // Deep red
  static const accent = Color(0xFFE83F25);      // Bright red-orange
  static const light = Color(0xFFEA7300);       // Vibrant orange
  static const background = Color(0xFFD3CA79);  // Warm gold/beige

  // Additional colors for better UI variety
  static const surface = Color(0xFFFFFBF5);     // Warm white
  static const onPrimary = Color(0xFFFFFFFF);   // White text on primary
  static const onBackground = Color(0xFF2D1B1B); // Dark brown for text
  static const shadow = Color(0x1A000000);      // Subtle shadow
}

class AppSpacing {
  static const screenPadding = EdgeInsets.all(20.0);  // Increased for modern look
  static const cardRadius = 16.0;                     // More rounded corners
  static const smallRadius = 8.0;                     // For smaller elements
  static const largeRadius = 24.0;                    // For prominent cards

  // Additional spacing options
  static const verticalSpacing = 16.0;
  static const horizontalSpacing = 12.0;
  static const compactPadding = EdgeInsets.all(8.0);
  static const cardPadding = EdgeInsets.all(16.0);
}

class AppTextStyle {
  static const title = TextStyle(
    fontWeight: FontWeight.w700,        // Bolder weight
    color: AppColors.primary,
    fontSize: 20,                       // Larger for impact
    letterSpacing: -0.5,               // Tighter spacing
  );

  static const subtitle = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.accent,
    fontSize: 16,
    letterSpacing: -0.2,
  );

  static const body = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.onBackground,
    fontSize: 14,
    height: 1.4,                       // Better line spacing
  );

  static const caption = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.light,
    fontSize: 12,
    letterSpacing: 0.2,
  );

  static const button = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.onPrimary,
    fontSize: 16,
    letterSpacing: 0.5,
  );
}

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        tertiary: AppColors.light,
        surface: AppColors.surface,
        background: AppColors.background,
        onPrimary: AppColors.onPrimary,
        onBackground: AppColors.onBackground,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyle.title.copyWith(
          color: AppColors.onPrimary,
          fontSize: 18,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 2,
        shadowColor: AppColors.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          textStyle: AppTextStyle.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.smallRadius),
          borderSide: BorderSide(color: AppColors.light.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.smallRadius),
          borderSide: BorderSide(color: AppColors.accent, width: 2),
        ),
      ),
    );
  }
}