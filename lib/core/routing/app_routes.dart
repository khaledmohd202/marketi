import 'package:flutter/foundation.dart';
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
import 'package:marketi/features/cart/presentation/view/cart_checkout.dart';
import 'package:marketi/features/cart/presentation/view/cart_view.dart';
import 'package:marketi/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:marketi/features/favorites/presentation/view/favorites_view.dart';
import 'package:marketi/features/home/presentation/view/best_products.dart';
import 'package:marketi/features/home/presentation/view/brands.dart';
import 'package:marketi/features/home/presentation/view/buy_again.dart';
import 'package:marketi/features/home/presentation/view/categories.dart';
import 'package:marketi/features/home/presentation/view/home_view.dart';
import 'package:marketi/features/home/presentation/view/popular_products.dart';
import 'package:marketi/features/home/presentation/view_model/brands/brands_cubit.dart';
import 'package:marketi/features/home/presentation/view_model/categories/categories_cubit.dart';
import 'package:marketi/features/home/presentation/view_model/products/products_cubit.dart';
import 'package:marketi/features/main/presentation/view/main_view.dart';
import 'package:marketi/features/menu/presentation/view/menu_view.dart';
import 'package:marketi/features/onboarding/presentation/view/onboarding.dart';
import 'package:marketi/features/product_details/presentation/view/product_details.dart';
import 'package:marketi/features/product_details/presentation/view_model/product_details_cubit.dart';
import 'package:marketi/features/profile/presentation/view/profile_view.dart';
import 'package:marketi/features/search/presentation/views/search_view.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String signIn = '/login';
  static const String signUp = '/sign-up';
  static const String forgotPasswordWithEmail = '/forgot-password-with-email';
  static const String forgotPasswordWithPhone = '/forgot-password-with-phone';
  static const String verificationCodeWithEmail =
      '/verification-code-with-email';
  static const String verificationCodeWithPhone =
      '/verification-code-with-phone';
  static const String createNewPassword = '/create-new-password';
  static const String resetPasswordDone = '/reset-password-done';
  static const String cart = '/cart';
  static const String favorites = '/favorites';
  static const String menu = '/menu';
  static const String main = '/main';
  static const String home = '/home';
  static const String popularProducts = '/popular-products';
  static const String categories = '/categories';
  static const String bestProducts = '/best-products';
  static const String brands = '/brands';
  static const String buyAgain = '/buy-again';
  static const String cartCheckout = '/cart-checkout';
  static const String profile = '/profile';
  static const String search = '/search';
  static const String productDetails = '/product-details';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case onboarding:
        return BaseRoutes(
          page: const Onboarding(),
        );
      case '/':
      case signIn:
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
      case cart:
        return BaseRoutes(
          page: BlocProvider(
            create: (context) => sl<CartCubit>(),
            child: const CartView(),
          ),
        );
      case favorites:
        return BaseRoutes(
          page: const FavoritesView(),
        );
      case menu:
        return BaseRoutes(
          page: const MenuView(),
        );
      case home:
        return BaseRoutes(
          page: const HomeView(),
        );
      case popularProducts:
        return BaseRoutes(
          page: BlocProvider(
            create: (context) => sl<ProductsCubit>(),
            child: const PopularProducts(),
          ),
        );
      case buyAgain:
        return BaseRoutes(
          page: BlocProvider(
            create: (context) => sl<ProductsCubit>(),
            child: const BuyAgain(),
          ),
        );
      case bestProducts:
        return BaseRoutes(
          page: BlocProvider(
            create: (context) => sl<ProductsCubit>(),
            child: const BestProducts(),
          ),
        );
      case categories:
        return BaseRoutes(
          page: BlocProvider(
            create: (context) => sl<CategoriesCubit>()..getAllCategories(),
            child: const Categories(),
          ),
        );
      case brands:
        return BaseRoutes(
          page: BlocProvider(
            create: (context) => sl<BrandsCubit>()..getAllBrands(),
            child: const Brands(),
          ),
        );
      case cartCheckout:
        return BaseRoutes(
          page: const CartCheckout(),
        );
      case profile:
        return BaseRoutes(
          page: const ProfileView(),
        );
      case search:
        return BaseRoutes(
          page: const SearchView(),
        );
      case productDetails:
        final productId = args! as int;
        return BaseRoutes(
          page: BlocProvider(
            create: (_) =>
                sl<ProductDetailsCubit>()
                  ..getProductDetails(productId: productId),
            child: ProductDetails(productId: productId),
          ),
        );
      default:
        return kDebugMode
            ? BaseRoutes(
                page: Scaffold(
                  body: Center(
                    child: Text('Page not found ${settings.name}'),
                  ),
                ),
              )
            : BaseRoutes(page: const MainView());
      // default:
      //   return BaseRoutes(page: const PageUnderBuildScreen());
    }
  }
}
