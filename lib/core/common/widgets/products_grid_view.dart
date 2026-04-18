import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/cart_button.dart';
import 'package:marketi/core/common/widgets/product_card.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/features/favorites/presentation/view_model/favorite_cubit.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    required this.itemCount,
    required this.idAt,
    required this.titleAt,
    required this.priceAt,
    required this.ratingAt,
    required this.thumbnailAt,
    this.discountAt,
    this.showCartButton = true,
    this.shrinkWrap = false,
    super.key,
  });

  final int itemCount;
  final int Function(int index) idAt;
  final String Function(int index) titleAt;
  final String Function(int index) priceAt;
  final double Function(int index) ratingAt;
  final String Function(int index) thumbnailAt;
  final String? Function(int index)? discountAt;
  final bool showCartButton;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: shrinkWrap,
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5.w,
        crossAxisSpacing: 10.h,
        mainAxisExtent: 250.h,
      ),
      itemBuilder: (context, index) {
        return BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, _) {
            final favCubit = context.read<FavoriteCubit>();
            final isFav = favCubit.isInFavorites(productId: idAt(index));

            return ProductCard(
              name: titleAt(index),
              price: priceAt(index),
              rating: ratingAt(index),
              image: thumbnailAt(index),
              discount: discountAt?.call(index),
              selectedIcon: Icons.favorite,
              isFavorite: isFav,
              onFavoriteTap: () => isFav
                  ? favCubit.deleteFromFavorites(
                      productId: idAt(index).toString(),
                    )
                  : favCubit.addToFavorites(productId: idAt(index).toString()),
              onTap: () => context.pushNamed(
                AppRoutes.productDetails,
                arguments: idAt(index),
              ),
              bottomAddWidget: showCartButton
                  ? CartButton(productId: idAt(index))
                  : null,
            );
          },
        );
      },
    );
  }
}
