import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';

class AuthUpperPart extends StatelessWidget {
  const AuthUpperPart({
    required this.icon,
    required this.logo,
    super.key,
  });
  final Widget icon;
  final String logo;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: icon,
        ),
        Image.asset(logo),
      ],
    );
  }
}
