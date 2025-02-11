import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'feature_card.dart';

class FeaturesGrid extends StatelessWidget {
  final VoidCallback? onQuranTap;

  const FeaturesGrid({
    super.key,
    this.onQuranTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        FeatureCard(
          title: 'القرآن',
          icon: Icons.menu_book,
          color: AppColors.quranBrown,
          onTap: onQuranTap,
        ),
        FeatureCard(
          title: 'الفقه',
          icon: Icons.school,
          color: AppColors.quranGold,
          onTap: () {
            // TODO: Navigate to Fiqh feature
          },
        ),
        FeatureCard(
          title: 'الجزرية',
          icon: Icons.record_voice_over,
          color: AppColors.accent,
          onTap: () {
            // TODO: Navigate to Jazariyah feature
          },
        ),
        FeatureCard(
          title: 'التحفة',
          icon: Icons.auto_stories,
          color: AppColors.info,
          onTap: () {
            // TODO: Navigate to Tuhfa feature
          },
        ),
        FeatureCard(
          title: 'أخلاق المسلم',
          icon: Icons.favorite,
          color: AppColors.success,
          onTap: () {
            // TODO: Navigate to Muslim Ethics feature
          },
        ),
      ],
    );
  }
}
