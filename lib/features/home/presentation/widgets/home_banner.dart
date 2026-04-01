import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> _bannerImages = [
    MarketiImages.banner1,
    MarketiImages.banner1,
    MarketiImages.banner1,
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        if (_currentIndex < _bannerImages.length - 1) {
          _currentIndex++;
        } else {
          _currentIndex = 0;
        }

        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        children: [
          SizedBox(
            height: 140.h,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: _bannerImages.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.asset(
                    _bannerImages[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _bannerImages.length,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                width: _currentIndex == index ? 12.w : 6.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: _currentIndex == index
                      ? MarketiColors.lightBlue900Color
                      : MarketiColors.greyColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
