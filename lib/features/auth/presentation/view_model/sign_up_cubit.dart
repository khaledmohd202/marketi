import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/auth/data/model/sign_up_request_model.dart';
import 'package:marketi/features/auth/data/model/sign_up_response_model.dart';
import 'package:marketi/features/auth/data/repo/sign_up_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.repo) : super(SignUpInitial());

  final SignUpRepo repo;

  Future<void> signUp({required SignUpRequestModel signUpRequestModel}) async {
    emit(SignUpLoading());

    final response = await repo.signUp(
      signUpRequestModel: signUpRequestModel,
    );

    response.fold(
      (errorMessage) => emit(
        SignUpFailure(
          errorMessage: errorMessage,
        ),
      ),
      (signUpResponseModel) => emit(
        SignUpSuccess(
          signUpResponseModel: signUpResponseModel,
        ),
      ),
    );
  }
}
