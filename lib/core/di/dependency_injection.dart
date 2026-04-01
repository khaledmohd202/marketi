import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marketi/core/network/api_consumer.dart';
import 'package:marketi/core/network/dio_consumer.dart';
import 'package:marketi/features/auth/data/repo/sign_in_repo.dart';
import 'package:marketi/features/auth/data/repo/sign_up_repo.dart';
import 'package:marketi/features/auth/data/repo/user_repo.dart';
import 'package:marketi/features/auth/presentation/view_model/sign_in_cubit.dart';
import 'package:marketi/features/auth/presentation/view_model/sign_up_cubit.dart';
import 'package:marketi/features/auth/presentation/view_model/user_data_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initCore();
  await _initSignIn();
  await _initSignUp();
  await _initUserData();
}

Future<void> _initCore() async {
  sl
    ..registerLazySingleton(Dio.new)
    ..registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));
}

Future<void> _initSignUp() async {
  sl
    ..registerLazySingleton(() => SignUpRepo(api: sl()))
    ..registerFactory(() => SignUpCubit(sl()));
}

Future<void> _initSignIn() async {
  sl
    ..registerLazySingleton(() => SignInRepo(api: sl()))
    ..registerFactory(() => SignInCubit(sl()));
}

Future<void> _initUserData() async {
  sl
    ..registerLazySingleton(() => UserRepo(api: sl()))
    ..registerFactory(() => UserDataCubit(sl()));
}
