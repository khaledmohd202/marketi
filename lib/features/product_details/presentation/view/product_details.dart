import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:marketi/features/product_details/presentation/view_model/product_details_cubit.dart';
import 'package:marketi/features/product_details/presentation/widgets/product_app_bar.dart';
import 'package:marketi/features/product_details/presentation/widgets/product_bottom_bar.dart';
import 'package:marketi/features/product_details/presentation/widgets/product_images_slider.dart';
import 'package:marketi/features/product_details/presentation/widgets/product_info.dart';
import 'package:marketi/features/product_details/presentation/widgets/product_size_selector.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({required this.productId, super.key});
  final int productId;

  // @override
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is AddToCartSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
        }
        if (state is AddToCartFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
            builder: (context, state) {
              if (state is ProductDetailsLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ProductDetailsFailure) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                      ElevatedButton(
                        onPressed: () => context
                            .read<ProductDetailsCubit>()
                            .getProductDetails(
                              productId: productId,
                            ),
                        child: const Text('Try Again'),
                      ),
                    ],
                  ),
                );
              }

              if (state is ProductDetailsSuccess) {
                final product = state.product;

                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ProductAppBar(title: 'Product Details'),
                        ProductImagesSlider(image: product.thumbnail),
                        SizedBox(height: 20.h),
                        ProductInfo(product: product),
                        SizedBox(height: 10.h),
                        const ProductSizeSelector(),
                      ],
                    ),
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
        bottomNavigationBar:
            BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
              builder: (context, state) {
                if (state is ProductDetailsSuccess) {
                  return ProductBottomBar(product: state.product);
                }
                return const SizedBox.shrink();
              },
            ),
      ),
    );
  }
}
