import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  // Arabic Fonts
  static final TextStyle arabicTitle = GoogleFonts.cairo(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle arabicBody = GoogleFonts.cairo(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle quranText = GoogleFonts.amiri(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    height: 2.0,
  );

  // English Fonts
  static final TextStyle englishTitle = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle englishBody = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  // Helper method to apply Arabic font family
  static TextStyle withArabicFont(TextStyle style) {
    return GoogleFonts.cairo(
      fontSize: style.fontSize,
      fontWeight: style.fontWeight,
      color: style.color,
      height: style.height,
    );
  }

  // Helper method to apply English font family
  static TextStyle withEnglishFont(TextStyle style) {
    return GoogleFonts.poppins(
      fontSize: style.fontSize,
      fontWeight: style.fontWeight,
      color: style.color,
      height: style.height,
    );
  }
}
