import 'package:flutter/material.dart';
import 'package:marketi/core/di/dependency_injection.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';
import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/services/cache/cache_helper.dart';

class AppLogout {
  factory AppLogout() {
    return _instance;
  }
  AppLogout._();

  static final AppLogout _instance = AppLogout._();

  Future<void> logout() async {
    // final navigator = Navigator.of(context);
    final context = sl<GlobalKey<NavigatorState>>().currentState!.context;
    // await SharedPref().removePreference(PrefKeys.accessToken);
    // await SharedPref().removePreference(PrefKeys.userId);
    // await SharedPref().removePreference(PrefKeys.userRole);
    // await HiveDatabase().clearAllBox();

    await CacheHelper().removeData(key: ApiKey.token);
    // await CacheHelper().removeData(key: ApiKey.user);

    if (!context.mounted) return;
    await context.pushNamedAndRemoveUntil(AppRoutes.signIn);
  }
}
