import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/custom_text_field.dart';
import 'package:marketi/core/const/icons/marketi_icons.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    required this.phoneController,
    required this.onTap,
    this.validator,
    super.key,
  });

  final TextEditingController phoneController;
  final void Function()? onTap;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: phoneController,
      hintText: '+20 106 004 0675',
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
              onTap: onTap,
              child: Image.asset(
                MarketiIcons.arrowIcon,
                scale: 0.8,
              ),
            ),
          ],
        ),
      ),
      keyboardType: TextInputType.phone,
      validator: validator,
    );
  }
}
