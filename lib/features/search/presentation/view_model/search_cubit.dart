import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/search/data/models/search_request_model.dart';
import 'package:marketi/features/search/data/models/search_response_model.dart';
import 'package:marketi/features/search/data/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.repo) : super(SearchInitial());

  final SearchRepo repo;

  Timer? _debounce;

  Future<void> search({required String searchQuery}) async {
    _debounce?.cancel();


    if (searchQuery.trim().isEmpty) {
      emit(SearchEmpty());
      return;
    }

    // emit(SearchLoading());
//
    // final result = await repo.search(
    //   searchRequest: SearchRequestModel(searchQuery: searchQuery),
    // );
//
    // result.fold(
    //   (errorMessage) => emit(SearchFailure(errorMessage: errorMessage)),
    //   (products) {
    //     if (products.productsList.isEmpty) {
    //       emit(SearchEmpty());
    //     } else {
    //       emit(SearchSuccess(products: products));
    //     }
    //   },
    // );

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      emit(SearchLoading());

      final result = await repo.search(
        searchRequest: SearchRequestModel(searchQuery: searchQuery),
      );

      result.fold(
        (errorMessage) => emit(SearchFailure(errorMessage:  errorMessage)),
        (data) {
          if (data.productsList.isEmpty) {
            emit(SearchEmpty());
          } else {
            emit(SearchSuccess(products: data));
          }
        },
      );
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
