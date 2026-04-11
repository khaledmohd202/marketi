import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/loading/loading_shimmer.dart';
import 'package:marketi/core/common/widgets/product_card.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';
import 'package:marketi/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_header.dart';
import 'package:marketi/features/favorites/presentation/view_model/favorite_cubit.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteCubit>().getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        child: BlocConsumer<FavoriteCubit, FavoriteState>(
          listener: (context, state) {
            if (state is DeleteFromFavoritesSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.green,
                ),
              );
            }

            if (state is DeleteFromFavoritesFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<FavoriteCubit>();

            if (state is FavoriteLoading && cubit.favoriteModel == null) {
              return Column(
                children: [
                  const CommonHeader(title: 'My Favorites'),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: GridView.builder(
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5.w,
                        crossAxisSpacing: 10.h,
                        mainAxisExtent: 250.h,
                      ),
                      itemBuilder: (context, index) =>
                          LoadingShimmer(height: 250.h, width: 170.w),
                    ),
                  ),
                ],
              );
            }

            if (state is FavoriteFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                    ElevatedButton(
                      onPressed: cubit.getFavorites,
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              );
            }

            final favorites = cubit.favoriteModel;

            if (favorites == null || favorites.favoritesList.isEmpty) {
              return const Column(
                children: [
                  CommonHeader(title: 'My Favorites'),
                  Expanded(
                    child: Center(child: Text('No favorites yet!')),
                  ),
                ],
              );
            }

            // in the success state and there is a favorites Products.
            return Column(
              children: [
                const CommonHeader(
                  title: 'My Favorites',
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: favorites.favoritesList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5.w,
                      crossAxisSpacing: 10.h,
                      mainAxisExtent: 250.h,
                    ),
                    itemBuilder: (context, index) {
                      final favoriteProduct = favorites.favoritesList[index];

                      return ProductCard(
                        name: favoriteProduct.title,
                        price: favoriteProduct.price.toString(),
                        rating: favoriteProduct.rating,
                        onTap: () {},
                        image: favoriteProduct.thumbnail,
                        selectedIcon: Icons.favorite,
                        isFavorite: true,
                        onFavoriteTap: () => cubit.deleteFromFavorites(
                          productId: favoriteProduct.id.toString(),
                        ),
                        bottomAddWidget: BlocConsumer<CartCubit, CartState>(
                          listener: (context, cartState) {
                            if (cartState is AddToCartSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(cartState.message),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                            if (cartState is AddToCartFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
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
                              productId: favoriteProduct.id,
                            );
                            final isLoading = cartState is AddToCartLoading;

                            return Center(
                              child: ElevatedButton(
                                onPressed: (isLoading || inCart)
                                    ? null
                                    : () => cartCubit.addToCart(
                                        productId: favoriteProduct.id
                                            .toString(),
                                      ),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 35.h),
                                  backgroundColor: inCart
                                      ? Colors.grey
                                      : Colors.white,
                                  foregroundColor:
                                      MarketiColors.lightBlue700Color,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    side: BorderSide(
                                      color: inCart
                                          ? Colors.grey
                                          : MarketiColors.lightBlue700Color,
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
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
