import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/tafseer_repository.dart';

class GetAyahTafseer implements UseCase<String, AyahTafseerParams> {
  final TafseerRepository repository;

  GetAyahTafseer(this.repository);

  @override
  Future<Either<Failure, String>> call(AyahTafseerParams params) async {
    return await repository.getAyahTafseer(
        params.surahNumber, params.ayahNumber);
  }
}

class AyahTafseerParams extends Equatable {
  final int surahNumber;
  final int ayahNumber;

  const AyahTafseerParams({
    required this.surahNumber,
    required this.ayahNumber,
  });

  @override
  List<Object> get props => [surahNumber, ayahNumber];
}
