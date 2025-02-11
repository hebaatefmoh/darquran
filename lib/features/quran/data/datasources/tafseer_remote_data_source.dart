import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class TafseerRemoteDataSource {
  Future<String> getAyahTafseer(int surahNumber, int ayahNumber);
}

class TafseerRemoteDataSourceImpl implements TafseerRemoteDataSource {
  final http.Client client;

  TafseerRemoteDataSourceImpl({required this.client});

  @override
  Future<String> getAyahTafseer(int surahNumber, int ayahNumber) async {
    try {
      final response = await client.get(
        Uri.parse(
            'http://api.quran-tafseer.com/tafseer/2/$surahNumber/$ayahNumber'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept-Language': 'ar',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['text'] ?? 'لا يوجد تفسير متاح';
      } else {
        throw Exception('فشل في تحميل التفسير');
      }
    } catch (e) {
      throw Exception('خطأ في الاتصال بالخادم');
    }
  }
}
