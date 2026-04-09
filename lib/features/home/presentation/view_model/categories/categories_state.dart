part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesSuccess extends CategoriesState {
  CategoriesSuccess(this.categories);

  final List<CategoryModel> categories;
}

final class CategoriesFailure extends CategoriesState {
  CategoriesFailure(this.errorMessage);

  final String errorMessage;
}
