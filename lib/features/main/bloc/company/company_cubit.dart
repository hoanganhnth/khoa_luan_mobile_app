import 'package:app_flutter/features/main/data/datasource/job_remote_datasource.dart';
import 'package:app_flutter/features/main/data/model/company_model.dart';
import 'package:app_flutter/share/utils/cubit/loading_status.dart';
import 'package:app_flutter/share/utils/dummy/dummy_data.dart';
import 'package:app_flutter/share/utils/exceptions/base_error.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  final JobRemoteDatasource _jobRemoteDatasource;

  CompanyCubit(this._jobRemoteDatasource) : super(CompanyState.initial());

  Future getCompany(int companyId) async {
    try {
      emit(state.copyWith(status: LoadingStatus.loading));
      final response = await _jobRemoteDatasource.getCompany(companyId);
      emit(state.copyWith(
          status: LoadingStatus.success,
          company: CompanyModel.fromJson(
              DummyData.jsonCompany.first) //JobModel.fromJson(response),
          ));
    } catch (e) {
      emit(state.copyWith(
          status: LoadingStatus.failure,
          error: BaseError.fromObjectErr(e).errMsgToastToUser));
      return null;
    }
  }
}
