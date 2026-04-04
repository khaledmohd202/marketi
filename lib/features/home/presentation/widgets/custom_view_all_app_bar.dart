import 'package:flutter/material.dart';
import 'package:marketi/core/const/icons/marketi_icons.dart';

class CustomViewAllAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomViewAllAppBar({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      // elevation: 0,
      title: Text(title),
      centerTitle: true,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Image.asset(MarketiIcons.backButton),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
