import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/favorites_icon.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.name,
    required this.price,
    required this.rating,
    required this.onTap,
    required this.image,
    required this.selectedIcon,
    required this.isFavorite, // required this.color,
    this.discount,
    super.key,
    this.bottomAddWidget,
    this.onFavoriteTap,
  });
  final String image;
  final String? discount;
  final VoidCallback onTap;
  final IconData? selectedIcon;
  final String name;
  final String price;
  final double rating;
  final Widget? bottomAddWidget;
  final VoidCallback? onFavoriteTap;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: MarketiColors.greyColor.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Part
            Container(
              height: 140.h,
              decoration: BoxDecoration(
                color: MarketiColors.lightBlue100Color,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              ),
              child: Stack(
                // Image, Discount Badge and Favorite Icon.
                children: [
                  // Product Image
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.network(
                        image,
                        fit: BoxFit.fill,
                        scale: 0.8,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) => Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            color: Colors.grey,
                            size: 40.r,
                          ),
                        ),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(
                              color: MarketiColors.darkBlue500Color,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // Discount Badge
                  if (discount != null)
                    Positioned(
                      top: 8.h,
                      left: 8.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: MarketiColors.lightBlue900Color,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Text(
                          '${discount!} %',
                          style: MarketiTextStyles.textStyle12.copyWith(
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),
                  // Favorite Icon
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: FavoritesIcon(
                      onTap: onFavoriteTap ?? () {},
                      iconWidget: Icon(
                        selectedIcon,
                        size: 20.r,
                        color: isFavorite
                            ? MarketiColors.lightBlue900Color
                            : MarketiColors.greyColor.withValues(alpha: 0.3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Bottom Part
            // Price, Name and Rate.
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Price and Raring
                  Row(
                    children: [
                      // Price
                      Text(
                        '$price LE',
                        style: MarketiTextStyles.textStyle14.copyWith(
                          color: MarketiColors.darkBlue900Color,
                        ),
                      ),
                      const Spacer(),

                      // Rating
                      Icon(
                        Icons.star,
                        size: 20.r,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        rating.toString(),
                        style: MarketiTextStyles.textStyle12.copyWith(
                          color: MarketiColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                  // title
                  Text(
                    name,
                    style: MarketiTextStyles.textStyle12.copyWith(
                      color: MarketiColors.greyColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  if (bottomAddWidget != null) ...[
                    bottomAddWidget!,
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
