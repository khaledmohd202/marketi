part of 'brands_cubit.dart';

@immutable
sealed class BrandsState {}

final class BrandsInitial extends BrandsState {}

final class BrandsLoading extends BrandsState {}

final class BrandsSuccess extends BrandsState {
  BrandsSuccess(this.brands);

  final List<BrandModel> brands;
}

final class BrandsFailure extends BrandsState {
  BrandsFailure(this.errorMessage);

  final String errorMessage;
}
