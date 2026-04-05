import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';

class ProductSizeSelector extends StatefulWidget {
  const ProductSizeSelector({super.key});

  @override
  State<ProductSizeSelector> createState() => _ProductSizeSelectorState();
}

class _ProductSizeSelectorState extends State<ProductSizeSelector> {
  int _selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(
          text: 'Select Size',
          theme: MarketiTextStyles.textStyle16.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          children: List.generate(
            3,
            (index) => GestureDetector(
              onTap: () => setState(() => _selectedSize = index),
              child: Container(
                margin: EdgeInsets.only(right: 8.w),
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _selectedSize == index
                        ? MarketiColors.lightBlue900Color
                        : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: TextApp(
                    text: '${index + 1}',
                    theme: MarketiTextStyles.textStyle14,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
