import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/features/home/presentation/widgets/home_banner.dart';
import 'package:marketi/features/home/presentation/widgets/home_best_product.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        child: CustomScrollView(
          slivers: [
            // Home Header
            const SliverToBoxAdapter(
              child: HomeHeader(),
            ),
            // Search Bar
            SliverToBoxAdapter(
              child: HomeSearchBar(controller: _controller),
            ),
            // Banner Bar
            const SliverToBoxAdapter(
              child: HomeBanner(),
            ),
            // Popular Products
            SliverToBoxAdapter(
              child: HomeSectionTitle(
                sectionTitle: 'Popular Products',
                onPressed: () {},
              ),
            ),
            const SliverToBoxAdapter(
              child: HomePopularProduct(),
            ),
            // Categories
            SliverToBoxAdapter(
              child: HomeSectionTitle(
                sectionTitle: 'Categories',
                onPressed: () {},
              ),
            ),
            const SliverToBoxAdapter(
              child: HomeCategories(),
            ),
            SliverToBoxAdapter(
              child: HomeSectionTitle(
                sectionTitle: 'Best For You',
                onPressed: () {},
              ),
            ),
            const SliverToBoxAdapter(
              child: HomeBestProduct(),
            ),
            SliverToBoxAdapter(
              child: HomeSectionTitle(
                sectionTitle: 'Brands',
                onPressed: () {},
              ),
            ),
            SliverToBoxAdapter(
              child: HomeSectionTitle(
                sectionTitle: 'Buy Again',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
