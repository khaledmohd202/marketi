import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/custom_elevated_button.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';

class ResetPasswordDone extends StatelessWidget {
  const ResetPasswordDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0.w,
          vertical: 50.0.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image
            Image.asset(MarketiImages.resetPasswordDone),
            SizedBox(height: 20.h),
            // Title
            TextApp(
              text: 'Congratulations!',
              theme: MarketiTextStyles.textStyle24.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15.h),
            // Description
            TextApp(
              text:
                  '''You have updated the password. please login again with your latest password''',
              theme: MarketiTextStyles.textStyle20.copyWith(
                color: Colors.black45,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25.h),
            CustomButton(
              onPressed: () {
                context.pushNamedAndRemoveUntil(AppRoutes.signIn);
              },
              text: 'Login',
              width: double.infinity,
              height: 50.h,
              textColor: Colors.white,
              backgroundColor: MarketiColors.lightBlue900Color,
            ),
          ],
        ),
      ),
    );
  }
}
