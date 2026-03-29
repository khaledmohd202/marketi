import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/custom_elevated_button.dart';
import 'package:marketi/core/common/widgets/custom_text_field.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/const/icons/marketi_icons.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';
import 'package:marketi/features/auth/presentation/widgets/authentication_with_social_media.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 10.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Back button and logo
                SizedBox(height: 40.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomButton(
                    onPressed: () {
                      // context.pushNamed(AppRoutes.home);
                    },
                    text: 'Skip',
                    width: 100.w,
                    height: 45.h,
                    backgroundColor: MarketiColors.whiteColor,
                    textColor: MarketiColors.lightBlue900Color,
                  ),
                ),
                Image.asset(MarketiImages.logoLogin),

                // Email Text Field
                CustomTextField(
                  controller: _emailController,
                  hintText: 'UserName or Email',
                  prefixIcon: Image.asset(
                    MarketiIcons.emailIcon,
                    scale: 0.8,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                // Password Text Field
                // textFieldTitle(text: 'Password'),
                SizedBox(height: 15.h),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: const Icon(Icons.visibility_off),
                  keyboardType: TextInputType.visiblePassword,
                ),
                // Forgot Password Button
                _forgotPasswordPart(),
                SizedBox(height: 10.h),
                // Log In Button
                CustomButton(
                  onPressed: () {},
                  text: 'Log In',
                  width: double.infinity,
                  height: 50.h,
                  backgroundColor: MarketiColors.lightBlue900Color,
                  textColor: MarketiColors.whiteColor,
                ),

                SizedBox(height: 15.h),
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextApp(
                      text: 'Are you new in Marketi? ',
                      theme: MarketiTextStyles.textStyle12.copyWith(
                        color: MarketiColors.greyColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to Sign Up screen
                        context.pushNamed(AppRoutes.signUp);
                      },
                      child: TextApp(
                        text: 'Sign Up',
                        theme: MarketiTextStyles.textStyle12.copyWith(
                          color: MarketiColors.lightBlue900Color,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _forgotPasswordPart() {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (value) {},
          activeColor: MarketiColors.lightBlue900Color,
        ),
        // SizedBox(width: 5.w),
        TextApp(
          text: 'Remember Me',
          theme: MarketiTextStyles.textStyle12.copyWith(
            color: MarketiColors.greyColor,
          ),
        ),
        const Spacer(),

        TextButton(
          onPressed: () {
            context.pushNamed(AppRoutes.forgotPasswordWithPhone);
          },
          child: TextApp(
            text: 'Forgot Password?',
            theme: MarketiTextStyles.textStyle12.copyWith(
              color: MarketiColors.lightBlue900Color,
            ),
          ),
        ),
      ],
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
