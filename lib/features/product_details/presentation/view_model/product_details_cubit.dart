import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/data/models/products/product_model.dart';
import 'package:marketi/features/product_details/data/repo/product_details_repo.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.repo) : super(ProductDetailsInitial());

  final ProductDetailsRepo repo;

  Future<void> getProductDetails({required int productId}) async {
    emit(ProductDetailsLoading());

    final result = await repo.getProductDetails(
      productId: productId,
    );

    result.fold(
      (errorMessage) {
        emit(ProductDetailsFailure(errorMessage));
      },
      (product) {
        emit(ProductDetailsSuccess(product));
      },
    );
  }
}
