import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/cart/data/models/cart_model.dart';
import 'package:marketi/features/cart/data/repo/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.repo) : super(CartInitial());

  final CartRepo repo;

  CartModel? cartModel;

  String? loadingProductId;

  // Get all products in Cart.
  Future<void> getCart() async {
    emit(CartLoading());

    final result = await repo.getCart();

    result.fold(
      (errorMessage) => emit(
        CartFailure(errorMessage: errorMessage),
      ),
      (data) {
        cartModel = data;
        emit(
          CartSuccess(cartModel: data),
        );
      },
    );
  }

  // Add Product To Cart
  Future<void> addToCart({required String productId}) async {
    loadingProductId = productId;
    emit(AddToCartLoading());

    final result = await repo.addToCart(productId: productId);

    var isSuccess = false;

    result.fold(
      (errorMessage) {
        loadingProductId = null;
        emit(AddToCartFailure(errorMessage));
      },
      (message) {
        loadingProductId = null;
        emit(AddToCartSuccess(message));

        isSuccess = true;
      },
    );

    if (isSuccess) {
      await getCart();
    }
  }

  // Delete Product From Cart
  Future<void> deleteFromCart({required String productId}) async {
    emit(DeleteFromCartLoading());

    final result = await repo.deleteFromCart(productId: productId);

    result.fold(
      (errorMessage) => emit(
        DeleteFromCartFailure(errorMessage),
      ),
      (message) async {
        emit(
          DeleteFromCartSuccess(message),
        );
        await getCart();
      },
    );
  }

  // If You need to check about any product in cart.
  bool isInCart({required int productId}) {
    return cartModel?.list.any((p) => p.id == productId) ?? false;
  }
}
