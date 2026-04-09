import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/product_card.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/loading/loading_shimmer.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';
import 'package:marketi/features/home/presentation/view_model/products/products_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/custom_view_all_app_bar.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({super.key});

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    context.read<ProductsCubit>().getAllProducts();

    // Pagination
    _scrollController.addListener(() {
      if (_scrollController.position.extentAfter < 500) {
        context.read<ProductsCubit>().getAllProducts();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomViewAllAppBar(title: 'Popular Products'),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          final cubit = context.watch<ProductsCubit>();

          if (state is ProductsLoading && cubit.products.isEmpty) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
              child: GridView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5.w,
                  crossAxisSpacing: 10.h,
                  // childAspectRatio: 0.7,
                  mainAxisExtent: 250.h,
                ),
                itemBuilder: (context, index) {
                  return LoadingShimmer(height: 250.h, width: 170.w);
                },
              ),
            );
          }
          if (state is ProductsFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: TextStyle(color: Colors.red, fontSize: 28.sp),
              ),
            );
          }
          if (state is ProductsSuccess || cubit.products.isNotEmpty) {
            final products = cubit.products;

            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 14.h,
                  ),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index >= products.length) {
                          return LoadingShimmer(
                            height: 250.h,
                            width: 170.w,
                          );
                        }
                        return ProductCard(
                          name: products[index].title,
                          price: products[index].price.toString(),
                          rating: products[index].rating,
                          image: products[index].thumbnail,
                          onTap: () {},
                          selectedIcon: Icons.favorite,
                          bottomAddWidget: _buildAddButton(),
                        );
                      },
                      childCount: products.length + (cubit.hasMore ? 2 : 0),
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5.w,
                      crossAxisSpacing: 10.w,
                      mainAxisExtent: 250.h,
                    ),
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Center _buildAddButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 35.h),
          backgroundColor: Colors.white,
          foregroundColor: MarketiColors.lightBlue700Color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
            side: BorderSide(
              color: MarketiColors.lightBlue700Color,
              width: 1.w,
            ),
          ),
        ),
        child: TextApp(
          text: 'Add',
          theme: MarketiTextStyles.textStyle16,
        ),
      ),
    );
  }
}
