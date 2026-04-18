import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:marketi/core/di/dependency_injection.dart';
import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/services/cache/cache_helper.dart';
import 'package:marketi/core/theme/cubit/theme_cubit.dart';
import 'package:marketi/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:marketi/features/favorites/presentation/view_model/favorite_cubit.dart';
import 'package:marketi/marketi.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper().init();

  await setupInjector();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory(
            (await getApplicationDocumentsDirectory()).path,
          ),
  );

  Stripe.publishableKey = ApiKey.publishableKey;

  final token = CacheHelper().getData(key: ApiKey.token);

  final seenOnboarding = CacheHelper().getData(key: ApiKey.seenOnboarding);

  String startRoute;

  if (seenOnboarding == null) {
    startRoute = AppRoutes.onboarding;
  } else if (token != null) {
    startRoute = AppRoutes.main;
  } else {
    startRoute = AppRoutes.signIn;
  }

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<ThemeCubit>()),
          BlocProvider.value(value: sl<CartCubit>()),
          BlocProvider.value(value: sl<FavoriteCubit>()),
        ],
        child: MarketiApp(
          startRoute: startRoute,
        ),
      ),
    );
  });
}
