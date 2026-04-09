import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/loading/loading_shimmer.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_bottom.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_header.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_product_card.dart';
import 'package:marketi/features/home/data/models/products/product_model.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCart();
  }

  final Map<int, int> _quantities = {};

  void _initQuantities(List<ProductModel> products) {
    for (final product in products) {
      _quantities.putIfAbsent(product.id, () => 1);
    }
  }

  double _calcTotalPrice(List<ProductModel> products) {
    return products.fold(
      0,
      (sum, p) => sum + (p.price * (_quantities[p.id] ?? 1)),
    );
  }

  int _calcTotalItems() {
    return _quantities.values.fold(0, (sum, q) => sum + q);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        child: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            if (state is DeleteFromCartSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.green,
                ),
              );
            }

            if (state is DeleteFromCartFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<CartCubit>();

            if (state is CartLoading && cubit.cartModel == null) {
              return Column(
                children: [
                  const CommonHeader(title: 'My Cart'),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: ListView.separated(
                      itemCount: 8,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10.h),
                      itemBuilder: (context, index) => LoadingShimmer(
                        height: 100.h,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ],
              );
            }

            // repeat to get The products
            if (state is CartFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                    ElevatedButton(
                      onPressed: cubit.getCart,
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              );
            }

            final cart = cubit.cartModel;
            // Empty
            if (cart == null || cart.list.isEmpty) {
              return const Column(
                children: [
                  CommonHeader(title: 'My Cart'),
                  Expanded(
                    child: Center(child: Text('Your cart is empty!')),
                  ),
                ],
              );
            }

            // To get the total price.
            _initQuantities(cart.list);

            return Column(
              children: [
                // Header
                const CommonHeader(
                  title: 'My Cart',
                ),
                SizedBox(height: 10.h),
                // Products List
                Expanded(
                  child: ListView.separated(
                    itemCount: cart.list.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 10.h),
                    itemBuilder: (context, index) {
                      final product = cart.list[index];


                      return CartProductCard(
                        image: product.thumbnail,
                        productTitle: product.title,
                        description: product.description,
                        price: product.price.toString(),
                        rating: product.rating.toString(),
                        selectedIcon: Icons.favorite,
                        onDecrement: () {
                          setState(() {
                            _quantities[product.id] =
                                (_quantities[product.id] ?? 1) - 1;
                          });
                        },
                        onDelete: () {
                          cubit.deleteFromCart(
                            productId: product.id.toString(),
                          );
                        },
                        onIncrement: () {
                          setState(() {
                            _quantities[product.id] =
                                (_quantities[product.id] ?? 1) + 1;
                          });
                        },
                        quantity: _quantities[product.id] ?? 1,
                      );
                    },
                  ),
                ),
                // Checkout Button
                CartBottom(
                  // totalItems: cubit.cartModel!.list.length.toString(),
                  // totalPrice: totalPrice.toStringAsFixed(2),
                  totalItems: _calcTotalItems().toString(),
                  totalPrice: _calcTotalPrice(cart.list).toStringAsFixed(2),
                  onPressed: () => context.pushNamed(AppRoutes.cartCheckout),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

double get totalPrice {
  return productPrices.fold(0, (sum, price) => sum + double.parse(price));
}

final List<String> productImages = [
  MarketiImages.pampersCart1,
  MarketiImages.pampersCart2,
  MarketiImages.pampersCart3,
  MarketiImages.pampersCart1,
  MarketiImages.pampersCart2,
  MarketiImages.pampersCart3,
];

final List<String> productNames = [
  'Pampers Swaddlers Diapers',
  'Seventh Generation Diapers',
  'Pampers Swaddlers Diapers',
  'Pampers Swaddlers Diapers',
  'Seventh Generation Diapers',
  'Pampers Swaddlers Diapers',
];

final List<String> productDescriptions = [
  '84 Diapers',
  '24 Diapers',
  '152 Diapers',
  '84 Diapers',
  '24 Diapers',
  '152 Diapers',
];

final List<String> productPrices = [
  '345.00',
  '88.00',
  '599.00',
  '345.00',
  '88.00',
  '599.00',
];

final List<String> productRatings = [
  '4.9',
  '4.6',
  '4.6',
  '4.9',
  '4.6',
  '4.6',
];
