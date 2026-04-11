part of 'product_details_cubit.dart';

abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsSuccess extends ProductDetailsState {
  ProductDetailsSuccess(this.product);
  final ProductModel product;
}

class ProductDetailsFailure extends ProductDetailsState {
  ProductDetailsFailure(this.errorMessage);
  final String errorMessage;
}
