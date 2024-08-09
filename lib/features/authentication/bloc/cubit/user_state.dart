part of 'user_cubit.dart';

class UserState extends Equatable {
  final LoadingStatus? status;
  final dynamic error;
  final UserModel? userModel;
  final ProfileModel? profileModel;

  const UserState({this.status, this.error, this.userModel, this.profileModel});

  factory UserState.initial() {
    return const UserState(status: LoadingStatus.initial);
  }

  UserState copyWith(
      {LoadingStatus? status,
      dynamic error,
      UserModel? userModel,
      ProfileModel? profileModel}) {
    return UserState(
        status: status ?? LoadingStatus.initial,
        error: error,
        userModel: userModel ?? this.userModel,
        profileModel: profileModel ?? this.profileModel);
  }

  @override
  List<Object?> get props => [status, error, userModel, profileModel];
}
