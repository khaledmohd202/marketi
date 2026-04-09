import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/data/models/brands/brand_model.dart';
import 'package:marketi/features/home/data/repo/brands_repo.dart';

part 'brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  BrandsCubit(this.repo) : super(BrandsInitial());

  final BrandsRepo repo;

  Future<void> getAllBrands() async {
    emit(BrandsLoading());

    final result = await repo.getAllBrands();

    result.fold(
      (error) {
        emit(BrandsFailure(error));
      },
      (data) {
        emit(BrandsSuccess(data.brands));
      },
    );
  }
}
