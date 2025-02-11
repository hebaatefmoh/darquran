import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/surah_model.dart';

abstract class QuranRemoteDataSource {
  Future<List<SurahModel>> getAllSurahs();
  Future<List<String>> getAyahsForSurah(int surahNumber);
}

class QuranRemoteDataSourceImpl implements QuranRemoteDataSource {
  final http.Client client;

  QuranRemoteDataSourceImpl({required this.client});

  @override
  Future<List<SurahModel>> getAllSurahs() async {
    final response = await client.get(
      Uri.parse('http://api.alquran.cloud/v1/surah'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> surahsData = jsonData['data'];
      return surahsData.map((surah) => SurahModel.fromJson(surah)).toList();
    } else {
      throw Exception('Failed to load surahs');
    }
  }

  @override
  Future<List<String>> getAyahsForSurah(int surahNumber) async {
    try {
      final response = await client.get(
        Uri.parse('https://api.alquran.cloud/v1/surah/$surahNumber/ar.alafasy'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['code'] == 200 && data['data'] != null) {
          final ayahs = data['data']['ayahs'] as List;
          return ayahs.map((ayah) => ayah['text'] as String).toList();
        }
      }
      throw Exception('فشل في تحميل الآيات');
    } catch (e) {
      throw Exception('خطأ في الاتصال بالخادم');
    }
  }
}
