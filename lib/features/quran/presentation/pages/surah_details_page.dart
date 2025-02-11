import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';
import '../bloc/quran_bloc.dart';
import '../../../../injection_container.dart';
import '../../data/models/surah_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SurahDetailsPage extends StatefulWidget {
  final SurahModel surah;

  const SurahDetailsPage({super.key, required this.surah});

  @override
  State<SurahDetailsPage> createState() => _SurahDetailsPageState();
}

class _SurahDetailsPageState extends State<SurahDetailsPage> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  int? currentPlayingAyah;

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playAudio(int ayahNumber) async {
    final formattedSurah = widget.surah.number.toString().padLeft(3, '0');
    final formattedAyah = ayahNumber.toString().padLeft(3, '0');
    final url =
        'https://www.everyayah.com/data/Husary_128kbps/$formattedSurah$formattedAyah.mp3';

    if (currentPlayingAyah == ayahNumber && isPlaying) {
      await audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      setState(() {
        currentPlayingAyah = ayahNumber;
        isPlaying = true;
      });

      await audioPlayer.play(UrlSource(url));

      audioPlayer.onPlayerComplete.listen((event) {
        setState(() {
          isPlaying = false;
          currentPlayingAyah = null;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<QuranBloc>()..add(GetAyahsForSurahEvent(widget.surah.number)),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(widget.surah.name),
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
            } else if (state is AyahsLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildSurahInfo(),
                    const SizedBox(height: 24),
                    _buildAyahsList(state.ayahs),
                  ],
                ),
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
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildSurahInfo() {
    return Card(
      color: AppColors.lightCard,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              widget.surah.name,
              style: AppFonts.arabicTitle.copyWith(
                color: AppColors.quranBrown,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${widget.surah.numberOfAyahs} آية - ${widget.surah.revelationType}',
              style: AppFonts.arabicBody.copyWith(
                color: AppColors.textSecondary,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAyahOptions(BuildContext context, int ayahNumber, String ayahText) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(top: 8, bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                ayahText,
                style: AppFonts.quranText.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.menu_book, color: AppColors.quranBrown),
              title: Text(
                'تفسير الآية',
                style: AppFonts.arabicBody.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                _showTafseer(context, ayahNumber);
              },
            ),
            ListTile(
              leading: Icon(
                currentPlayingAyah == ayahNumber && isPlaying
                    ? Icons.pause
                    : Icons.play_arrow,
                color: AppColors.quranBrown,
              ),
              title: Text(
                'استماع بصوت الشيخ الحصري',
                style: AppFonts.arabicBody.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                _playAudio(ayahNumber);
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildAyahsList(List<String> ayahs) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.ayahBg,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Wrap(
        textDirection: TextDirection.rtl,
        spacing: 4,
        runSpacing: 16,
        children: List.generate(ayahs.length, (index) {
          return GestureDetector(
            onTap: () => _showAyahOptions(context, index + 1, ayahs[index]),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  ayahs[index],
                  style: AppFonts.quranText.copyWith(
                    color: currentPlayingAyah == index + 1
                        ? AppColors.quranBrown
                        : AppColors.textPrimary,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.quranBrown.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${index + 1}',
                    style: AppFonts.arabicBody.copyWith(
                      color: AppColors.quranBrown,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Future<String?> _getTafseer(
      int surahNumber, int ayahNumber, String tafseerType) async {
    try {
      final tafseerEndpoints = {
        'ibn-kathir':
            'http://api.quran-tafseer.com/tafseer/1/$surahNumber/$ayahNumber',
        'tabari':
            'http://api.quran-tafseer.com/tafseer/2/$surahNumber/$ayahNumber',
        'qurtubi':
            'http://api.quran-tafseer.com/tafseer/3/$surahNumber/$ayahNumber',
      };

      final response = await sl<http.Client>().get(
        Uri.parse(tafseerEndpoints[tafseerType]!),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['text'];
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  void _showTafseer(BuildContext context, int ayahNumber) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return DraggableScrollableSheet(
            initialChildSize: 0.75,
            minChildSize: 0.5,
            maxChildSize: 0.95,
            builder: (_, controller) => Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.headerBg,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'تفسير الآية ${ayahNumber}',
                              style: AppFonts.arabicTitle.copyWith(
                                color: AppColors.textPrimary,
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.close),
                              color: AppColors.textPrimary,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildTafseerOption(
                                'تفسير ابن كثير',
                                'ibn-kathir',
                                setState,
                              ),
                              const SizedBox(width: 8),
                              _buildTafseerOption(
                                'تفسير الطبري',
                                'tabari',
                                setState,
                              ),
                              const SizedBox(width: 8),
                              _buildTafseerOption(
                                'تفسير القرطبي',
                                'qurtubi',
                                setState,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: _getTafseer(
                          widget.surah.number, ayahNumber, selectedTafseer),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError || snapshot.data == null) {
                          return Center(
                            child: Text(
                              'حدث خطأ في تحميل التفسير',
                              style: AppFonts.arabicBody.copyWith(
                                color: AppColors.error,
                              ),
                            ),
                          );
                        }
                        return ListView(
                          controller: controller,
                          padding: const EdgeInsets.all(16),
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppColors.quranBrown.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                snapshot.data!,
                                style: AppFonts.arabicBody.copyWith(
                                  color: AppColors.textPrimary,
                                  height: 1.8,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.justify,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String selectedTafseer = 'ibn-kathir';

  Widget _buildTafseerOption(String title, String value, StateSetter setState) {
    final isSelected = selectedTafseer == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTafseer = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.quranBrown
              : AppColors.quranBrown.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: AppFonts.arabicBody.copyWith(
            color: isSelected ? Colors.white : AppColors.quranBrown,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
