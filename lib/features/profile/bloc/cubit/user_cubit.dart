import 'package:app_flutter/features/profile/data/datasource/user_remote_datasource.dart';
import 'package:app_flutter/features/profile/data/model/profile_model.dart';
import 'package:app_flutter/features/profile/data/model/user_model.dart';
import 'package:app_flutter/share/utils/cubit/loading_status.dart';
import 'package:app_flutter/share/utils/exceptions/base_error.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRemoteDataSource _userRemoteDataSource;
  UserCubit(this._userRemoteDataSource) : super(UserState.initial());

  Future setProfile(Map<String, dynamic> jsonData) async {
    try {
      emit(state.copyWith(
          status: LoadingStatus.updateSuccess,
          userModel: UserModel.fromJson(jsonData)));
    } catch (e) {
      emit(state.copyWith(
          status: LoadingStatus.updateFailed,
          error: BaseError.fromObjectErr(e).errMsgToastToUser));
      return null;
    }
  }

  Future getProfile({Function()? onFinishGetUerInfo}) async {
    try {
      emit(state.copyWith(status: LoadingStatus.loading));
      final result = await _userRemoteDataSource.getProfile();
      if (result["status"] == 1) {
        emit(
          state.copyWith(
            userModel: UserModel.fromJson(result["data"]),
            status: LoadingStatus.success,
          ),
        );
        if (onFinishGetUerInfo != null) {
          onFinishGetUerInfo();
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

  Future updateProfile(String? userName, String? email, String? address,
      String? phone, String? profileUrl) async {
    try {
      emit(state.copyWith(status: LoadingStatus.loading));
      final result = await _userRemoteDataSource.updateProfile(
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
