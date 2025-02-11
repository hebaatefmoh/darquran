import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/surah_model.dart';

abstract class QuranRepository {
  Future<Either<Failure, List<SurahModel>>> getAllSurahs();
  Future<Either<Failure, List<String>>> getAyahsForSurah(int surahNumber);
}
