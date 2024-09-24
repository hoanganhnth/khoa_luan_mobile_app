part of 'detail_job_cubit.dart';


class DetailJobState extends Equatable {
  final LoadingStatus? status;
  final dynamic error;
  final JobModel? job;

  const DetailJobState({this.status, this.error, this.job});

  factory DetailJobState.initial() {
    return const DetailJobState(status: LoadingStatus.initial);
  }

  DetailJobState copyWith(
      {LoadingStatus? status, dynamic error, JobModel? job}) {
    return DetailJobState(
        status: status ?? LoadingStatus.initial,
        error: error,
        job: job ?? this.job);
  }

  @override
  List<Object?> get props => [status, error, job];
}
