import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/favorites_icon.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';
import 'package:marketi/features/favorites/presentation/view_model/favorite_cubit.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    required this.productId, required this.onDecrement,
    required this.onDelete,
    required this.onIncrement,
    required this.quantity,
    required this.rating,
    required this.price,
    required this.description,
    required this.selectedIcon,
    required this.productTitle,
    required this.image,
    super.key,
  });
  final String image;
  final int productId;
  final String productTitle;
  final String description;
  final String price;
  final String rating;
  final IconData selectedIcon;
  final VoidCallback onDelete;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  // bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: MarketiColors.greyColor.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              image,
              width: 100.w,
              height: 115.h,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: 10.w),
          // Product Title and Favorite Icon
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Product Tile
                    Expanded(
                      child: TextApp(
                        text: productTitle,
                        theme: MarketiTextStyles.textStyle16.copyWith(
                          fontWeight: FontWeight.bold,
                          color: MarketiColors.darkBlue900Color,
                        ),
                      ),
                    ),
                    // Favorite Icon
                    // FavoritesIcon(
                    //   onTap: () {
                    //     setState(() {
                    //       _isFavorite = !_isFavorite;
                    //     });
                    //   },
                    //   iconWidget: Icon(
                    //     widget.selectedIcon,
                    //     size: 20.r,
                    //     color: _isFavorite
                    //         ? MarketiColors.lightBlue900Color
                    //         : MarketiColors.greyColor.withValues(alpha: 0.3),
                    //   ),
                    // ),
                    BlocBuilder<FavoriteCubit, FavoriteState>(
                      builder: (context, state) {
                        final favCubit = context.read<FavoriteCubit>();
                        final isFav = favCubit.isInFavorites(
                          productId: productId,
                        );

                        return FavoritesIcon(
                          onTap: () => isFav
                              ? favCubit.deleteFromFavorites(
                                  productId: productId.toString(),
                                )
                              : favCubit.addToFavorites(
                                  productId: productId.toString(),
                                ),
                          iconWidget: Icon(
                            Icons.favorite,
                            size: 20.r,
                            color: isFav
                                ? MarketiColors.lightBlue900Color
                                : MarketiColors.greyColor.withValues(
                                    alpha: 0.3,
                                  ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                // Quantity of the product
                TextApp(
                  text: description,
                  theme: MarketiTextStyles.textStyle10.copyWith(
                    color: MarketiColors.greyColor,
                  ),
                ),
                SizedBox(height: 10.h),
                // Price and Raring
                Row(
                  children: [
                    // Price
                    TextApp(
                      text: 'Price:$price EGP',
                      theme: MarketiTextStyles.textStyle12.copyWith(
                        fontWeight: FontWeight.bold,
                        color: MarketiColors.darkBlue900Color,
                      ),
                    ),
                    const Spacer(),
                    // Rating
                    Icon(Icons.star, size: 14.r, color: Colors.amber),
                    SizedBox(width: 4.w),
                    TextApp(
                      text: rating,
                      theme: MarketiTextStyles.textStyle12.copyWith(
                        color: MarketiColors.greyColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                // Buttons to increase or decrease the quantity of the product
                Row(
                  children: [
                    // Decrease Button
                    GestureDetector(
                      onTap: quantity == 1 ? onDelete : onDecrement,
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: quantity == 1
                              ? Colors.red.withValues(alpha: 0.5)
                              : MarketiColors.greyColor.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Icon(
                          quantity == 1 ? Icons.delete_outline : Icons.remove,
                          size: 16.r,
                          color: quantity == 1
                              ? Colors.red
                              : MarketiColors.greyColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    // Quantity
                    Container(
                      height: 40.h,
                      width: 100.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: MarketiColors.lightBlue100Color.withValues(
                          alpha: 0.5,
                        ),
                      ),
                      child: TextApp(
                        text: quantity.toString(),
                        theme: MarketiTextStyles.textStyle14.copyWith(
                          fontWeight: FontWeight.bold,
                          color: MarketiColors.darkBlue900Color,
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    // Plus
                    GestureDetector(
                      onTap: onIncrement,
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: MarketiColors.greyColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 16.r,
                          color: MarketiColors.darkBlue900Color,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
