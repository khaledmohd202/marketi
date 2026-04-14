import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';
import 'package:marketi/features/cart/presentation/view/successful_order.dart';
import 'package:marketi/features/cart/presentation/widgets/delivery_address.dart';
import 'package:marketi/features/cart/presentation/widgets/delivery_time.dart';
import 'package:marketi/features/cart/presentation/widgets/payment_method.dart';
import 'package:marketi/features/cart/presentation/widgets/receipt_widget.dart';
import 'package:marketi/features/cart/presentation/widgets/voucher_code.dart';
import 'package:marketi/features/home/presentation/widgets/custom_view_all_app_bar.dart';

class CartCheckout extends StatelessWidget {
  const CartCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomViewAllAppBar(title: 'Checkout'),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 14.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextApp(text: 'Address', theme: MarketiTextStyles.textStyle18),
              SizedBox(height: 10.h),
              const DeliveryAddress(),
              SizedBox(height: 10.h),
              TextApp(
                text: 'Delivery Time',
                theme: MarketiTextStyles.textStyle18,
              ),
              SizedBox(height: 5.h),
              const DeliveryTime(),
              SizedBox(height: 10.h),
              TextApp(
                text: 'Payment',
                theme: MarketiTextStyles.textStyle18,
              ),
              SizedBox(height: 5.h),
              const PaymentMethod(),
              SizedBox(height: 10.h),
              const VoucherCode(),
              SizedBox(height: 10.h),
              TextApp(
                text: 'Total',
                theme: MarketiTextStyles.textStyle18,
              ),
              const ReceiptWidget(),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const SuccessfulOrder(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.h),
                  backgroundColor: MarketiColors.lightBlue900Color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 12.h,
                  ),
                ),
                child: TextApp(
                  text: 'Place Order',
                  theme: MarketiTextStyles.textStyle16.copyWith(
                    color: MarketiColors.whiteColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
