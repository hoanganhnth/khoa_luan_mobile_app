part of 'upload_cubit.dart';

class UploadState extends Equatable {
  final LoadingStatus? status;
  final dynamic error;
  final String? url;

  const UploadState({this.status, this.error, this.url});

  factory UploadState.initial() {
    return const UploadState(status: LoadingStatus.initial);
  }

  UploadState copyWith({LoadingStatus? status, dynamic error, String? url}) {
    return UploadState(
      status: status ?? LoadingStatus.initial,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, error, url];
}
