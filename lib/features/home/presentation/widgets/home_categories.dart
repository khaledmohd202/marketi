import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/category_card.dart';
import 'package:marketi/core/loading/loading_shimmer.dart';
import 'package:marketi/features/home/presentation/view_model/categories/categories_cubit.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return GridView.builder(
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
              return LoadingShimmer(height: 120.h, width: 100.w);
            },
          );
        }
        if (state is CategoriesSuccess) {
          final categories = state.categories.take(6).toList();
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
                    image: categories[index].image,
                    title: categories[index].name,
                    onTap: () {},
                  );
                },
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
