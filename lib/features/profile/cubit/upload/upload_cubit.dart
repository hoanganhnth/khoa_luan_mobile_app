import 'dart:io';

import 'package:app_flutter/features/profile/data/datasource/user_remote_datasource.dart';
import 'package:app_flutter/share/utils/constants/app_constants.dart';
import 'package:app_flutter/share/utils/cubit/loading_status.dart';
import 'package:app_flutter/share/utils/exceptions/base_error.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  final UserRemoteDataSource _userRemoteDataSource;
  UploadCubit(this._userRemoteDataSource) : super(UploadState.initial());

  Future uploadFile(File file) async {
    try {
      emit(state.copyWith(status: LoadingStatus.loading));
      final result = await _userRemoteDataSource.uploadFile(file);
      if (result[AppConstants.status] == 1) {
        emit(
            state.copyWith(status: LoadingStatus.success, url: result["data"]));
      } else {
        emit(state.copyWith(
            status: LoadingStatus.failure,
            error: result[AppConstants.message]));
      }
    } catch (e) {
      emit(state.copyWith(
          status: LoadingStatus.failure,
          error: BaseError.fromObjectErr(e).errMsgToastToUser));
      return null;
    }
  }
}
