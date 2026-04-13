import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/custom_circle_avatar.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/const/icons/marketi_icons.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCircleAvatar(
          onTap: () => context.pushNamed(AppRoutes.profile),
          width: 60.w,
          height: 60.h,
          radius: 30.r,
          imageUrl: MarketiImages.khaled,
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
