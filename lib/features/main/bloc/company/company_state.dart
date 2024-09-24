part of 'company_cubit.dart';

class CompanyState extends Equatable {
  final LoadingStatus? status;
  final dynamic error;
  final CompanyModel? company;

  const CompanyState({this.status, this.error, this.company});

  factory CompanyState.initial() {
    return const CompanyState(status: LoadingStatus.initial);
  }

  CompanyState copyWith(
      {LoadingStatus? status, dynamic error, CompanyModel? company}) {
    return CompanyState(
        status: status ?? LoadingStatus.initial,
        error: error,
        company: company ?? this.company);
  }

  @override
  List<Object?> get props => [status, error, company];
}
