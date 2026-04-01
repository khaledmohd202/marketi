import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/category_card.dart';
import 'package:marketi/core/const/images/marketi_images.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 10.h),

      child: SizedBox(
        height: 300.h,
        child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10.w,
            crossAxisSpacing: 10.h,
            childAspectRatio: 0.7,
            // mainAxisExtent: 100.h,
          ),
          itemBuilder: (context, index) {
            return CategoryCard(
              image: _categoriesImages[index],
              title: _categoriesTitles[index],
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}

final List<String> _categoriesImages = [
  MarketiImages.pampers,
  MarketiImages.headphones,
  MarketiImages.plant,
  MarketiImages.motorilla,
  MarketiImages.food,
  MarketiImages.fashion,
];
final List<String> _categoriesTitles = [
  'Pampers',
  'Electronics',
  'Plants',
  'Phones',
  'Food',
  'Fashion',
];
