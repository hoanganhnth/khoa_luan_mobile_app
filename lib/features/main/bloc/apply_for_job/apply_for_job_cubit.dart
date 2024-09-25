import 'package:app_flutter/features/main/data/datasource/job_remote_datasource.dart';
import 'package:app_flutter/share/utils/cubit/loading_status.dart';
import 'package:app_flutter/share/utils/exceptions/base_error.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'apply_for_job_state.dart';

class ApplyForJobCubit extends Cubit<ApplyForJobState> {
  final JobRemoteDatasource _jobRemoteDatasource;

  ApplyForJobCubit(this._jobRemoteDatasource)
      : super(ApplyForJobState.initial());
  Future applyForJob(int jobId, String coverLetter, String resumeUrl,
      String emailCandidate) async {
    try {
      emit(state.copyWith(status: LoadingStatus.loading));
      final result = await _jobRemoteDatasource.applyForJob(
          jobId, coverLetter, resumeUrl, emailCandidate);
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
