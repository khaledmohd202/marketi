part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {
  SearchInitial() : timestamp = DateTime.now();

  final DateTime timestamp;
}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  SearchSuccess({required this.products});

  final SearchResponseModel products;
}

final class SearchFailure extends SearchState {
  SearchFailure({required this.errorMessage});

  final String errorMessage;
}

final class SearchEmpty extends SearchState {}
