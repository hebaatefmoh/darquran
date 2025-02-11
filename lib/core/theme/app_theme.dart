import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: AppColors.quranBrown,
        secondary: AppColors.quranGold,
        tertiary: AppColors.accent,
        surface: AppColors.surface,
        background: AppColors.background,
        error: AppColors.error,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.textPrimary,
        onBackground: AppColors.textPrimary,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: AppColors.background,
      cardColor: AppColors.lightCard,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.headerBg,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
        ),
        titleTextStyle: AppFonts.arabicTitle.copyWith(
          color: AppColors.textPrimary,
          fontSize: 20,
        ),
      ),
      textTheme: TextTheme(
        displayLarge:
            AppFonts.arabicTitle.copyWith(color: AppColors.textPrimary),
        displayMedium:
            AppFonts.arabicTitle.copyWith(color: AppColors.textPrimary),
        displaySmall:
            AppFonts.arabicTitle.copyWith(color: AppColors.textPrimary),
        headlineLarge:
            AppFonts.arabicTitle.copyWith(color: AppColors.textPrimary),
        headlineMedium:
            AppFonts.arabicTitle.copyWith(color: AppColors.textPrimary),
        headlineSmall:
            AppFonts.arabicTitle.copyWith(color: AppColors.textPrimary),
        titleLarge: AppFonts.arabicBody.copyWith(color: AppColors.textPrimary),
        titleMedium: AppFonts.arabicBody.copyWith(color: AppColors.textPrimary),
        titleSmall: AppFonts.arabicBody.copyWith(color: AppColors.textPrimary),
        bodyLarge: AppFonts.arabicBody.copyWith(color: AppColors.textPrimary),
        bodyMedium: AppFonts.arabicBody.copyWith(color: AppColors.textPrimary),
        bodySmall: AppFonts.arabicBody.copyWith(color: AppColors.textSecondary),
      ),
      cardTheme: CardTheme(
        color: AppColors.lightCard,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: AppColors.dividerColor,
        thickness: 1,
        space: 32,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.quranBrown,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightCard,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.hintText.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.hintText.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.quranBrown, width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        hintStyle: TextStyle(color: AppColors.hintText),
      ),
    );
  }

  // يمكننا إضافة ثيم للوضع المظلم لاحقاً
  static ThemeData get darkTheme {
    // TODO: Implement dark theme
    return lightTheme;
  }
}
