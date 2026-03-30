import 'package:flutter/material.dart';
import 'package:marketi/core/common/ultis/app_regex.dart';
import 'package:marketi/core/common/widgets/custom_text_field.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    required this.isPasswordVisible,
    required this.onTap,
    required this.passwordController,
    super.key,
  });

  final TextEditingController passwordController;
  final bool isPasswordVisible;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: passwordController,
      hintText: 'Password',
      prefixIcon: const Icon(Icons.lock_outline),
      suffixIcon: GestureDetector(
        onTap: onTap,
        child: Icon(
          isPasswordVisible ? Icons.visibility : Icons.visibility_off,
        ),
      ),
      obscureText: !isPasswordVisible,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        } else if (!AppRegex.isPasswordValid(value)) {
          return 'Min 8 chars, upper, lower, number & symbol';
        }
        return null;
      },
    );
  }
}
