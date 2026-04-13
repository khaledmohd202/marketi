import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/loading/loading_shimmer.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';
import 'package:marketi/features/home/presentation/view_model/brands/brands_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/custom_view_all_app_bar.dart';

class Brands extends StatelessWidget {
  const Brands({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomViewAllAppBar(title: 'Brands'),
      body: BlocBuilder<BrandsCubit, BrandsState>(
        builder: (context, state) {
          if (state is BrandsLoading) {
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
          if (state is BrandsSuccess) {
            final brands = state.brands;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 14.h),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: brands.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 15.w,
                  crossAxisSpacing: 5.h,
                  // childAspectRatio: 0.7,
                  mainAxisExtent: 150.h,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 110.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: MarketiColors.lightBlue100Color,
                          ),
                        ),
                        // child: ClipRRect(
                        //   borderRadius: BorderRadius.circular(15.r),
                        //   // child: Image.network(
                        //   //   image,
                        //   //   fit: BoxFit.fill,
                        //   //   scale: 0.5,
                        //   // ),
                        // ),
                        child: Center(
                          child: Text(
                            brands[index].emoji,
                            style: TextStyle(fontSize: 40.sp),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      TextApp(
                        text: brands[index].name,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        theme: MarketiTextStyles.textStyle14.copyWith(
                          color: MarketiColors.darkBlue900Color,
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
