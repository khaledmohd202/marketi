import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/loading/loading_shimmer.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/features/home/presentation/view_model/brands/brands_cubit.dart';

class HomeBrands extends StatelessWidget {
  const HomeBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsCubit, BrandsState>(
      builder: (context, state) {
        if (state is BrandsLoading) {
          ListView.separated(
            // padding: EdgeInsets.symmetric(horizontal: 5.w),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            separatorBuilder: (context, index) => SizedBox(width: 5.w),
            itemBuilder: (context, index) {
              return LoadingShimmer(width: 105.w, height: 100.h);
            },
          );
        }
        if (state is BrandsSuccess) {
          final brands = state.brands.take(6).toList();
          return SizedBox(
            height: 100.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: brands.length,
              separatorBuilder: (context, index) => SizedBox(width: 5.w),
              itemBuilder: (context, index) {
                return Container(
                  width: 105.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                    boxShadow: [
                      BoxShadow(
                        color: MarketiColors.greyColor.withValues(alpha: 0.2),
                        blurRadius: 10.r,
                      ),
                    ],
                  ),
                  // child: Image.network('', fit: BoxFit.contain),
                  child: Center(
                    child: Text(
                      brands[index].emoji,
                      style: TextStyle(fontSize: 40.sp),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
