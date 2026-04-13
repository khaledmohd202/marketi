import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/loading/loading_shimmer.dart';
import 'package:marketi/core/common/widgets/product_card.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';
import 'package:marketi/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:marketi/features/favorites/presentation/view_model/favorite_cubit.dart';
import 'package:marketi/features/home/presentation/view_model/products/products_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/custom_view_all_app_bar.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({super.key});

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    context.read<ProductsCubit>().getAllProducts();

    // Pagination
    _scrollController.addListener(() {
      if (_scrollController.position.extentAfter < 500) {
        context.read<ProductsCubit>().getAllProducts();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomViewAllAppBar(title: 'Popular Products'),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          final cubit = context.watch<ProductsCubit>();

          if (state is ProductsLoading && cubit.products.isEmpty) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
              child: GridView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5.w,
                  crossAxisSpacing: 10.h,
                  // childAspectRatio: 0.7,
                  mainAxisExtent: 250.h,
                ),
                itemBuilder: (context, index) {
                  return LoadingShimmer(height: 250.h, width: 170.w);
                },
              ),
            );
          }
          if (state is ProductsFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: TextStyle(color: Colors.red, fontSize: 28.sp),
              ),
            );
          }
          if (state is ProductsSuccess || cubit.products.isNotEmpty) {
            final products = cubit.products;

            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 14.h,
                  ),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index >= products.length) {
                          return LoadingShimmer(
                            height: 250.h,
                            width: 170.w,
                          );
                        }
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
                              onTap: () {},
                              selectedIcon: Icons.favorite,
                              isFavorite: isFav,
                              onFavoriteTap: () => isFav
                                  ? favCubit.deleteFromFavorites(
                                      productId: products[index].id.toString(),
                                    )
                                  : favCubit.addToFavorites(
                                      productId: products[index].id.toString(),
                                    ),
                              //
                              // ignore: lines_longer_than_80_chars
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
                                    productId: products[index].id,
                                  );
                                  final isLoading =
                                      cartState is AddToCartLoading;

                                  return Center(
                                    child: ElevatedButton(
                                      onPressed: (isLoading || inCart)
                                          ? null
                                          : () => cartCubit.addToCart(
                                              productId: products[index].id
                                                  .toString(),
                                            ),
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(
                                          double.infinity,
                                          35.h,
                                        ),
                                        backgroundColor: inCart
                                            ? Colors.grey
                                            : Colors.white,
                                        foregroundColor:
                                            MarketiColors.lightBlue700Color,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20.r,
                                          ),
                                          side: BorderSide(
                                            color: inCart
                                                ? Colors.grey
                                                : MarketiColors
                                                      .lightBlue700Color,
                                            width: 1.w,
                                          ),
                                        ),
                                      ),
                                      child: isLoading
                                          ? SizedBox(
                                              height: 18.h,
                                              width: 18.w,
                                              child:
                                              const CircularProgressIndicator(
                                                    strokeWidth: 2,
                                                    color: Colors.white,
                                                  ),
                                            )
                                          : TextApp(
                                              text: inCart ? 'Added ✓' : 'Add',
                                              theme:
                                                  MarketiTextStyles.textStyle16,
                                            ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      childCount: products.length + (cubit.hasMore ? 2 : 0),
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5.w,
                      crossAxisSpacing: 10.w,
                      mainAxisExtent: 250.h,
                    ),
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  
}
