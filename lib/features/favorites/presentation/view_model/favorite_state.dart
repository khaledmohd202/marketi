part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

// Get Favorites Product.
final class FavoriteLoading extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {
  FavoriteSuccess({required this.favoriteModel});

  final FavoriteModel favoriteModel;
}

final class FavoriteFailure extends FavoriteState {
  FavoriteFailure(this.errorMessage);

  final String errorMessage;
}

// Add To Favorites View.
final class AddToFavoriteLoading extends FavoriteState {}

final class AddToFavoriteSuccess extends FavoriteState {
  AddToFavoriteSuccess(this.message);

  final String message;
}

final class AddToFavoriteFailure extends FavoriteState {
  AddToFavoriteFailure(this.errorMessage);

  final String errorMessage;
}

// Delete From Favorites View.
final class DeleteFromFavoritesLoading extends FavoriteState {}

final class DeleteFromFavoritesSuccess extends FavoriteState {
  DeleteFromFavoritesSuccess(this.message);

  final String message;
}

final class DeleteFromFavoritesFailure extends FavoriteState {
  DeleteFromFavoritesFailure(this.errorMessage);

  final String errorMessage;
}
