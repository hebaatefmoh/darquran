import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class TafseerRepository {
  Future<Either<Failure, String>> getAyahTafseer(
      int surahNumber, int ayahNumber);
}
