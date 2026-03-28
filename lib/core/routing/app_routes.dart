import 'package:flutter/material.dart';
import 'package:marketi/core/routing/base_routes.dart';
import 'package:marketi/features/onboarding/presentation/view/onboarding.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signUp = '/sign-up';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    //
    //ignore: unused_local_variable
    final args = settings.arguments;
    switch (settings.name) {
      case onboarding:
        return BaseRoutes(
          page: const Onboarding(),
        );
      default:
        return BaseRoutes(
          page: const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
      // default:
      //   return BaseRoutes(page: const PageUnderBuildScreen());
    }
  }
}
