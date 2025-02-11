import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/tafseer_repository.dart';
import '../datasources/tafseer_remote_data_source.dart';

class TafseerRepositoryImpl implements TafseerRepository {
  final TafseerRemoteDataSource remoteDataSource;

  TafseerRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> getAyahTafseer(
      int surahNumber, int ayahNumber) async {
    try {
      final tafseer =
          await remoteDataSource.getAyahTafseer(surahNumber, ayahNumber);
      return Right(tafseer);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
