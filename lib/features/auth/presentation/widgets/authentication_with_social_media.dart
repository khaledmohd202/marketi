import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/const/icons/marketi_icons.dart';

class AuthenticationWithSocialMedia extends StatelessWidget {
  const AuthenticationWithSocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Image.asset(MarketiIcons.googleIcon, scale: 0.85),
          onPressed: () {},
        ),
        SizedBox(width: 10.w),
        IconButton(
          icon: Image.asset(MarketiIcons.facebookIcon, scale: 0.85),
          onPressed: () {},
        ),
        SizedBox(width: 10.w),
        IconButton(
          icon: Image.asset(MarketiIcons.appleIcon, scale: 0.85),
          onPressed: () {},
        ),
      ],
    );
  }
}
