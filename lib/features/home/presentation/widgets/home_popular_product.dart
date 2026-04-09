import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/loading/loading_shimmer.dart';
import 'package:marketi/core/common/widgets/product_card.dart';
import 'package:marketi/features/home/presentation/view_model/products/products_cubit.dart';
import 'package:marketi/features/product_details/presentation/view/product_details.dart';

class HomePopularProduct extends StatelessWidget {
  const HomePopularProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return SizedBox(
            height: 205.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return LoadingShimmer(height: 200.h, width: 170.w);
              },
              separatorBuilder: (context, index) => SizedBox(width: 10.w),
              itemCount: 3,
            ),
          );
        }

        if (state is ProductsSuccess) {
          final products = state.products.take(3).toList();

          return Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 10.h),
            child: SizedBox(
              height: 205.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ProductCard(
                    discount: products[index].discountPercentage.toString(),
                    image: products[index].thumbnail,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => const ProductDetails(),
                        ),
                      );
                    },
                    name: products[index].title,
                    price: products[index].price.toString(),
                    rating: products[index].rating,
                    selectedIcon: Icons.favorite,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 10.w),
                itemCount: products.length,
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
