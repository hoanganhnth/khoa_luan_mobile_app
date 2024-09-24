import 'package:app_flutter/features/authentication/data/datasource/authen_local_datasourse.dart';
import 'package:app_flutter/features/authentication/data/datasource/authen_remote_datasourse.dart';
import 'package:app_flutter/features/profile/bloc/cubit/user_cubit.dart';
import 'package:app_flutter/features/profile/data/model/profile_model.dart';
import 'package:app_flutter/features/profile/data/model/user_model.dart';
import 'package:app_flutter/share/utils/cubit/loading_status.dart';
import 'package:app_flutter/share/utils/exceptions/base_error.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthenRemoteDataSource _authenRemoteDataSourse;
  final AuthenLocalDatasourse _authenLocalDatasourse;
  SignInCubit(this._authenRemoteDataSourse, this._authenLocalDatasourse)
      : super(SignInState.initial());

  Future login(String email, String password, bool savePassword) async {
    try {
      emit(state.copyWith(status: LoadingStatus.loading));
      final result = await _authenRemoteDataSourse.login(email, password);
      if (result["status"] == 1) {
        emit(
          state.copyWith(
            status: LoadingStatus.success,
          ),
        );
        Modular.get<UserCubit>().setProfile(result["data"]["user"]);
        _authenLocalDatasourse
            .setAccessToken(result["data"]?["accessToken"] ?? "");
        if (savePassword) {
          _authenLocalDatasourse.savePassword(email, password);
        } else {
          _authenLocalDatasourse.notSavePassword();
        }
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

  bool checkSavePassword() {
    return _authenLocalDatasourse.checkSavePassword();
  }

  List<String> getSavePassword() {
    return _authenLocalDatasourse.getSavePassword();
  }

  Future<void> savePassword(String email, String password) async {
    await _authenLocalDatasourse.savePassword(email, password);
  }
}
