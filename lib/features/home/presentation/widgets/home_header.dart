import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/const/icons/marketi_icons.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
            // color: MarketiColors.lightBlue500Color,
            // color: Colors.red,
            borderRadius: BorderRadius.circular(30.r),
            border: BoxBorder.all(
              color: MarketiColors.lightBlue500Color,
              width: 3.w,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: CircleAvatar(
              radius: 25.r,
              backgroundImage: const AssetImage(MarketiImages.khaled),
              // backgroundImage: NetworkImage(
              //   CacheHelper().getDataString(key: ApiKey.image) ??
              //       MarketiImages.khaled,
              // ),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: 'Hi Khaled! 🤍',
          // text: 'Hi ${CacheHelper().getData(key: ApiKey.name)}  🤍',
          theme: MarketiTextStyles.textStyle20.copyWith(
            color: MarketiColors.darkBlue900Color,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Image.asset(MarketiIcons.notificationsIcon),
        ),
      ],
    );
  }
}
