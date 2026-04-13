import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              MarketiImages.profileHeader,
              width: double.infinity,
              height: 250.h,
              fit: BoxFit.fill,
            ),
            Positioned(
              bottom: 20.r,
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: MarketiColors.lightBlue500Color,
                          width: 3.w,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 50.r,
                        backgroundImage: const AssetImage(MarketiImages.khaled),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 15.r,
                        backgroundColor: Colors.white,
                        child: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.camera_alt,
                            color: MarketiColors.lightBlue900Color,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 60.h),
            Positioned(
              left: 0,
              right: 0,
              bottom: 40.h,
              child: Column(
                children: [
                  TextApp(
                    text: 'Khaled',
                    theme: MarketiTextStyles.textStyle18.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextApp(
                    text: 'khaledmohd202@gmail.com',
                    theme: MarketiTextStyles.textStyle12.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
