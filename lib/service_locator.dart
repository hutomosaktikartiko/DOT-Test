import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/error/interceptor_info.dart';
import 'core/network/network_info.dart';
import 'core/utils/preferences_info.dart';
import 'features/main/data/datasources/user_remote_data_source.dart';
import 'features/main/data/repositories/user_repository.dart';
import 'features/main/presentation/cubit/user/user_cubit.dart';
import 'shared/config/url_config.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Auth
  await _auth();

  // Main
  await _main();

  // Core
  await _core();

  // External
  await _external();
}

Future<void> _auth() async {
  // Datasource

  // Repository

  // Cubit
}

Future<void> _main() async {
  // Datasource
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(dio: sl()));

  // Repository
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(userRemoteDataSource: sl(), networkInfo: sl()));

  // Cubit
  sl.registerFactory(() => UserCubit(userRepository: sl()));
}

Future<void> _core() async {
  // NetworkInfo
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectivity: sl()));
  // PreferencesInfo
  sl.registerLazySingleton<PreferencesInfo>(
      () => PreferencesInfoImpl(shared: sl()));
}

Future<void> _external() async {
  // SharedPreferences
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  // Connectivity
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  // Dio
  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: UrlConfig.baseUrlApi,
        connectTimeout: 30000,
        receiveTimeout: 30000,
      ),
    )..interceptors.add(InterceptorInfo()),
  );
}
