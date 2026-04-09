import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/di/dependency_injection.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/features/home/presentation/view_model/brands/brands_cubit.dart';
import 'package:marketi/features/home/presentation/view_model/categories/categories_cubit.dart';
import 'package:marketi/features/home/presentation/view_model/products/products_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/home_banner.dart';
import 'package:marketi/features/home/presentation/widgets/home_best_product.dart';
import 'package:marketi/features/home/presentation/widgets/home_brands.dart';
import 'package:marketi/features/home/presentation/widgets/home_buy_again.dart';
import 'package:marketi/features/home/presentation/widgets/home_categories.dart';
import 'package:marketi/features/home/presentation/widgets/home_header.dart';
import 'package:marketi/features/home/presentation/widgets/home_popular_product.dart';
import 'package:marketi/features/home/presentation/widgets/home_search_bar.dart';
import 'package:marketi/features/home/presentation/widgets/home_section_title.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 10.h),
        child: CustomScrollView(
          slivers: [
            // Home Header
            const SliverToBoxAdapter(
              child: HomeHeader(),
            ),
            // Search Bar
            SliverToBoxAdapter(
              child: HomeSearchBar(
                controller: _controller,
                onTap: () => context.pushNamed(AppRoutes.search),
              ),
            ),
            // Banner Bar
            const SliverToBoxAdapter(
              child: HomeBanner(),
            ),
            // Popular Products
            SliverToBoxAdapter(
              child: BlocProvider(
                create: (context) =>
                    sl<ProductsCubit>()..getAllProducts(limit: 9),
                child: Column(
                  children: [
                    // Popular Products
                    HomeSectionTitle(
                      sectionTitle: 'Popular Products',
                      onPressed: () =>
                          context.pushNamed(AppRoutes.popularProducts),
                    ),
                    const HomePopularProduct(),
                    // Categories
                    BlocProvider(
                      create: (_) => sl<CategoriesCubit>()..getAllCategories(),
                      child: Column(
                        children: [
                          HomeSectionTitle(
                            sectionTitle: 'Categories',
                            onPressed: () =>
                                context.pushNamed(AppRoutes.categories),
                          ),
                          const HomeCategories(),
                        ],
                      ),
                    ),
                    // Best Product
                    HomeSectionTitle(
                      sectionTitle: 'Best For You',
                      onPressed: () =>
                          // context.pushNamed(AppRoutes.bestProducts),
                          context.pushNamed(AppRoutes.popularProducts),
                    ),
                    const HomeBestProduct(),

                    // Brands
                    BlocProvider(
                      create: (_) => sl<BrandsCubit>()..getAllBrands(),
                      child: Column(
                        children: [
                          HomeSectionTitle(
                            sectionTitle: 'Brands',
                            onPressed: () =>
                                context.pushNamed(AppRoutes.brands),
                          ),
                          const HomeBrands(),
                        ],
                      ),
                    ),
                    // Buy Again
                    HomeSectionTitle(
                      sectionTitle: 'Buy Again',
                      onPressed: () =>
                          context.pushNamed(AppRoutes.popularProducts),
                      // context.pushNamed(AppRoutes.buyAgain),
                    ),
                    const HomeBuyAgain(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
