import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/quran_repository.dart';
import '../datasources/quran_remote_data_source.dart';
import '../models/surah_model.dart';

class QuranRepositoryImpl implements QuranRepository {
  final QuranRemoteDataSource remoteDataSource;

  QuranRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<SurahModel>>> getAllSurahs() async {
    try {
      final surahs = await remoteDataSource.getAllSurahs();
      return Right(surahs);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getAyahsForSurah(
      int surahNumber) async {
    try {
      final ayahs = await remoteDataSource.getAyahsForSurah(surahNumber);
      return Right(ayahs);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
