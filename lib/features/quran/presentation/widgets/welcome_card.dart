import 'package:flutter/material.dart';
import '../../../../core/styles/app_styles.dart';
import '../../../../core/theme/app_colors.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: AppStyles.roundedBorder16,
      ),
      child: Padding(
        padding: AppStyles.paddingAll16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'مرحباً بك في ختمة القرآن',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: AppColors.quranBrown,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'ابدأ رحلتك الروحانية مع القراءة اليومية للقرآن الكريم',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
