import 'package:app_flutter/features/main/data/datasource/job_remote_datasource.dart';
import 'package:app_flutter/features/main/data/model/job_model.dart';
import 'package:app_flutter/share/utils/cubit/loading_status.dart';
import 'package:app_flutter/share/utils/exceptions/base_error.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'all_job_state.dart';

class AllJobCubit extends Cubit<AllJobState> {
  final JobRemoteDatasource _jobRemoteDatasource;
  AllJobCubit(this._jobRemoteDatasource) : super(AllJobState.initial());
  int page = 0;
  int size = 20;
  Future getJob({bool loadingMore = false}) async {
    try {
      if (loadingMore) {
        emit(state.copyWith(status: LoadingStatus.loadingMore));
      } else {
        page = 1;
        emit(state.copyWith(status: LoadingStatus.loading));
      }

      final listJobs = await _jobRemoteDatasource.getJob(page, size);
      // final listJobs =
      //     (response as List).map((e) => JobModel.fromJson(e)).toList();
      List<JobModel> updatedList = [];
      if (loadingMore) {
        updatedList = List.from(state.listJobs ?? []);
        updatedList.addAll(listJobs);
      } else {
        updatedList = listJobs;
      }

      if (listJobs.isNotEmpty) {
        page++;
      }
      emit(state.copyWith(
        status: LoadingStatus.success,
        listJobs: updatedList,
      ));
    } catch (e) {
      emit(state.copyWith(
          status: LoadingStatus.failure,
          error: BaseError.fromObjectErr(e).errMsgToastToUser));
      return null;
    }
  }
}
