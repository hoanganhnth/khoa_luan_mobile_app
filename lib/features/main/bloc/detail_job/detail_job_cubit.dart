import 'package:app_flutter/features/main/data/datasource/job_remote_datasource.dart';
import 'package:app_flutter/features/main/data/model/job_model.dart';
import 'package:app_flutter/share/utils/cubit/loading_status.dart';
import 'package:app_flutter/share/utils/dummy/dummy_data.dart';
import 'package:app_flutter/share/utils/exceptions/base_error.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_job_state.dart';

class DetailJobCubit extends Cubit<DetailJobState> {
  final JobRemoteDatasource _jobRemoteDatasource;

  DetailJobCubit(this._jobRemoteDatasource) : super(DetailJobState.initial());

  Future getJob(int idJob) async {
    try {
      emit(state.copyWith(status: LoadingStatus.loading));
      final response = await _jobRemoteDatasource.getDetailJob(idJob);
      emit(state.copyWith(
        status: LoadingStatus.success,
        job: DummyData.listJobSuggest.first //JobModel.fromJson(response),
      ));
    } catch (e) {
      emit(state.copyWith(
          status: LoadingStatus.failure,
          error: BaseError.fromObjectErr(e).errMsgToastToUser));
      return null;
    }
  }
}
