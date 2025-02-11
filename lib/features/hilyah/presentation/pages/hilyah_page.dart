import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';

class HilyahPage extends StatelessWidget {
  const HilyahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('حلية طالب العلم'),
        centerTitle: true,
        backgroundColor: AppColors.headerBg,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            'آداب طالب العلم',
            [
              'الإخلاص في طلب العلم',
              'التواضع والأدب مع العلماء',
              'الصبر والمثابرة في التحصيل',
              'العمل بما تعلم',
              'حسن السؤال والاستماع',
            ],
          ),
          const SizedBox(height: 16),
          _buildSection(
            'مراحل طلب العلم',
            [
              'حفظ القرآن الكريم',
              'تعلم العقيدة الصحيحة',
              'تعلم الفقه وأحكام العبادات',
              'دراسة السيرة النبوية',
              'تعلم اللغة العربية وعلومها',
            ],
          ),
          const SizedBox(height: 16),
          _buildSection(
            'الكتب المهمة للطالب',
            [
              'القرآن الكريم وتفسيره',
              'كتب الحديث الأساسية',
              'متون العقيدة',
              'كتب الفقه المعتمدة',
              'كتب السيرة والتاريخ',
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<String> items) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppFonts.arabicTitle.copyWith(
                color: AppColors.quranBrown,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            ...items
                .map((item) => Padding(
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
                              item,
                              style: AppFonts.arabicBody.copyWith(
                                color: AppColors.textPrimary,
                                fontSize: 16,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}
