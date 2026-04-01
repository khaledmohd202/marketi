part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {
  SignInSuccess({required this.signInResponseModel});

  final SignInResponseModel signInResponseModel;
}

final class SignInFailure extends SignInState {
  SignInFailure({required this.errorMessage});

  final String errorMessage;
}
