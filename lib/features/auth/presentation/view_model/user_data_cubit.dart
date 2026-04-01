import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/auth/data/model/user_model.dart';
import 'package:marketi/features/auth/data/repo/user_repo.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit(this.repo) : super(UserDataInitial());
  final UserRepo repo;

  Future<void> getUserData() async {
    emit(UserDataLoading());
    final response = await repo.getUserData();

    response.fold(
      (errorMessage) => emit(UserDataFailure(errorMessage: errorMessage)),
      (userModel) => emit(UserDataSuccess(userModel: userModel)),
    );
  }
}
