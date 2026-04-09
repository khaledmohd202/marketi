import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/data/models/products/product_model.dart';
import 'package:marketi/features/home/data/repo/products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.repo) : super(ProductsInitial());

  final ProductsRepo repo;

  final List<ProductModel> products = [];
  int skip = 0;
  final int limit = 10;

  bool hasMore = true;
  bool isLoading = false;

  Future<void> getAllProducts({int limit = 10}) async {
    if (isLoading || !hasMore) return;

    isLoading = true;

    if (products.isEmpty) {
      emit(ProductsLoading());
    }

    final result = await repo.getAllProducts(skip: skip, limit: limit);

    result.fold(
      (error) {
        emit(ProductsFailure(error));
      },
      (data) {
        skip += limit;

        products.addAll(data.products);

        hasMore = products.length < data.total;

        emit(ProductsSuccess(List.from(products)));
      },
    );
    isLoading = false;
  }
}
