import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';
import 'package:marketi/features/onboarding/data/model/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingList.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = onboardingList[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(item.imageUrl),
                      SizedBox(height: 30.h),
                      Text(
                        item.title,
                        style: MarketiTextStyles.textStyle22,
                      ),
                      SizedBox(height: 15.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          item.description,
                          style: MarketiTextStyles.textStyle14,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Dots Indicator
            SmoothPageIndicator(
              controller: _pageController,
              count: onboardingList.length,
              effect: ExpandingDotsEffect(
                activeDotColor: MarketiColors.lightBlue900Color,
                dotColor: MarketiColors.lightBlue500Color,
                dotHeight: 15.h,
                dotWidth: 15.w,
              ),
            ),

            SizedBox(height: 15.h),

            // Next Button
            Padding(
              padding: EdgeInsets.all(20.dg),
              child: nextButton(),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton nextButton() {
    return ElevatedButton(
      onPressed: () {
        if (currentIndex == onboardingList.length - 1) {
          context.pushNamedAndRemoveUntil(AppRoutes.signIn);
        } else {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        }
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 55.w),
        backgroundColor: MarketiColors.lightBlue900Color,
        foregroundColor: MarketiColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      child: Text(
        currentIndex == onboardingList.length - 1 ? 'Get Started' : 'Next',
        style: MarketiTextStyles.textStyle16,
      ),
    );
  }
}
