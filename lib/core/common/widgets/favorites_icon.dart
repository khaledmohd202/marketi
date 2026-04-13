import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';

class FavoritesIcon extends StatelessWidget {
  const FavoritesIcon({
    required this.iconWidget,
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;
  final Widget iconWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(4.r),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: MarketiColors.greyColor.withValues(
                  alpha: 0.2,
                ),
                blurRadius: 5,
              ),
            ],
          ),
          child: iconWidget,
        ),
      );
  }
}
