import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/data/models/categories/category_model.dart';
import 'package:marketi/features/home/data/repo/categories_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.repo) : super(CategoriesInitial());

  final CategoriesRepo repo;

  Future<void> getAllCategories() async {
    emit(CategoriesLoading());

    final result = await repo.getAllCategories();

    result.fold(
      (error) {
        emit(CategoriesFailure(error));
      },
      (data) {
        emit(CategoriesSuccess(data.categories));
      },
    );
  }
}
