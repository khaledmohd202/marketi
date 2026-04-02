import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/dependency_injection.dart';
import 'package:marketi/core/routing/base_routes.dart';
import 'package:marketi/features/auth/presentation/view/create_new_password.dart';
import 'package:marketi/features/auth/presentation/view/forgot_password_with_email.dart';
import 'package:marketi/features/auth/presentation/view/forgot_password_with_phone.dart';
import 'package:marketi/features/auth/presentation/view/reset_password_done.dart';
import 'package:marketi/features/auth/presentation/view/sign_in.dart';
import 'package:marketi/features/auth/presentation/view/sign_up.dart';
import 'package:marketi/features/auth/presentation/view/verification_code_with_email.dart';
import 'package:marketi/features/auth/presentation/view/verification_code_with_phone.dart';
import 'package:marketi/features/auth/presentation/view_model/sign_in_cubit.dart';
import 'package:marketi/features/auth/presentation/view_model/sign_up_cubit.dart';
import 'package:marketi/features/cart/presentation/view/cart_view.dart';
import 'package:marketi/features/favorites/presentation/view/favorites_view.dart';
import 'package:marketi/features/home/presentation/view/home_view.dart';
import 'package:marketi/features/main/presentation/view/main_view.dart';
import 'package:marketi/features/menu/presentation/view/menu_view.dart';
import 'package:marketi/features/onboarding/presentation/view/onboarding.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signUp = '/sign-up';
  static const String forgotPasswordWithEmail = '/forgot-password-with-email';
  static const String forgotPasswordWithPhone = '/forgot-password-with-phone';
  static const String verificationCodeWithEmail =
      '/verification-code-with-email';
  static const String verificationCodeWithPhone =
      '/verification-code-with-phone';
  static const String createNewPassword = '/create-new-password';
  static const String resetPasswordDone = '/reset-password-done';
  static const String home = '/home';
  static const String cart = '/cart';
  static const String favorites = '/favorites';
  static const String menu = '/menu';
  static const String main = '/main';
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
          page: BlocProvider(
            create: (context) => sl<SignInCubit>(),
            child: const SignIn(),
          ),
        );
      case signUp:
        return BaseRoutes(
          page: BlocProvider(
            create: (context) => sl<SignUpCubit>(),
            child: const SignUp(),
          ),
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
      case createNewPassword:
        return BaseRoutes(
          page: const CreateNewPassword(),
        );
      case resetPasswordDone:
        return BaseRoutes(
          page: const ResetPasswordDone(),
        );
      case main:
        return BaseRoutes(
          page: const MainView(),
        );
      case home:
        return BaseRoutes(
          page: const HomeView(),
        );

      case cart:
        return BaseRoutes(
          page: const CartView(),
        );
      case favorites:
        return BaseRoutes(
          page: const FavoritesView(),
        );
      case menu:
        return BaseRoutes(
          page: const MenuView(),
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
