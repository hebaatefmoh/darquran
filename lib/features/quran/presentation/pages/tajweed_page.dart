import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';

class TajweedPage extends StatelessWidget {
  const TajweedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('علم التجويد'),
        centerTitle: true,
        backgroundColor: AppColors.headerBg,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            'أحكام النون الساكنة والتنوين',
            [
              'الإظهار الحلقي',
              'الإدغام بغنة وبغير غنة',
              'الإقلاب',
              'الإخفاء الحقيقي',
            ],
            'تعريف النون الساكنة والتنوين وأحكامهما',
          ),
          const SizedBox(height: 16),
          _buildSection(
            'أحكام الميم الساكنة',
            [
              'الإخفاء الشفوي',
              'الإدغام المثلي',
              'الإظهار الشفوي',
            ],
            'تعريف الميم الساكنة وأحكامها',
          ),
          const SizedBox(height: 16),
          _buildSection(
            'المدود',
            [
              'المد الطبيعي',
              'المد المتصل',
              'المد المنفصل',
              'مد البدل',
              'مد العوض',
              'مد اللين',
              'المد اللازم',
            ],
            'تعريف المد وأنواعه',
          ),
          const SizedBox(height: 16),
          _buildSection(
            'أحكام الراء',
            [
              'الراء المفخمة',
              'الراء المرققة',
              'جواز الوجهين',
            ],
            'تعريف أحكام الراء وحالاتها',
          ),
          const SizedBox(height: 16),
          _buildSection(
            'القلقلة',
            [
              'القلقلة الصغرى',
              'القلقلة الكبرى',
              'حروف القلقلة',
            ],
            'تعريف القلقلة وأنواعها',
          ),
          const SizedBox(height: 16),
          _buildSection(
            'التفخيم والترقيق',
            [
              'حروف الاستعلاء',
              'حروف الاستفال',
              'أحكام اللام في لفظ الجلالة',
            ],
            'تعريف التفخيم والترقيق وحالاتهما',
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<String> lessons, String description) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: AppFonts.arabicTitle.copyWith(
            color: AppColors.quranBrown,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          description,
          style: AppFonts.arabicBody.copyWith(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  lessons.map((lesson) => _buildLessonItem(lesson)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonItem(String lesson) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 8,
            color: AppColors.quranBrown,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              lesson,
              style: AppFonts.arabicBody.copyWith(
                color: AppColors.textPrimary,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
