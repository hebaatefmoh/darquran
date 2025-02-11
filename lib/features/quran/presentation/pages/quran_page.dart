import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';
import '../bloc/quran_bloc.dart';
import '../../../../injection_container.dart';
import 'surah_details_page.dart';
import '../../data/models/surah_model.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<QuranBloc>()..add(GetAllSurahsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('القرآن الكريم'),
          centerTitle: true,
          backgroundColor: AppColors.headerBg,
          elevation: 0,
        ),
        body: BlocBuilder<QuranBloc, QuranState>(
          builder: (context, state) {
            if (state is QuranLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.quranBrown,
                ),
              );
            } else if (state is SurahsLoaded) {
              return ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                itemCount: state.surahs.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final surah = state.surahs[index];
                  return _buildSurahCard(context, surah);
                },
              );
            } else if (state is QuranError) {
              return Center(
                child: Text(
                  state.message,
                  style: AppFonts.arabicBody.copyWith(
                    color: AppColors.error,
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.quranBrown,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSurahCard(BuildContext context, SurahModel surah) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SurahDetailsPage(surah: surah),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.quranBrown.withOpacity(0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.quranBrown,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    '${surah.number}',
                    style: AppFonts.arabicTitle.copyWith(
                      color: AppColors.quranBrown,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      surah.name,
                      style: AppFonts.arabicTitle.copyWith(
                        color: AppColors.textPrimary,
                        fontSize: 20,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '${surah.numberOfAyahs} آية',
                          style: AppFonts.arabicBody.copyWith(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.quranBrown.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            surah.revelationType,
                            style: AppFonts.arabicBody.copyWith(
                              color: AppColors.quranBrown,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
