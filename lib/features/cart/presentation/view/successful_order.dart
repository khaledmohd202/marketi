
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';
import 'package:marketi/features/home/presentation/widgets/custom_view_all_app_bar.dart';

class SuccessfulOrder extends StatelessWidget {
  const SuccessfulOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomViewAllAppBar(title: 'Checkout Success'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100.sp,
            ),
            SizedBox(height: 20.h),
            TextApp(
              text: 'Thank You',
              theme: MarketiTextStyles.textStyle24.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            TextApp(
              text: 'Woah, You Have successfully ordered',
              theme: MarketiTextStyles.textStyle16.copyWith(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30.h),
            ElevatedButton(
              onPressed: () {
                // context.popUntil(
                //   (route) => route.settings.name == AppRoutes.main,
                // );
                context.pushNamedAndRemoveUntil(AppRoutes.main);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50.h),
                backgroundColor: MarketiColors.lightBlue900Color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
              child: TextApp(
                text: 'Go to Home',
                theme: MarketiTextStyles.textStyle16.copyWith(
                  color: MarketiColors.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
