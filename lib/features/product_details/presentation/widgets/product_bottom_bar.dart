import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';
import 'package:marketi/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:marketi/features/home/data/models/products/product_model.dart';

class ProductBottomBar extends StatelessWidget {
  const ProductBottomBar({required this.product, super.key});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextApp(
                text: 'Price',
                theme: MarketiTextStyles.textStyle16.copyWith(
                  color: Colors.grey,
                ),
              ),
              TextApp(
                text: '${product.price} EGP',
                theme: MarketiTextStyles.textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          // Important widget that make me add Icon and text
          // in the same line and
          // make the button size fit the content
          // without using the
          // GestureDetector => Container => Row => Icon + Text.
          BlocBuilder<CartCubit, CartState>(
            builder: (context, cartState) {
              final cartCubit = context.read<CartCubit>();
              final inCart = cartCubit.isInCart(productId: product.id);
              final isLoading = cartState is AddToCartLoading;

              return ElevatedButton.icon(
                onPressed: (isLoading || inCart)
                    ? null
                    : () => cartCubit.addToCart(
                        productId: product.id.toString(),
                      ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: inCart
                      ? Colors.grey
                      : MarketiColors.lightBlue900Color,
                  minimumSize: Size(230.w, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
                icon: isLoading
                    ? SizedBox(
                        height: 18.h,
                        width: 18.w,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                label: TextApp(
                  text: inCart ? 'Added to Cart ✓' : 'Add to Cart',
                  theme: MarketiTextStyles.textStyle18.copyWith(
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
