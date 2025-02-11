import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';

class FiqhPage extends StatelessWidget {
  const FiqhPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('الفقه الإسلامي'),
        centerTitle: true,
        backgroundColor: AppColors.headerBg,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'اختر المذهب',
              style: AppFonts.arabicTitle.copyWith(
                color: AppColors.textPrimary,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            _buildMadhabCard(
              context,
              'المذهب الحنفي',
              'الإمام أبو حنيفة النعمان',
              Icons.mosque,
              () => _navigateToMadhabContent(context, 'hanafi'),
            ),
            const SizedBox(height: 16),
            _buildMadhabCard(
              context,
              'المذهب المالكي',
              'الإمام مالك بن أنس',
              Icons.mosque,
              () => _navigateToMadhabContent(context, 'maliki'),
            ),
            const SizedBox(height: 16),
            _buildMadhabCard(
              context,
              'المذهب الشافعي',
              'الإمام محمد بن إدريس الشافعي',
              Icons.mosque,
              () => _navigateToMadhabContent(context, 'shafii'),
            ),
            const SizedBox(height: 16),
            _buildMadhabCard(
              context,
              'المذهب الحنبلي',
              'الإمام أحمد بن حنبل',
              Icons.mosque,
              () => _navigateToMadhabContent(context, 'hanbali'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMadhabCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.quranBrown.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: AppColors.quranBrown,
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppFonts.arabicTitle.copyWith(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: AppFonts.arabicBody.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.textSecondary,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToMadhabContent(BuildContext context, String madhab) {
    // TODO: التنقل إلى صفحة محتوى المذهب
  }
}
