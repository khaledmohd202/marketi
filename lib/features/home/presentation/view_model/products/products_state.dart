part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  ProductsSuccess(this.products);

  final List<ProductModel> products;
}

final class ProductsFailure extends ProductsState {
  ProductsFailure(this.errorMessage);

  final String errorMessage;
}
