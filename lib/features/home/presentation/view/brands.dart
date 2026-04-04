import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/category_card.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/features/home/presentation/widgets/custom_view_all_app_bar.dart';

class Brands extends StatelessWidget {
  const Brands({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomViewAllAppBar(title: 'Brands'),
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
  MarketiImages.townTeamLogo,
  MarketiImages.jblLogo,
  MarketiImages.pampersLogo,
  MarketiImages.canonLogo,
  MarketiImages.appleLogo,
  MarketiImages.adidasLogo,
  MarketiImages.lacosteLogo,
  MarketiImages.toshibaLogo,
  MarketiImages.sonyLogo,
  MarketiImages.hpLogo,
];
final List<String> _categoriesTitles = [
  'Town Team',
  'JBL',
  'Pampers',
  'Canon',
  'Apple',
  'Adidas',
  'Lacoste',
  'Toshiba',
  'Sony',
  'HP',
];
