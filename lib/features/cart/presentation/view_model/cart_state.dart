part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

// Get All Products in the Cart.
final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  CartSuccess({required this.cartModel});

  final CartModel cartModel;
}

final class CartFailure extends CartState {
  CartFailure({required this.errorMessage});

  final String errorMessage;
}

// Add a Product to Cart.
final class AddToCartLoading extends CartState {}

final class AddToCartSuccess extends CartState {
  AddToCartSuccess(this.message);

  final String message;
}

final class AddToCartFailure extends CartState {
  AddToCartFailure(this.errorMessage);

  final String errorMessage;
}

// Delete a Product From Cart.
final class DeleteFromCartLoading extends CartState {}

final class DeleteFromCartSuccess extends CartState {
  DeleteFromCartSuccess(this.message);

  final String message;
}

final class DeleteFromCartFailure extends CartState {
  DeleteFromCartFailure(this.errorMessage);

  final String errorMessage;
}
