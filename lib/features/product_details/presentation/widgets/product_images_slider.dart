import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';

class ProductImagesSlider extends StatefulWidget {
  const ProductImagesSlider({required this.images, super.key});
  final List<String> images;

  @override
  State<ProductImagesSlider> createState() => _ProductImagesSliderState();
}

class _ProductImagesSliderState extends State<ProductImagesSlider> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  Timer? _timer;

  List<String> get _displayImages =>
      widget.images.isNotEmpty ? widget.images : [];

  @override
  void initState() {
    super.initState();
    if (_displayImages.length > 1) {
      _timer = Timer.periodic(
        const Duration(seconds: 5),
        (timer) {
          if (_currentIndex < _displayImages.length - 1) {
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
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_displayImages.isEmpty) {
      return SizedBox(
        height: 250.h,
        child: Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            color: Colors.grey,
            size: 60.r,
          ),
        ),
      );
    }
    return Column(
      children: [
        SizedBox(
          height: 250.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.network(
                    widget.images[index],
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
              itemCount: widget.images.length,
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
                      child: Image.network(
                        _displayImages[index],
                        width: 56.w,
                        height: 56.h,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => Icon(
                          Icons.image_not_supported_outlined,
                          size: 30.r,
                        ),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return SizedBox(
                            width: 56.w,
                            height: 56.h,
                            child: const Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          );
                        },
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
