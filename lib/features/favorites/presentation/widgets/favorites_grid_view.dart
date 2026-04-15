import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/product_card.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';
import 'package:marketi/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:marketi/features/favorites/data/models/favorite_model.dart';
import 'package:marketi/features/favorites/presentation/view_model/favorite_cubit.dart';

class FavoritesGridView extends StatelessWidget {
  const FavoritesGridView({
    required this.favorites,
    required this.cubit,
    super.key,
  });

  final FavoriteModel favorites;
  final FavoriteCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
          bottomAddWidget: BlocBuilder<CartCubit, CartState>(
            builder: (context, cartState) {
              final cartCubit = context.read<CartCubit>();

              final inCart = cartCubit.isInCart(
                productId: favoriteProduct.id,
              );

              final isLoading =
                  cartCubit.loadingProductId == favoriteProduct.id.toString();

              return Center(
                child: ElevatedButton(
                  onPressed: (isLoading || inCart)
                      ? () => cartCubit.deleteFromCart(
                          productId: favoriteProduct.id.toString(),
                        )
                      : () => cartCubit.addToCart(
                          productId: favoriteProduct.id.toString(),
                        ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 35.h),
                    backgroundColor: inCart
                        ? Colors.grey.withValues(alpha: 0.2)
                        : MarketiColors.lightBlue700Color,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      side: BorderSide(
                        color: inCart
                            ? Colors.grey.withValues(alpha: 0.2)
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
    );
  }
}
