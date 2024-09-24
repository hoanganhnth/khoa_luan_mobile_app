part of 'all_job_cubit.dart';

class AllJobState extends Equatable {
  final LoadingStatus? status;
  final dynamic error;
  final List<JobModel>? listJobs;

  const AllJobState({this.status, this.error, this.listJobs});

  factory AllJobState.initial() {
    return const AllJobState(status: LoadingStatus.initial);
  }

  AllJobState copyWith(
      {LoadingStatus? status, dynamic error, List<JobModel>? listJobs}) {
    return AllJobState(
        status: status ?? LoadingStatus.initial,
        error: error,
        listJobs: listJobs ?? this.listJobs);
  }

  @override
  List<Object?> get props => [status, error, listJobs];
}
