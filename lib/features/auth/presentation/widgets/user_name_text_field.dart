import 'package:flutter/material.dart';
import 'package:marketi/core/common/widgets/custom_text_field.dart';

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({
    required this.usernameController, super.key,
  });

  final TextEditingController usernameController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: usernameController,
      hintText: 'User Name',
      prefixIcon: const Icon(Icons.person_outline),
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Username is required';
        }
        return null;
      },
    );
  }
}
