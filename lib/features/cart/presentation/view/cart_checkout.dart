import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/dashed_divider.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/const/icons/marketi_icons.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';
import 'package:marketi/features/cart/presentation/view/cart_view.dart';
import 'package:marketi/features/cart/presentation/view/successful_order.dart';
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

class ReceiptWidget extends StatelessWidget {
  const ReceiptWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 105.h,
      decoration: BoxDecoration(
        color: MarketiColors.whiteColor,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: MarketiColors.darkBlue100Color),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: 5.w,
          vertical: 10.h,
        ),
        child: Column(
          children: [
            ReceiptText(
              text: 'Subtotal (${productImages.length} items)',
              price: totalPrice,
            ),
            SizedBox(height: 10.h),
            const ReceiptText(
              text: 'Delivery Fees',
              price: 10,
            ),
            SizedBox(height: 5.h),
            DashedDivider(
              indent: 8.w,
              endIndent: 3.w,
              color: MarketiColors.darkBlue100Color,
              height: 1.h,
              dashWidth: 6.w,
              dashSpace: 6.w,
            ),
            SizedBox(height: 5.h),

            ReceiptText(
              text: 'Total',
              price: totalPrice + 10,
            ),
          ],
        ),
      ),
    );
  }
}

class ReceiptText extends StatelessWidget {
  const ReceiptText({
    required this.price,
    required this.text,
    super.key,
  });
  final String text;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10.w),
        TextApp(
          text: text,
          theme: MarketiTextStyles.textStyle14,
        ),
        const Spacer(),
        TextApp(
          text: 'EGP ${price.toStringAsFixed(2)}',
          theme: MarketiTextStyles.textStyle14,
        ),
      ],
    );
  }
}

class VoucherCode extends StatelessWidget {
  const VoucherCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 250.w,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Voucher code',
              hintStyle: MarketiTextStyles.textStyle14.copyWith(
                color: MarketiColors.greyColor,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 12.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: const BorderSide(
                  color: MarketiColors.darkBlue100Color,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: const BorderSide(
                  color: MarketiColors.darkBlue100Color,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: const BorderSide(
                  color: MarketiColors.darkBlue100Color,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: MarketiColors.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.r),
              side: const BorderSide(
                color: MarketiColors.darkBlue100Color,
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 12.h,
            ),
          ),
          child: TextApp(
            text: 'Apply',
            theme: MarketiTextStyles.textStyle14.copyWith(
              color: MarketiColors.lightBlue900Color,
            ),
          ),
        ),
      ],
    );
  }
}

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
        color: MarketiColors.whiteColor,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: MarketiColors.darkBlue100Color),
      ),
      child: Row(
        children: [
          SizedBox(width: 10.w),
          Image.asset(MarketiIcons.cashIcon),
          SizedBox(width: 10.w),
          TextApp(
            text: 'Cash on Delivery',
            theme: MarketiTextStyles.textStyle14,
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: TextApp(
              text: 'Change',
              theme: MarketiTextStyles.textStyle14.copyWith(
                color: MarketiColors.darkBlue200Color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DeliveryTime extends StatelessWidget {
  const DeliveryTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
        color: MarketiColors.whiteColor,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: MarketiColors.darkBlue100Color),
      ),
      child: Row(
        children: [
          SizedBox(width: 10.w),
          Image.asset(MarketiIcons.deliveryIcon),
          SizedBox(width: 10.w),
          TextApp(
            text: 'Within 2 days',
            theme: MarketiTextStyles.textStyle14,
          ),
        ],
      ),
    );
  }
}

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: MarketiColors.darkBlue100Color),
      ),
      child: Column(
        children: [
          Image.asset(MarketiImages.address),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  // color: MarketiColors.darkBlue100Color,
                ),
                SizedBox(width: 10.w),
                TextApp(
                  text: 'Home',
                  theme: MarketiTextStyles.textStyle14,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: TextApp(
                    text: 'Change',
                    theme: MarketiTextStyles.textStyle14.copyWith(
                      color: MarketiColors.darkBlue200Color,
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextApp(
            text: 'Anshas, Al-sharqia, Egypt.',
            theme: MarketiTextStyles.textStyle14.copyWith(
              color: MarketiColors.greyColor,
            ),
          ),
          TextApp(
            text: 'Mobile: +20 106 004 0675',
            theme: MarketiTextStyles.textStyle14.copyWith(
              color: MarketiColors.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
