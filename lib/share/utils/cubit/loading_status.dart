import 'package:app_flutter/share/utils/exceptions/base_error.dart';
import 'package:equatable/equatable.dart';

enum LoadingStatus {
  initial,
  loading,
  updating,
  updateSuccess,
  updateFailed,
  success,
  failure,
  loadingMore,
  loadMoreSuccess,
  loadMoreFailure,
  refreshing,
  exist,
}

enum LvRequestDataStatus { notYetCallRequest, success, error, loading }

class LvResult<T> extends Equatable {
  final LvRequestDataStatus status;
  final T? data;
  final BaseError? error;
  const LvResult(this.status, [this.data, this.error]);
  const LvResult.success(this.data, [this.error])
      : status = LvRequestDataStatus.success;
  const LvResult.error(this.error, [this.data])
      : status = LvRequestDataStatus.error;
  const LvResult.loading([this.data, this.error])
      : status = LvRequestDataStatus.loading;
  const LvResult.notYetCallRequest([this.data, this.error])
      : status = LvRequestDataStatus.notYetCallRequest;
  @override
  List<Object?> get props => [status, data, error];
  bool get isNotYetLoad => status == LvRequestDataStatus.notYetCallRequest;
  bool get isLoading => status == LvRequestDataStatus.loading;
  bool get isSuccess => status == LvRequestDataStatus.success;
  bool get isError => status == LvRequestDataStatus.error;
}