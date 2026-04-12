import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/const/icons/marketi_icons.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    required this.controller,
    super.key,
    this.onTap,
    this.onPressedFilter,
  });
  final TextEditingController controller;
  final VoidCallback? onTap;
  final VoidCallback? onPressedFilter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        absorbing: onTap != null,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          child: Container(
            padding: EdgeInsets.only(left: 10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: BoxBorder.all(
                color: MarketiColors.lightBlue200Color,
                width: 3.w,
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: MarketiColors.greyColor,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: TextField(
                    controller: controller,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: 'What are you looking for ?',
                      hintStyle: MarketiTextStyles.textStyle14.copyWith(
                        color: MarketiColors.greyColor,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                    ),
                  ),
                ),
                // SizedBox(width: 15.w),
                // const Spacer(),
                IconButton(
                  onPressed: onPressedFilter,
                  icon: Image.asset(
                    MarketiIcons.filterIcon,
                    scale: 0.8,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
