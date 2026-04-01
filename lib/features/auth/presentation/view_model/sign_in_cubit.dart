import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/auth/data/model/sign_in_request_model.dart';
import 'package:marketi/features/auth/data/model/sign_in_response_model.dart';
import 'package:marketi/features/auth/data/repo/sign_in_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.repo) : super(SignInInitial());

  final SignInRepo repo;

  Future<void> signIn({required SignInRequestModel signInRequestModel}) async {
    emit(SignInLoading());
    final response = await repo.signIn(signInRequestModel: signInRequestModel);

    response.fold(
      (errorMessage) => emit(SignInFailure(errorMessage: errorMessage)),
      (signInResponseModel) =>
          emit(SignInSuccess(signInResponseModel: signInResponseModel)),
    );
  }
}
