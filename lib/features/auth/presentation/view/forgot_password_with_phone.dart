import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/custom_elevated_button.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';
import 'package:marketi/features/auth/presentation/widgets/custom_marketi_app_bar.dart';
import 'package:marketi/features/auth/presentation/widgets/phone_text_field.dart';

class ForgotPasswordWithPhone extends StatefulWidget {
  const ForgotPasswordWithPhone({super.key});

  @override
  State<ForgotPasswordWithPhone> createState() =>
      _ForgotPasswordWithPhoneState();
}

class _ForgotPasswordWithPhoneState extends State<ForgotPasswordWithPhone> {
  final TextEditingController _phoneController = TextEditingController();

  // @override
  // void initState() {
  //   // : implement initState
  //   super.initState();
  // }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomMarketiAppBar(title: 'Forgot Password'),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: 20.0.w,
          vertical: 40.0.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Image.asset(MarketiImages.forgotPasswordWithPhone),
            SizedBox(height: 20.0.h),
            // Description
            TextApp(
              text:
                  'Please enter your phone number to receive a verification code',
              theme: MarketiTextStyles.textStyle16.copyWith(
                color: Colors.black38,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15.0.h),
            // Phone Number Text Field
            textFieldTitle(text: 'Phone Number'),
            PhoneTextField(phoneController: _phoneController, onTap: () {}),
            SizedBox(height: 22.0.h),
            // Send Code Button
            CustomButton(
              onPressed: () {},
              text: 'Send Code',
              width: double.infinity,
              height: 50.0.h,
              textColor: MarketiColors.whiteColor,
              backgroundColor: MarketiColors.lightBlue900Color,
            ),
            SizedBox(height: 15.0.h),
            // Try another way "With Email"
            Align(
              child: GestureDetector(
                onTap: () {
                  // Navigator.pop(context);
                  context.pushNamed(AppRoutes.forgotPasswordWithEmail);
                },
                child: TextApp(
                  text: 'Try another way',
                  theme: MarketiTextStyles.textStyle14.copyWith(
                    color: MarketiColors.lightBlue900Color,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding textFieldTitle({required String text}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h, top: 5.h),
      child: TextApp(
        text: text,
        theme: MarketiTextStyles.textStyle12.copyWith(
          color: MarketiColors.darkBlue900Color,
        ),
      ),
    );
  }
}
