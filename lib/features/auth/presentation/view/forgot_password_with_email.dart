import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/custom_elevated_button.dart';
import 'package:marketi/core/common/widgets/custom_text_field.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/const/icons/marketi_icons.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';
import 'package:marketi/features/auth/presentation/widgets/custom_marketi_app_bar.dart';

class ForgotPasswordWithEmail extends StatefulWidget {
  const ForgotPasswordWithEmail({super.key});

  @override
  State<ForgotPasswordWithEmail> createState() =>
      _ForgotPasswordWithEmailState();
}

class _ForgotPasswordWithEmailState extends State<ForgotPasswordWithEmail> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomMarketiAppBar(title: 'Forgot Password'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 40.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              Align(child: Image.asset(MarketiImages.forgotPasswordWithEmail)),
              SizedBox(height: 20.0.h),
              // Description
              TextApp(
                text:
                    '''Please enter your email address to receive a verification code''',
                theme: MarketiTextStyles.textStyle16.copyWith(
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15.0.h),
              // Email Text Field
              textFieldTitle(text: 'Email'),
              CustomTextField(
                controller: _emailController,
                hintText: 'you@gmail.com',
                prefixIcon: Image.asset(
                  MarketiIcons.emailIcon,
                  scale: 0.8,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 22.0.h),
              // Send Code Button
              CustomButton(
                onPressed: () {
                  context.pushNamed(AppRoutes.verificationCodeWithEmail);
                },
                text: 'Send Code',
                width: double.infinity,
                height: 50.0.h,
                textColor: MarketiColors.whiteColor,
                backgroundColor: MarketiColors.lightBlue900Color,
              ),
              SizedBox(height: 15.0.h),
            ],
          ),
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
