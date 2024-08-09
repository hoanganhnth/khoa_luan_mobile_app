import 'package:app_flutter/features/authentication/data/datasource/authen_local_datasourse.dart';
import 'package:app_flutter/features/authentication/data/datasource/authen_remote_datasourse.dart';
import 'package:app_flutter/features/authentication/data/model/profile_model.dart';
import 'package:app_flutter/features/authentication/data/model/user_model.dart';
import 'package:app_flutter/share/utils/cubit/loading_status.dart';
import 'package:app_flutter/share/utils/exceptions/base_error.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final AuthenRemoteDataSourse _authenRemoteDataSourse;
  final AuthenLocalDatasourse _authenLocalDatasourse;
  UserCubit(this._authenRemoteDataSourse, this._authenLocalDatasourse)
      : super(UserState.initial());

  Future login(String email, String password) async {
    try {
      emit(state.copyWith(status: LoadingStatus.loading));
      final result = await _authenRemoteDataSourse.login(email, password);
      if (result["status"] == 1) {
        emit(
          state.copyWith(
              status: LoadingStatus.success,
              userModel: UserModel.fromJson(result["data"]["user"])),
        );
        _authenLocalDatasourse
            .setAccessToken(result["data"]?["accessToken"] ?? "");
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

  Future getProfile() async {
    try {
      emit(state.copyWith(status: LoadingStatus.loading));
      final result = await _authenRemoteDataSourse.getProfile();
      if (result["status"] == 1) {
        emit(
          state.copyWith(
            profileModel: result["data"],
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

  Future updateProfile(String? userName, String? email, String? address,
      String? phone, String? profileUrl) async {
    try {
      emit(state.copyWith(status: LoadingStatus.loading));
      final result = await _authenRemoteDataSourse.updateProfile(
          userName, email, address, phone, profileUrl);
      if (result["status"] == 1) {
        emit(
          state.copyWith(
            profileModel: result["data"],
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
