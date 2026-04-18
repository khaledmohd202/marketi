import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';
import 'package:marketi/features/cart/presentation/view_model/cart_cubit.dart';

class CartButton extends StatelessWidget {
  const CartButton({required this.productId, super.key});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, _) {
        final cartCubit = context.read<CartCubit>();
        final inCart = cartCubit.isInCart(productId: productId);
        final isLoading = cartCubit.loadingProductId == productId.toString();

        return Center(
          child: ElevatedButton(
            onPressed: () => (isLoading || inCart)
                ? cartCubit.deleteFromCart(productId: productId.toString())
                : cartCubit.addToCart(productId: productId.toString()),
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
    );
  }
}
