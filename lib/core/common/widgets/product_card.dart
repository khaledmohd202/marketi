import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    required this.name,
    required this.price,
    required this.rating,
    required this.onTap,
    required this.discount,
    required this.image,
    required this.selectedIcon,
    required this.color,
    super.key,
    this.bottomAddWidget,
  });
  final String image;
  final String discount;
  final VoidCallback onTap;
  final IconData? selectedIcon;
  final Color? color;
  final String name;
  final String price;
  final double rating;
  final Widget? bottomAddWidget;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.pushNamed(
        //   AppRoutes.productDetails,
        // );
      },
      child: Container(
        width: 170.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              //
              // ignore: deprecated_member_use
              color: Colors.grey.withOpacity(0.1),
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
                      // replaced with Image.network when linking with API
                      child: Image.asset(
                        widget.image,
                        // height: 140.h,
                        width: double.infinity,
                        scale: 0.8,
                        // fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  // Discount Badge
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
                        widget.discount,
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
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              //
                              // ignore: deprecated_member_use
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Icon(
                          _isFavorite ? Icons.favorite : Icons.favorite_outline,
                          size: 20.r,
                          color: _isFavorite
                              ? MarketiColors.darkBlue100Color
                              : MarketiColors.greyColor,
                        ),
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
                        '${widget.price} LE',
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
                        widget.rating.toString(),
                        style: MarketiTextStyles.textStyle12.copyWith(
                          color: MarketiColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                  // tile
                  Text(
                    widget.name,
                    style: MarketiTextStyles.textStyle12.copyWith(
                      color: MarketiColors.greyColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  if (widget.bottomAddWidget != null) ...[
                    widget.bottomAddWidget!,
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
