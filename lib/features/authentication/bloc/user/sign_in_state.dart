part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  final LoadingStatus? status;
  final dynamic error;
  final UserModel? userModel;
  final ProfileModel? profileModel;

  const SignInState({this.status, this.error, this.userModel, this.profileModel});

  factory SignInState.initial() {
    return const SignInState(status: LoadingStatus.initial);
  }

  SignInState copyWith(
      {LoadingStatus? status,
      dynamic error,
      UserModel? userModel,
      ProfileModel? profileModel}) {
    return SignInState(
        status: status ?? LoadingStatus.initial,
        error: error,
        userModel: userModel ?? this.userModel,
        profileModel: profileModel ?? this.profileModel);
  }

  @override
  List<Object?> get props => [status, error, userModel, profileModel];
}
