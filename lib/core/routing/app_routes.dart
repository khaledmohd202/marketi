import 'package:flutter/material.dart';
import 'package:marketi/core/routing/base_routes.dart';
import 'package:marketi/features/auth/presentation/view/forgot_password_with_email.dart';
import 'package:marketi/features/auth/presentation/view/forgot_password_with_phone.dart';
import 'package:marketi/features/auth/presentation/view/log_in.dart';
import 'package:marketi/features/auth/presentation/view/sign_up.dart';
import 'package:marketi/features/auth/presentation/view/verification_code_with_email.dart';
import 'package:marketi/features/auth/presentation/view/verification_code_with_phone.dart';
import 'package:marketi/features/onboarding/presentation/view/onboarding.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signUp = '/sign-up';
  static const String forgotPasswordWithEmail = '/forgot-password-with-email';
  static const String forgotPasswordWithPhone = '/forgot-password-with-phone';
  static const String verificationCodeWithEmail = '/verification-code-with-email';
  static const String verificationCodeWithPhone = '/verification-code-with-phone';
  static Route<void> onGenerateRoute(RouteSettings settings) {
    //
    //ignore: unused_local_variable
    final args = settings.arguments;
    switch (settings.name) {
      case onboarding:
        return BaseRoutes(
          page: const Onboarding(),
        );
      case login:
        return BaseRoutes(
          page: const LogIn(),
        );
      case signUp:
        return BaseRoutes(
          page: const SignUp(),
        );
      case forgotPasswordWithEmail:
        return BaseRoutes(
          page: const ForgotPasswordWithEmail(),
        );
      case forgotPasswordWithPhone:
        return BaseRoutes(
          page: const ForgotPasswordWithPhone(),
        );
      case verificationCodeWithEmail:
        return BaseRoutes(
          page: const VerificationCodeWithEmail(),
        );
      case verificationCodeWithPhone:
        return BaseRoutes(
          page: const VerificationCodeWithPhone(),
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
