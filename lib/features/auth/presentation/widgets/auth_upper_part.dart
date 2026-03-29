import 'package:flutter/material.dart';
import 'package:marketi/core/const/icons/marketi_icons.dart';
import 'package:marketi/core/const/images/marketi_images.dart';

class AuthUpperPart extends StatelessWidget {
  const AuthUpperPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(MarketiIcons.backButton),
        ),
        Image.asset(MarketiImages.logoSignUp),
      ],
    );
  }
}
