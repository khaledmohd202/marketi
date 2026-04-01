import 'package:flutter/material.dart';
import 'package:marketi/core/common/ultis/app_regex.dart';
import 'package:marketi/core/common/widgets/custom_text_field.dart';
import 'package:marketi/core/const/icons/marketi_icons.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    required this.hintText, required this.emailController,
    super.key,
  });

  final TextEditingController emailController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: emailController,
      hintText: hintText,
      prefixIcon: Image.asset(
        MarketiIcons.emailIcon,
        scale: 0.8,
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        } else if (!AppRegex.isEmailValid(value)) {
          return 'Enter a valid email';
        }
        return null;
      },
    );
  }
}
