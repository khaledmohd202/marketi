import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/custom_elevated_button.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/const/icons/marketi_icons.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/const/strings/marketi_strings.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';
import 'package:marketi/features/auth/data/model/sign_up_request_model.dart';
import 'package:marketi/features/auth/presentation/view_model/sign_up_cubit.dart';
import 'package:marketi/features/auth/presentation/widgets/auth_upper_part.dart';
import 'package:marketi/features/auth/presentation/widgets/authentication_with_social_media.dart';
import 'package:marketi/features/auth/presentation/widgets/confirm_password_text_field.dart';
import 'package:marketi/features/auth/presentation/widgets/email_text_field.dart';
import 'package:marketi/features/auth/presentation/widgets/name_text_field.dart';
import 'package:marketi/features/auth/presentation/widgets/password_text_field.dart';
import 'package:marketi/features/auth/presentation/widgets/phone_text_field.dart';
import 'package:marketi/features/auth/presentation/widgets/user_name_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            _successSnackBar(state, context),
          );
          context.pushNamedAndRemoveUntil(AppRoutes.login);
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            _errorSnackBar(state, context),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Back button and logo
                      SizedBox(height: 15.h),
                      AuthUpperPart(
                        icon: Image.asset(MarketiIcons.backButton),
                        logo: MarketiImages.logoSignUp,
                      ),
                      // Full Name Text Field
                      textFieldTitle(text: MarketiStrings.name),
                      NameTextField(nameController: _nameController),
                      // UserName Text Field
                      textFieldTitle(text: MarketiStrings.userName),
                      UserNameTextField(
                        usernameController: _usernameController,
                      ),
                      // Phone Number Text Field
                      textFieldTitle(text: MarketiStrings.phoneNumber),
                      PhoneTextField(
                        phoneController: _phoneController,
                        onTap: () {},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return MarketiStrings.phoneIsRequired;
                          }
                          return null;
                        },
                      ),
                      // Email Text Field
                      textFieldTitle(text: MarketiStrings.email),
                      EmailTextField(emailController: _emailController, hintText: 'you@gmail.com',),
                      // Password Text Field
                      textFieldTitle(text: MarketiStrings.password),
                      PasswordTextField(
                        passwordController: _passwordController,
                        isPasswordVisible: _isPasswordVisible,
                        onTap: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      // Confirm Password Text Field
                      textFieldTitle(text: MarketiStrings.confirmPassword),
                      ConfirmPasswordTextField(
                        confirmPasswordController: _confirmPasswordController,
                        passwordController: _passwordController,
                        isPasswordVisible: _isConfirmPasswordVisible,
                        onTap: () {
                          setState(() {
                            _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                      SizedBox(height: 15.h),
                      // Sign Up Button
                      if (state is SignUpLoading)
                        const Center(
                          child: CircularProgressIndicator(
                            color: MarketiColors.lightBlue900Color,
                          ),
                        )
                      else
                        _signUpButton(context),

                      SizedBox(height: 5.h),
                      // Or sign up with social media
                      Center(
                        child: TextApp(
                          text: MarketiStrings.orContinueWith,
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
          ),
        );
      },
    );
  }

  SnackBar _errorSnackBar(SignUpFailure state, BuildContext context) {
    return SnackBar(
            content: Text(
              state.errorMessage,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 150.h,
              left: 50.w,
              right: 50.w,
            ),
            backgroundColor: Colors.white,
          );
  }

  SnackBar _successSnackBar(SignUpSuccess state, BuildContext context) {
    return SnackBar(
            content: Text(
              state.signUpResponseModel.message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height - 100.h,
            ),
            backgroundColor: MarketiColors.darkBlue100Color,
          );
  }

  CustomButton _signUpButton(BuildContext context) {
    return CustomButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.read<SignUpCubit>().signUp(
            signUpRequestModel: SignUpRequestModel(
              name: _nameController.text,
              email: _emailController.text,
              password: _passwordController.text,
              confirmPassword: _confirmPasswordController.text,
              phone: _phoneController.text,
            ),
          );
        }
      },
      text: 'Sign Up',
      width: double.infinity,
      height: 50.h,
      backgroundColor: MarketiColors.lightBlue900Color,
      textColor: MarketiColors.whiteColor,
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
