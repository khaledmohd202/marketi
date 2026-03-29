import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/custom_elevated_button.dart';
import 'package:marketi/core/common/widgets/custom_text_field.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/const/icons/marketi_icons.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';
import 'package:marketi/features/auth/presentation/widgets/auth_upper_part.dart';
import 'package:marketi/features/auth/presentation/widgets/authentication_with_social_media.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button and logo
                SizedBox(height: 15.h),
                const AuthUpperPart(),
                // Full Name Text Field
                textFieldTitle(text: 'Full Name'),
                CustomTextField(
                  controller: _nameController,
                  hintText: 'Full Name',
                  prefixIcon: Image.asset(
                    MarketiIcons.nameIcon,
                    scale: 0.8,
                  ),
                  keyboardType: TextInputType.name,
                ),
                // UserName Text Field
                textFieldTitle(text: 'User Name'),
                CustomTextField(
                  controller: _usernameController,
                  hintText: 'User Name',
                  prefixIcon: const Icon(Icons.person_outline),
                  keyboardType: TextInputType.name,
                ),
                // Phone Number Text Field
                textFieldTitle(text: 'Phone Number'),
                _phoneTextField(),
                // Email Text Field
                textFieldTitle(text: 'Email'),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  prefixIcon: Image.asset(
                    MarketiIcons.emailIcon,
                    scale: 0.8,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
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
                SizedBox(height: 15.h),
                // Sign Up Button
                CustomButton(
                  onPressed: () {},
                  text: 'Sign Up',
                  width: double.infinity,
                  height: 50.h,
                  backgroundColor: MarketiColors.lightBlue900Color,
                  textColor: MarketiColors.whiteColor,
                ),

                SizedBox(height: 5.h),
                // Or sign up with social media
                Center(
                  child: TextApp(
                    text: 'Or Continue with',
                    theme: MarketiTextStyles.textStyle12.copyWith(
                      color: MarketiColors.greyColor,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                // Social media buttons
                const AuthenticationWithSocialMedia(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CustomTextField _phoneTextField() {
    return CustomTextField(
      controller: _phoneController,
      hintText: '+20 1060040675',
      prefixIcon: Padding(
        padding: EdgeInsets.only(left: 15.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              MarketiIcons.phoneIcon,
              scale: 0.8,
            ),
            SizedBox(width: 5.w),
            InkWell(
              onTap: () {},
              child: Image.asset(
                MarketiIcons.arrowIcon,
                scale: 0.8,
              ),
            ),
          ],
        ),
      ),
      keyboardType: TextInputType.phone,
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
