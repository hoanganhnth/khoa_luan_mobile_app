import 'package:app_flutter/features/authentication/data/datasource/authen_remote_datasourse.dart';
import 'package:app_flutter/share/utils/cubit/loading_status.dart';
import 'package:app_flutter/share/utils/exceptions/base_error.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthenRemoteDataSource _authenRemoteDataSourse;

  SignupCubit(
    this._authenRemoteDataSourse,
  ) : super(SignupState.initial());

  Future register(
      String email, String password, String phone, String userName) async {
    try {
      emit(state.copyWith(status: LoadingStatus.loading));
      final result = await _authenRemoteDataSourse.register(
          email, password, phone, userName);
      if (result["status"] == 1) {
        emit(
          state.copyWith(
            status: LoadingStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: LoadingStatus.failure,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(
          status: LoadingStatus.failure,
          error: BaseError.fromObjectErr(e).errMsgToastToUser));
      return null;
    }
  }
}
