import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/toast/show_toast.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/const/icons/marketi_icons.dart';
import 'package:marketi/core/services/stripe/stripe_manager.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';

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
            onPressed: () async {
              final result = await StripeManager.makePayment(
                amount: 100,
                currency: 'USD',
              );

              if (!context.mounted) return;

              switch (result) {
                case PaymentStatus.success:
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(content: Text('✅ Payment Successful')),
                  // );
                  ShowToast.showToastSuccessTop(
                    message: '✅ Payment Successful',
                  );
                  return;
                case PaymentStatus.canceled:
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(content: Text('⚠️ Payment Canceled')),
                  // );
                  ShowToast.showToastErrorTop(message: '⚠️ Payment Canceled');
                  return;

                case PaymentStatus.failed:
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(content: Text('❌ Payment Failed')),
                  // );
                  ShowToast.showToastErrorTop(
                    message: '❌ Payment Failed',
                  );
                  return;
              }
            },
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
