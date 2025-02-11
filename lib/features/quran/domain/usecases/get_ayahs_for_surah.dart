import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/quran_repository.dart';

class GetAyahsForSurah implements UseCase<List<String>, SurahParams> {
  final QuranRepository repository;

  GetAyahsForSurah(this.repository);

  @override
  Future<Either<Failure, List<String>>> call(SurahParams params) async {
    return await repository.getAyahsForSurah(params.surahNumber);
  }
}

class SurahParams extends Equatable {
  final int surahNumber;

  const SurahParams({required this.surahNumber});

  @override
  List<Object> get props => [surahNumber];
}
