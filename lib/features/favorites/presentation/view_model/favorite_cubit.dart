import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/favorites/data/models/favorite_model.dart';
import 'package:marketi/features/favorites/data/repo/favorite_repo.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.repo) : super(FavoriteInitial());

  final FavoriteRepo repo;

  FavoriteModel? favoriteModel;

  // Get Favorite Products.
  Future<void> getFavorites() async {
    emit(FavoriteLoading());

    final result = await repo.getFavorites();

    result.fold(
      (errorMessage) {
        emit(FavoriteFailure(errorMessage));
      },
      (data) {
        favoriteModel = data;
        emit(FavoriteSuccess(favoriteModel: data));
      },
    );
  }

  // Add Favorite Product.
  Future<void> addToFavorites({required String productId}) async {
    emit(AddToFavoriteLoading());

    final result = await repo.addToFavorites(productId: productId);

    result.fold(
      (errorMessage) => emit(AddToFavoriteFailure(errorMessage)),
      (message) async {
        emit(AddToFavoriteSuccess(message));
        await getFavorites();
      },
    );
  }

  // Delete Favorite Product.
  Future<void> deleteFromFavorites({
    required String productId,
  }) async {
    emit(DeleteFromFavoritesLoading());

    final result = await repo.deleteFromFavorites(productId: productId);

    result.fold(
      (errorMessage) => emit(DeleteFromFavoritesFailure(errorMessage)),
      (message) async {
        emit(DeleteFromFavoritesSuccess(message));
        await getFavorites();
      },
    );
  }

  // to check first about the product.
  bool isInFavorites({required int productId}) {
    return favoriteModel?.favoritesList.any((p) => p.id == productId) ?? false;
  }
}
