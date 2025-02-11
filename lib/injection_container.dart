import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'features/quran/data/datasources/quran_remote_data_source.dart';
import 'features/quran/data/datasources/tafseer_remote_data_source.dart';
import 'features/quran/data/repositories/quran_repository_impl.dart';
import 'features/quran/data/repositories/tafseer_repository_impl.dart';
import 'features/quran/domain/repositories/quran_repository.dart';
import 'features/quran/domain/repositories/tafseer_repository.dart';
import 'features/quran/presentation/bloc/quran_bloc.dart';
import 'features/quran/domain/usecases/get_all_surahs.dart';
import 'features/quran/domain/usecases/get_ayahs_for_surah.dart';
import 'features/quran/domain/usecases/get_ayah_tafseer.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  sl.registerFactory(
    () => QuranBloc(
      repository: sl(),
      getAllSurahs: sl(),
      getAyahsForSurah: sl(),
      getAyahTafseer: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetAllSurahs(sl()));
  sl.registerLazySingleton(() => GetAyahsForSurah(sl()));
  sl.registerLazySingleton(() => GetAyahTafseer(sl()));

  // Repository
  sl.registerLazySingleton<QuranRepository>(
    () => QuranRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<TafseerRepository>(
    () => TafseerRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<QuranRemoteDataSource>(
    () => QuranRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<TafseerRemoteDataSource>(
    () => TafseerRemoteDataSourceImpl(client: sl()),
  );

  // External
  sl.registerLazySingleton(() => http.Client());
}
