import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/category_card.dart';
import 'package:marketi/core/common/widgets/loading/loading_shimmer.dart';
import 'package:marketi/features/home/presentation/view_model/categories/categories_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/custom_view_all_app_bar.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomViewAllAppBar(title: 'Categories'),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 15,
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
          if (state is CategoriesFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: TextStyle(color: Colors.red, fontSize: 28.sp),
              ),
            );
          }
          if (state is CategoriesSuccess) {
            final categories = state.categories;
            return SizedBox(
              width: double.infinity,
              // height: ,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 15.w,
                    crossAxisSpacing: 5.h,
                    // childAspectRatio: 0.7,
                    mainAxisExtent: 150.h,
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
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
