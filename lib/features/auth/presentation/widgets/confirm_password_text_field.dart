import 'package:flutter/material.dart';
import 'package:marketi/core/common/widgets/custom_text_field.dart';

class ConfirmPasswordTextField extends StatelessWidget {
  const ConfirmPasswordTextField({
    required this.isPasswordVisible,
    required this.onTap,
    required this.confirmPasswordController,
    required this.passwordController,
    super.key,
  });

  final TextEditingController confirmPasswordController;
  final TextEditingController passwordController;
  final bool isPasswordVisible;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: confirmPasswordController,
      hintText: 'Confirm Password',
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
          return 'Confirm Password is required';
        } else if (value != passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }
}
