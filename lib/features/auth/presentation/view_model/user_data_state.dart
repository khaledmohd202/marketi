part of 'user_data_cubit.dart';

@immutable
sealed class UserDataState {}

final class UserDataInitial extends UserDataState {}

final class UserDataLoading extends UserDataState {}

final class UserDataSuccess extends UserDataState {
  UserDataSuccess({required this.userModel});

  final UserModel userModel;
}

final class UserDataFailure extends UserDataState {
  UserDataFailure({required this.errorMessage});

  final String errorMessage;
}
