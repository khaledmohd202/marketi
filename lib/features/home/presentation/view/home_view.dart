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

  late final ProductsCubit productsCubit;
  late final CategoriesCubit categoriesCubit;
  late final BrandsCubit brandsCubit;

  @override
  void initState() {
    super.initState();

    productsCubit = sl<ProductsCubit>()..getAllProducts(limit: 9);
    categoriesCubit = sl<CategoriesCubit>()..getAllCategories();
    brandsCubit = sl<BrandsCubit>()..getAllBrands();
  }

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
            // the second solution but we continued
            SliverToBoxAdapter(
              child: BlocProvider.value(
                value: productsCubit,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeSectionTitle(
                      sectionTitle: 'Popular Products',
                      onPressed: () =>
                          context.pushNamed(AppRoutes.popularProducts),
                    ),
                    const HomePopularProduct(),
                  ],
                ),
              ),
            ),

            // Categories
            SliverToBoxAdapter(
              child: BlocProvider.value(
                value: categoriesCubit,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
            ),

            // Best For You
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeSectionTitle(
                    sectionTitle: 'Best For You',
                    onPressed: () =>
                        context.pushNamed(AppRoutes.popularProducts),
                  ),
                  BlocProvider.value(
                    value: productsCubit,
                    child: const HomeBestProduct(),
                  ),
                ],
              ),
            ),

            // Brands
            SliverToBoxAdapter(
              child: BlocProvider.value(
                value: brandsCubit,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeSectionTitle(
                      sectionTitle: 'Brands',
                      onPressed: () => context.pushNamed(AppRoutes.brands),
                    ),
                    const HomeBrands(),
                  ],
                ),
              ),
            ),

            // Buy Again
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeSectionTitle(
                    sectionTitle: 'Buy Again',
                    onPressed: () =>
                        context.pushNamed(AppRoutes.popularProducts),
                  ),
                  BlocProvider.value(
                    value: productsCubit,
                    child: const HomeBuyAgain(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
