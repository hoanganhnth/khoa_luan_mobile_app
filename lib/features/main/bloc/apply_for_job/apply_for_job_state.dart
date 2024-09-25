part of 'apply_for_job_cubit.dart';

class ApplyForJobState extends Equatable {
  final LoadingStatus? status;
  final dynamic error;

  const ApplyForJobState({this.status, this.error});

  factory ApplyForJobState.initial() {
    return const ApplyForJobState(status: LoadingStatus.initial);
  }

  ApplyForJobState copyWith({LoadingStatus? status, dynamic error}) {
    return ApplyForJobState(
      status: status ?? LoadingStatus.initial,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, error];
}
