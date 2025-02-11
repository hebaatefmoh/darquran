import 'package:flutter/material.dart';

class AppColors {
  // الألوان الرئيسية
  static const Color quranBrown = Color(0xFFBE9B7B); // ذهبي فاتح
  static const Color quranGold = Color(0xFFE6B89C); // ذهبي وردي
  static const Color accent = Color(0xFFE4A5A5); // وردي هادئ

  // ألوان الخلفية
  static const Color background = Color(0xFFFFFBF5); // أبيض مائل للبيج
  static const Color surface = Color(0xFFFFF4E6); // بيج فاتح جداً
  static const Color headerBg = Color(0xFFFFE4D6); // وردي فاتح جداً
  static const Color ayahBg = Color(0xFFFFFFFF); // أبيض نقي
  static const Color lightCard = Color(0xFFFFFFFF); // أبيض نقي

  // ألوان النصوص
  static const Color textPrimary = Color(0xFF4A3B32); // بني غامق
  static const Color textSecondary = Color(0xFF8B7355); // بني فاتح
  static const Color hintText = Color(0xFFBEAB94); // بيج متوسط

  // ألوان المساعدة
  static const Color error = Color(0xFFE57373); // أحمر وردي
  static const Color success = Color(0xFFBEAB94); // بيج ذهبي
  static const Color info = Color(0xFFBE9B7B); // ذهبي فاتح
  static const Color dividerColor = Color(0xFFFFE4D6); // وردي فاتح جداً

  // التدرجات
  static List<Color> headerGradient = [
    const Color(0xFFFFE4D6), // وردي فاتح جداً
    const Color(0xFFFFFBF5), // أبيض مائل للبيج
  ];
}
