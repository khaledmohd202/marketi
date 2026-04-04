import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/category_card.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/features/home/presentation/widgets/custom_view_all_app_bar.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomViewAllAppBar(title: 'Categories'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 14.h),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: _categoriesImages.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 15.w,
            crossAxisSpacing: 5.h,
            // childAspectRatio: 0.7,
            mainAxisExtent: 150.h,
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
  'Furniture',
  'Phones',
  'Food',
  'Fashion',
  'Plants',
  'Gaming',
  'Pampers',
  'Electronics',
  'Furniture',
  'Phones',
  'Food',
  'Fashion',
  'Plants',
  'Gaming',
];
