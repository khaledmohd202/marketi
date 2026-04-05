import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketi/core/di/dependency_injection.dart';
import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/services/cache/cache_helper.dart';
import 'package:marketi/marketi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper().init();

  await setupInjector();

  final token = CacheHelper().getData(key: ApiKey.token);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(
      MarketiApp(startRoute: token != null ? AppRoutes.main : AppRoutes.signIn),
    );
  });
}
