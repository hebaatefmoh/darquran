import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/quran_repository.dart';
import '../../data/models/surah_model.dart';
import '../../domain/usecases/get_ayah_tafseer.dart';
import '../../domain/usecases/get_all_surahs.dart';
import '../../domain/usecases/get_ayahs_for_surah.dart';

// Events
abstract class QuranEvent extends Equatable {
  const QuranEvent();

  @override
  List<Object> get props => [];
}

class GetAllSurahsEvent extends QuranEvent {}

class GetAyahsForSurahEvent extends QuranEvent {
  final int surahNumber;

  const GetAyahsForSurahEvent(this.surahNumber);

  @override
  List<Object> get props => [surahNumber];
}

class GetAyahTafseerEvent extends QuranEvent {
  final int surahNumber;
  final int ayahNumber;

  const GetAyahTafseerEvent({
    required this.surahNumber,
    required this.ayahNumber,
  });

  @override
  List<Object> get props => [surahNumber, ayahNumber];
}

// States
abstract class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object> get props => [];
}

class QuranInitial extends QuranState {}

class QuranLoading extends QuranState {}

class SurahsLoaded extends QuranState {
  final List<SurahModel> surahs;

  const SurahsLoaded(this.surahs);

  @override
  List<Object> get props => [surahs];
}

class AyahsLoaded extends QuranState {
  final List<String> ayahs;

  const AyahsLoaded(this.ayahs);

  @override
  List<Object> get props => [ayahs];
}

class TafseerLoaded extends QuranState {
  final String tafseer;

  const TafseerLoaded(this.tafseer);

  @override
  List<Object> get props => [tafseer];
}

class QuranError extends QuranState {
  final String message;

  const QuranError(this.message);

  @override
  List<Object> get props => [message];
}

// BLoC
class QuranBloc extends Bloc<QuranEvent, QuranState> {
  final QuranRepository repository;
  final GetAllSurahs getAllSurahs;
  final GetAyahsForSurah getAyahsForSurah;
  final GetAyahTafseer getAyahTafseer;

  QuranBloc({
    required this.repository,
    required this.getAllSurahs,
    required this.getAyahsForSurah,
    required this.getAyahTafseer,
  }) : super(QuranInitial()) {
    on<GetAllSurahsEvent>(_onGetAllSurahs);
    on<GetAyahsForSurahEvent>(_onGetAyahsForSurah);
    on<GetAyahTafseerEvent>(_onGetAyahTafseer);
  }

  Future<void> _onGetAllSurahs(
      GetAllSurahsEvent event, Emitter<QuranState> emit) async {
    emit(QuranLoading());
    final result = await getAllSurahs(NoParams());
    result.fold(
      (failure) => emit(QuranError(_mapFailureToMessage(failure))),
      (surahs) => emit(SurahsLoaded(surahs)),
    );
  }

  Future<void> _onGetAyahsForSurah(
      GetAyahsForSurahEvent event, Emitter<QuranState> emit) async {
    emit(QuranLoading());
    final result =
        await getAyahsForSurah(SurahParams(surahNumber: event.surahNumber));
    result.fold(
      (failure) => emit(QuranError(_mapFailureToMessage(failure))),
      (ayahs) => emit(AyahsLoaded(ayahs)),
    );
  }

  Future<void> _onGetAyahTafseer(
      GetAyahTafseerEvent event, Emitter<QuranState> emit) async {
    emit(QuranLoading());
    final result = await getAyahTafseer(
      AyahTafseerParams(
        surahNumber: event.surahNumber,
        ayahNumber: event.ayahNumber,
      ),
    );
    result.fold(
      (failure) => emit(QuranError(_mapFailureToMessage(failure))),
      (tafseer) => emit(TafseerLoaded(tafseer)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'حدث خطأ في الاتصال بالخادم';
      case CacheFailure:
        return 'حدث خطأ في تخزين البيانات';
      case NetworkFailure:
        return 'حدث خطأ في الاتصال بالإنترنت';
      default:
        return 'حدث خطأ غير متوقع';
    }
  }
}
