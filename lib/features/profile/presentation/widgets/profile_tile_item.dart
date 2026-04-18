import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';

class ProfileTileItem extends StatelessWidget {
  const ProfileTileItem({
    required this.icon,
    required this.isToggle,
    required this.title,
    super.key,
    this.color,
    this.onTap,
    this.toggleValue,
    this.onToggleChanged,
  });

  final IconData? icon;
  final String title;
  final VoidCallback? onTap;
  final bool isToggle;
  final Color? color;
  final bool? toggleValue;
  final ValueChanged<bool>? onToggleChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
      leading: Icon(icon, color: color ?? Colors.grey, size: 30.sp),
      title: TextApp(
        text: title,
        theme: MarketiTextStyles.textStyle14.copyWith(color: color),
      ),
      trailing: isToggle
          ? Switch(
              value: toggleValue ?? false,
              onChanged: onToggleChanged ?? (_) {},
            )
          : Icon(Icons.arrow_forward_ios, size: 16.sp),
      onTap: onTap,
    );
  }
}
