part of 'signup_cubit.dart';

class SignupState extends Equatable {
  final LoadingStatus? status;
  final dynamic error;

  const SignupState({this.status, this.error});

  factory SignupState.initial() {
    return const SignupState(status: LoadingStatus.initial);
  }

  SignupState copyWith(
      {LoadingStatus? status,
      dynamic error,
     }) {
    return SignupState(
        status: status ?? LoadingStatus.initial,
        error: error,
       );
  }

  @override
  List<Object?> get props => [status, error];
}
