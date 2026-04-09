import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/custom_elevated_button.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';
import 'package:marketi/features/auth/data/model/sign_in_request_model.dart';
import 'package:marketi/features/auth/presentation/view_model/sign_in_cubit.dart';
import 'package:marketi/features/auth/presentation/widgets/authentication_with_social_media.dart';
import 'package:marketi/features/auth/presentation/widgets/email_text_field.dart';
import 'package:marketi/features/auth/presentation/widgets/password_text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _rememberMe = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            _successSnackBar(state, context),
          );
          context.pushNamedAndRemoveUntil(AppRoutes.main);
        } else if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            _errorSnackBar(state, context),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 10.h,
              ),
              child: Form(
                key: _formKey,
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
                      // CustomTextField(
                      //   controller: _emailController,
                      //   hintText: 'UserName or Email',
                      //   prefixIcon: Image.asset(
                      //     MarketiIcons.emailIcon,
                      //     scale: 0.8,
                      //   ),
                      //   keyboardType: TextInputType.emailAddress,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Email is required';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      EmailTextField(
                        emailController: _emailController,
                        hintText: 'UserName or Email',
                      ),
                      // Password Text Field
                      SizedBox(height: 15.h),
                      // CustomTextField(
                      //   controller: _passwordController,
                      //   hintText: 'Password',
                      //   prefixIcon: const Icon(Icons.lock_outline),
                      //   suffixIcon: GestureDetector(
                      //     onTap: () {
                      //       setState(() {
                      //         _isPasswordVisible = !_isPasswordVisible;
                      //       });
                      //     },
                      //     child: Icon(
                      //       _isPasswordVisible
                      //           ? Icons.visibility
                      //           : Icons.visibility_off,
                      //     ),
                      //   ),
                      //   obscureText: !_isPasswordVisible,
                      //   keyboardType: TextInputType.visiblePassword,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Password is required';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      PasswordTextField(
                        passwordController: _passwordController,
                        isPasswordVisible: _isPasswordVisible,
                        onTap: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      // Forgot Password Button
                      _forgotPasswordPart(),
                      SizedBox(height: 10.h),
                      // Log In Button
                      if (state is SignInLoading)
                        const Center(
                          child: CircularProgressIndicator(
                            color: MarketiColors.lightBlue900Color,
                          ),
                        )
                      else
                        CustomButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<SignInCubit>().signIn(
                                signInRequestModel: SignInRequestModel(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                            }
                          },
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
          ),
        );
      },
    );
  }

  SnackBar _successSnackBar(SignInSuccess state, BuildContext context) {
    return SnackBar(
      content: Text(
        state.signInResponseModel.message,
        style: const TextStyle(color: Colors.white),
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: 20.h,
        left: 16.w,
        right: 16.w,
      ),
      backgroundColor: MarketiColors.darkBlue100Color,
    );
  }

  SnackBar _errorSnackBar(SignInFailure state, BuildContext context) {
    return SnackBar(
      content: Text(
        state.errorMessage,
        style: const TextStyle(color: Colors.red),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      margin: EdgeInsets.only(
        bottom: 20.h,
        left: 50.w,
        right: 50.w,
      ),
      backgroundColor: Colors.white,
    );
  }

  Row _forgotPasswordPart() {
    return Row(
      children: [
        Checkbox(
          value: _rememberMe,
          onChanged: (value) {
            setState(() {
              _rememberMe = value!;
            });
          },
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
}
