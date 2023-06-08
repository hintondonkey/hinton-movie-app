import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/index.dart';
import 'package:movie_app/data/local/index.dart';
import 'package:movie_app/data/net/index.dart';
import 'package:movie_app/data/remote/api/index.dart';
import 'package:movie_app/data/remote/base/index.dart';
import 'package:movie_app/data/repository/index.dart';
import 'package:movie_app/domain/provider/index.dart';
import 'package:movie_app/domain/repository/index.dart';
import 'package:movie_app/domain/use_case/index.dart';
import 'package:movie_app/presentation/page/home/index.dart';
import 'package:movie_app/presentation/page/login/index.dart';
import 'package:movie_app/presentation/page/movie_detail/index.dart';
import 'package:movie_app/presentation/utils/index.dart';

GetIt injector = GetIt.asNewInstance();

initInjector() {
  // Utils
  injector.registerLazySingleton<Connectivity>(() => Connectivity());
  injector.registerLazySingleton<EndPointProvider>(() => EndPointProvider());
  injector.registerLazySingleton<EnvironmentProvider>(
      () => EnvironmentProviderImpl());
  injector.registerLazySingleton<PushNotificationHandler>(
      () => PushNotificationHandler.shared);
  injector
      .registerLazySingleton<DeviceIdProvider>(() => DeviceIdProviderImpl());

  // Api
  injector.registerLazySingleton<ApiConfig>(() => ApiConfigImpl(
        injector(),
      ));
  injector.registerLazySingleton<NetworkStatus>(() => NetworkStatusImpl(
        injector(),
      ));
  injector.registerFactory<RequestHeaderBuilder>(() => RequestHeaderBuilder(
        injector(),
        injector(),
      ));
  injector.registerFactory<AuthApi>(() => AuthApiImpl());
  injector.registerFactory<MovieApi>(() => MovieApiImpl());

  // Cache
  injector
      .registerFactory<LocalDataStorage>(() => SharePreferenceStorageImpl());
  injector.registerLazySingleton<TokenCache>(() => AuthCacheImpl(
        injector(),
      ));
  injector.registerLazySingleton<SettingCache>(() => SettingCacheImpl(
        injector(),
      ));
  // Repository
  injector.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        injector(),
        injector(),
        injector(),
      ));
  injector.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
        injector(),
      ));

  // Bloc
  injector.registerFactory<LoginBloc>(() => LoginBloc());
  injector.registerFactory<HomeBloc>(() => HomeBloc(
        injector(),
        injector(),
      ));
  injector.registerFactory<MovieDetailBloc>(() => MovieDetailBloc(
        injector(),
      ));

  // Router
  injector.registerFactory<LoginRouter>(() => LoginRouter());
  injector.registerFactory<HomeRouter>(() => HomeRouter());
  injector.registerFactory<MovieDetailRouter>(() => MovieDetailRouter());

  // Use case
  injector.registerFactory<LogoutUseCase>(() => LogoutUseCaseImpl(
        injector(),
      ));
  injector.registerFactory<FetchMoviesUseCase>(() => FetchMoviesUseCaseImpl(
        injector(),
      ));
  injector.registerFactory<FetchMovieDetailUseCase>(
      () => FetchMovieDetailUseCaseImpl(
            injector(),
          ));
}
