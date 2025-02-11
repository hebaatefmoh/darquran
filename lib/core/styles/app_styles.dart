import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppStyles {
  // Text Styles
  static TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static TextStyle headlineMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static TextStyle headlineSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static TextStyle titleLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // Button Styles
  static final ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.quranBrown,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    elevation: 2,
  );

  static final ButtonStyle secondaryButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.quranGold,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    elevation: 1,
  );

  // Card Styles
  static final BoxDecoration cardDecoration = BoxDecoration(
    color: AppColors.lightCard,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );

  // Input Decoration
  static InputDecoration get inputDecoration => InputDecoration(
        filled: true,
        fillColor: AppColors.lightCard,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppColors.hintText.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppColors.hintText.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppColors.quranBrown, width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        hintStyle: TextStyle(color: AppColors.hintText),
      );

  // Padding and Margin
  static const EdgeInsets paddingAll8 = EdgeInsets.all(8.0);
  static const EdgeInsets paddingAll16 = EdgeInsets.all(16.0);
  static const EdgeInsets paddingAll24 = EdgeInsets.all(24.0);
  static const EdgeInsets paddingH16 = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets paddingV16 = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets marginAll8 = EdgeInsets.all(8.0);
  static const EdgeInsets marginAll16 = EdgeInsets.all(16.0);
  static const EdgeInsets marginAll24 = EdgeInsets.all(24.0);
  static const EdgeInsets marginH16 = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets marginV16 = EdgeInsets.symmetric(vertical: 16);

  // Border Radius
  static const double borderRadius8 = 8.0;
  static const double borderRadius16 = 16.0;
  static const double borderRadius24 = 24.0;

  static final BorderRadius roundedBorder8 =
      BorderRadius.circular(borderRadius8);
  static final BorderRadius roundedBorder16 =
      BorderRadius.circular(borderRadius16);
  static final BorderRadius roundedBorder24 =
      BorderRadius.circular(borderRadius24);

  // Shadows
  static final List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];
}
