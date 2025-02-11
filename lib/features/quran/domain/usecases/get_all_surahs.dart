import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/surah_model.dart';
import '../repositories/quran_repository.dart';

class GetAllSurahs implements UseCase<List<SurahModel>, NoParams> {
  final QuranRepository repository;

  GetAllSurahs(this.repository);

  @override
  Future<Either<Failure, List<SurahModel>>> call(NoParams params) async {
    return await repository.getAllSurahs();
  }
}

class NoParams {
  const NoParams();
}
