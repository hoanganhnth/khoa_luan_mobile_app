import 'package:app_flutter/features/profile/data/datasource/user_remote_datasource.dart';
import 'package:app_flutter/features/profile/data/model/resume_model.dart';
import 'package:app_flutter/share/utils/constants/app_constants.dart';
import 'package:app_flutter/share/utils/cubit/loading_status.dart';
import 'package:app_flutter/share/utils/exceptions/base_error.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'resume_state.dart';

class ResumeCubit extends Cubit<ResumeState> {
  final UserRemoteDataSource _userRemoteDataSource;

  ResumeCubit(this._userRemoteDataSource) : super(ResumeState.initial());
  Future getResume() async {
    try {
      emit(state.copyWith(status: LoadingStatus.loading));
      final result = await _userRemoteDataSource.getResume();
      List<ResumeModel> resumes = [];
      resumes = (result[AppConstants.data] as List)
          .map((e) => ResumeModel.fromJson(e))
          .toList();

      emit(
        state.copyWith(status: LoadingStatus.success, resumeModel: resumes));
    } catch (e) {
      emit(state.copyWith(
          status: LoadingStatus.failure,
          error: BaseError.fromObjectErr(e).errMsgToastToUser));
      return null;
    }
  }

  Future createResume(String resumeName, String resumeUrl) async {
    try {
      emit(state.copyWith(status: LoadingStatus.loadingMore));
      final result =
          await _userRemoteDataSource.createResume(resumeName, resumeUrl);

      List<ResumeModel> resumes = List.from(state.resumes ?? []);
      resumes.add(ResumeModel.fromJson(result[AppConstants.data]));
      emit(state.copyWith(
          status: LoadingStatus.updateSuccess, resumeModel: resumes));
    } catch (e) {
      emit(state.copyWith(
          status: LoadingStatus.updateFailed,
          error: BaseError.fromObjectErr(e).errMsgToastToUser));
      return null;
    }
  }

  Future updateResume(String resumeName, String resumeUrl, int resumeId) async {
    try {
      emit(state.copyWith(status: LoadingStatus.loadingMore));
      final result = await _userRemoteDataSource.updateResume(
          resumeName, resumeUrl, resumeId);
      if (result[AppConstants.status] == 1) {
        final updatedResume = result[AppConstants.data];

        final updatedResumeList = state.resumes?.map((resume) {
          return resume.id == resumeId
              ? ResumeModel.fromJson(updatedResume)
              : resume;
        }).toList();
        emit(state.copyWith(
            status: LoadingStatus.updateSuccess,
            resumeModel: updatedResumeList));
      } else {
        emit(state.copyWith(
            status: LoadingStatus.failure,
            error: result[AppConstants.message]));
      }
    } catch (e) {
      emit(state.copyWith(
          status: LoadingStatus.updateFailed,
          error: BaseError.fromObjectErr(e).errMsgToastToUser));
      return null;
    }
  }

  Future deleteResume(int resumeId) async {
    try {
      emit(state.copyWith(status: LoadingStatus.loadingMore));
      final result = await _userRemoteDataSource.deleteResume(resumeId);
      if (result[AppConstants.status] == 1) {
        emit(state.copyWith(
            status: LoadingStatus.updateSuccess,
            resumeModel: state.resumes
              ?..removeWhere((resume) => resume.id == resumeId)));
      } else {
        emit(state.copyWith(
            status: LoadingStatus.failure,
            error: result[AppConstants.message]));
      }
    } catch (e) {
      emit(state.copyWith(
          status: LoadingStatus.updateFailed,
          error: BaseError.fromObjectErr(e).errMsgToastToUser));
      return null;
    }
  }
}
