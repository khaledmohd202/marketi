import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/custom_elevated_button.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/features/auth/presentation/widgets/custom_marketi_app_bar.dart';
import 'package:pinput/pinput.dart';

class VerificationCodeWithPhone extends StatelessWidget {
  const VerificationCodeWithPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomMarketiAppBar(title: 'Verification Code'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 50.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Image
              Align(
                child: Image.asset(
                  MarketiImages.verificationCodeWithPhone,
                ),
              ),
              SizedBox(height: 20.0.h),
              // Description
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Please enter the verification code sent to: \n',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black45,
                  ),
                  children: [
                    TextSpan(
                      text: '+20 106 004 0675',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: MarketiColors.lightBlue900Color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.0.h),
              Pinput(
                // length: 4,
                defaultPinTheme: PinTheme(
                  width: 64.w,
                  height: 64.h,
                  textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black87,
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0.r),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              // Verify Button
              CustomButton(
                onPressed: () {
                  context.pushNamed(AppRoutes.createNewPassword);
                },
                text: 'Verify Code',
                width: double.infinity,
                height: 50.0.h,
                textColor: MarketiColors.whiteColor,
                backgroundColor: MarketiColors.lightBlue900Color,
              ),
              // Timer
              SizedBox(height: 15.0.h),
              Text(
                '00:22',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black45,
                ),
              ),
              // Resend Code
              SizedBox(height: 15.0.h),
              GestureDetector(
                onTap: () {
                  // Resend code logic
                },
                child: Text(
                  'Resend Code',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: MarketiColors.lightBlue900Color,
                    fontWeight: FontWeight.bold,
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
