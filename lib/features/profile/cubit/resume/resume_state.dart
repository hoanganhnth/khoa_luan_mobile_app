part of 'resume_cubit.dart';

class ResumeState extends Equatable {
  final LoadingStatus? status;
  final dynamic error;
  final List<ResumeModel>? resumes;

  const ResumeState({
    this.status,
    this.error,
    this.resumes,
  });

  factory ResumeState.initial() {
    return const ResumeState(status: LoadingStatus.initial);
  }

  ResumeState copyWith({
    LoadingStatus? status,
    dynamic error,
    List<ResumeModel>? resumeModel,
  }) {
    return ResumeState(
      status: status ?? LoadingStatus.initial,
      error: error,
      resumes: resumeModel ?? this.resumes,
    );
  }

  @override
  List<Object?> get props => [status, error, resumes];
}
