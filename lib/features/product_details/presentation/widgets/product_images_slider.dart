import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';

class ProductImagesSlider extends StatefulWidget {
  const ProductImagesSlider({required this.image, super.key});
  final String image;

  @override
  State<ProductImagesSlider> createState() => _ProductImagesSliderState();
}

class _ProductImagesSliderState extends State<ProductImagesSlider> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  Timer? _timer;

  final List<String> _images = [
    MarketiImages.pampers,
    MarketiImages.pampers,
    MarketiImages.pampers,
    MarketiImages.pampers,
  ];

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        if (_currentIndex < _images.length - 1) {
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
    return Column(
      children: [
        SizedBox(
          height: 250.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  // child: Image.asset(
                  //   _images[index],
                  //   fit: BoxFit.contain,
                  // ),
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.fill,
                    scale: 0.8,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) => Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.grey,
                        size: 40.r,
                      ),
                    ),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
        // Thumbnails
        Center(
          child: SizedBox(
            height: 56.h,
            width: 260.w,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() => _currentIndex = index);
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 5.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _currentIndex == index
                            ? MarketiColors.lightBlue900Color
                            : Colors.transparent,
                        width: 3.w,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset(
                        widget.image,
                        width: 56.w,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            color: Colors.grey,
                            size: 56.r,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
