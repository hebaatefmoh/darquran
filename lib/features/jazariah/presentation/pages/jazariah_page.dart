import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';

class JazariahPage extends StatelessWidget {
  const JazariahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text('متن الجزرية'),
          centerTitle: true,
          backgroundColor: AppColors.headerBg,
          elevation: 0,
          bottom: TabBar(
            indicatorColor: AppColors.quranBrown,
            labelColor: AppColors.quranBrown,
            unselectedLabelColor: AppColors.textSecondary,
            tabs: const [
              Tab(text: 'المتن'),
              Tab(text: 'الشرح'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildMatnView(),
            _buildSharhView(),
          ],
        ),
      ),
    );
  }

  Widget _buildMatnView() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildVerse(
          'يَقُولُ رَاجِي رَحْمَةِ الْغَفُورِ ... مُحَمَّدٌ هُوَ ابْنُ الْجَزَرِي',
          'المقدمة',
        ),
        _buildVerse(
          'الْحَمْدُ لِلَّهِ عَلَى مَا يَسَّرَا ... مِنْ عِلْمِ رَسْمِ الْخَطِّ وَالْقِرَا',
          'الحمد والثناء',
        ),
        // ... المزيد من الأبيات
      ],
    );
  }

  Widget _buildSharhView() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildExplanation(
          'شرح المقدمة',
          'يبدأ الناظم رحمه الله تعالى منظومته بذكر اسمه وكنيته، فيقول: يقول راجي رحمة الغفور محمد هو ابن الجزري...',
        ),
        _buildExplanation(
          'شرح الحمد والثناء',
          'ثم يبدأ بحمد الله تعالى على ما يسر من علم رسم الخط والقراءة...',
        ),
        // ... المزيد من الشروحات
      ],
    );
  }

  Widget _buildVerse(String text, String title) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
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
              style: AppFonts.arabicBody.copyWith(
                color: AppColors.quranBrown,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: AppFonts.arabicTitle.copyWith(
                color: AppColors.textPrimary,
                fontSize: 20,
                height: 2,
              ),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExplanation(String title, String explanation) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
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
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              explanation,
              style: AppFonts.arabicBody.copyWith(
                color: AppColors.textPrimary,
                fontSize: 16,
                height: 1.8,
              ),
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    );
  }
}
