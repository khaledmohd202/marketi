import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/custom_elevated_button.dart';
import 'package:marketi/core/common/widgets/custom_text_field.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';
import 'package:marketi/features/auth/presentation/widgets/custom_marketi_app_bar.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomMarketiAppBar(title: 'Create New Password'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              Image.asset(MarketiImages.createNewPassword),
              SizedBox(height: 20.0.h),
              // Description
              Center(
                child: TextApp(
                  text: 'New password must be\n different from last password',
                  theme: MarketiTextStyles.textStyle14.copyWith(
                    color: Colors.black45,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 25.0.h),
              // New Password Text Field
              // Password Text Field
              textFieldTitle(text: 'Password'),
              CustomTextField(
                controller: _passwordController,
                hintText: 'Password',
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: const Icon(Icons.visibility_off),
                keyboardType: TextInputType.visiblePassword,
              ),
              // Confirm Password Text Field
              textFieldTitle(text: 'Confirm Password'),
              CustomTextField(
                controller: _confirmPasswordController,
                hintText: 'Confirm Password',
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: const Icon(Icons.visibility_off),
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 30.h),
              // Save Button
              CustomButton(
                onPressed: () {
                  context.pushNamedAndRemoveUntil(AppRoutes.resetPasswordDone);
                },
                text: 'Save',
                width: double.infinity,
                height: 50.0.h,
                textColor: MarketiColors.whiteColor,
                backgroundColor: MarketiColors.lightBlue900Color,
              ),
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
