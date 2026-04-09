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
import 'package:marketi/features/cart/data/repo/cart_repo.dart';
import 'package:marketi/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:marketi/features/home/data/repo/brands_repo.dart';
import 'package:marketi/features/home/data/repo/categories_repo.dart';
import 'package:marketi/features/home/data/repo/products_repo.dart';
import 'package:marketi/features/home/presentation/view_model/brands/brands_cubit.dart';
import 'package:marketi/features/home/presentation/view_model/categories/categories_cubit.dart';
import 'package:marketi/features/home/presentation/view_model/products/products_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initCore();
  await _initSignIn();
  await _initSignUp();
  await _initUserData();
  await _initProducts();
  await _initCategories();
  await _initBrands();
  await _initCart();
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

Future<void> _initProducts() async {
  sl
    ..registerLazySingleton(() => ProductsRepo(sl()))
    ..registerFactory(() => ProductsCubit(sl()));
}

Future<void> _initCategories() async {
  sl
    ..registerLazySingleton(() => CategoriesRepo(sl()))
    ..registerFactory(() => CategoriesCubit(sl()));
}

Future<void> _initBrands() async {
  sl
    ..registerLazySingleton(() => BrandsRepo(sl()))
    ..registerFactory(() => BrandsCubit(sl()));
}

Future<void> _initCart() async {
  sl
    ..registerLazySingleton(() => CartRepo(sl()))
    ..registerFactory(() => CartCubit(sl()));
}
