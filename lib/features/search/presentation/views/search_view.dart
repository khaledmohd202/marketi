import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/loading/loading_shimmer.dart';
import 'package:marketi/core/common/widgets/product_card.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';
import 'package:marketi/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:marketi/features/favorites/presentation/view_model/favorite_cubit.dart';
import 'package:marketi/features/home/data/models/products/product_model.dart';
import 'package:marketi/features/home/presentation/widgets/home_search_bar.dart';
import 'package:marketi/features/search/presentation/view_model/search_cubit.dart';
import 'package:marketi/features/search/presentation/widgets/search_app_bar.dart';
import 'package:marketi/features/search/presentation/widgets/search_text_field.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      context.read<SearchCubit>().search(searchQuery: _controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchAppBar(),
              // SizedBox(height: 16.h),
              HomeSearchBar(controller: _controller, onPressedFilter: () {}),
              SizedBox(height: 16.h),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    // Initial State.
                    if (state is SearchInitial) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SearchPopularSection(),
                            SizedBox(height: 24.h),
                            TextApp(
                              text: 'Search History',
                              theme: MarketiTextStyles.textStyle18,
                            ),
                            SearchHistoryItem(
                              label: 'Iphone',
                              onDelete: () {},
                            ),
                            SearchHistoryItem(
                              label: 'Pampers',
                              onDelete: () {},
                            ),
                            SearchHistoryItem(
                              label: 'Air pods',
                              onDelete: () {},
                            ),
                          ],
                        ),
                      );
                    }

                    // Loading State.
                    if (state is SearchLoading) {
                      return GridView.builder(
                        itemCount: 6,
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5.w,
                          crossAxisSpacing: 10.h,
                          mainAxisExtent: 250.h,
                        ),
                        itemBuilder: (context, index) =>
                            LoadingShimmer(height: 250.h, width: 170.w),
                      );
                    }

                    // Empty State.
                    if (state is SearchEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 60.r,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 10.h),
                            TextApp(
                              text: 'No results found',
                              theme: MarketiTextStyles.textStyle16.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    // Failure State.
                    if (state is SearchFailure) {
                      return Center(
                        child: Text(
                          state.errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }

                    // Success state.
                    if (state is SearchSuccess) {
                      final products = state.products.productsList;

                      return GridView.builder(
                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5.w,
                          crossAxisSpacing: 10.h,
                          mainAxisExtent: 250.h,
                        ),
                        itemBuilder: (context, index) {
                          return BlocBuilder<FavoriteCubit, FavoriteState>(
                            builder: (context, favState) {
                              final favCubit = context.read<FavoriteCubit>();
                              final isFav = favCubit.isInFavorites(
                                productId: products[index].id,
                              );

                              return ProductCard(
                                name: products[index].title,
                                price: products[index].price.toString(),
                                rating: products[index].rating,
                                image: products[index].thumbnail,
                                selectedIcon: Icons.favorite,
                                isFavorite: isFav,
                                onFavoriteTap: () => isFav
                                    ? favCubit.deleteFromFavorites(
                                        productId: products[index].id
                                            .toString(),
                                      )
                                    : favCubit.addToFavorites(
                                        productId: products[index].id
                                            .toString(),
                                      ),
                                onTap: () => context.pushNamed(
                                  AppRoutes.productDetails,
                                  arguments: products[index].id,
                                ),
                                bottomAddWidget: _addToCartButton(
                                  products,
                                  index,
                                ),
                              );
                            },
                          );
                        },
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BlocConsumer<CartCubit, CartState> _addToCartButton(
    List<ProductModel> products,
    int index,
  ) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, cartState) {
        if (cartState is AddToCartSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(
            SnackBar(
              content: Text(cartState.message),
              backgroundColor: Colors.green,
            ),
          );
        }
        if (cartState is AddToCartFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(
            SnackBar(
              content: Text(cartState.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, cartState) {
        final cartCubit = context.read<CartCubit>();
        final inCart = cartCubit.isInCart(
          productId: products[index].id,
        );
        final isLoading = cartState is AddToCartLoading;

        return Center(
          child: ElevatedButton(
            onPressed: (isLoading || inCart)
                ? null
                : () => cartCubit.addToCart(
                    productId: products[index].id.toString(),
                  ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 35.h),
              backgroundColor: inCart ? Colors.grey : Colors.white,
              foregroundColor: MarketiColors.lightBlue700Color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
                side: BorderSide(
                  color: inCart ? Colors.grey : MarketiColors.lightBlue700Color,
                  width: 1.w,
                ),
              ),
            ),
            child: isLoading
                ? SizedBox(
                    height: 18.h,
                    width: 18.w,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : TextApp(
                    text: inCart ? 'Added ✓' : 'Add',
                    theme: MarketiTextStyles.textStyle16,
                  ),
          ),
        );
      },
    );
  }
}
