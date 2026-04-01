import 'package:flutter/material.dart';
import 'package:marketi/core/common/widgets/custom_text_field.dart';
import 'package:marketi/core/const/icons/marketi_icons.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({
    required this.nameController,
    super.key,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: nameController,
      hintText: 'Full Name',
      prefixIcon: Image.asset(
        MarketiIcons.nameIcon,
        scale: 0.8,
      ),
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Name is required';
        }
        return null;
      },
    );
  }
}
