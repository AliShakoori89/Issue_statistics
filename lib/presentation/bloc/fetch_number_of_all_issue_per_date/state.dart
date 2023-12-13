import 'package:equatable/equatable.dart';

enum FetchNumberOfAllIssuePerDateStatus { initial, success, error, loading }

extension FetchNumberOfAllIssuePerDateStatusStatusX on FetchNumberOfAllIssuePerDateStatus {
  bool get isInitial => this == FetchNumberOfAllIssuePerDateStatus.initial;
  bool get isSuccess => this == FetchNumberOfAllIssuePerDateStatus.success;
  bool get isError => this == FetchNumberOfAllIssuePerDateStatus.error;
  bool get isLoading => this == FetchNumberOfAllIssuePerDateStatus.loading;
}

class FetchNumberOfAllIssuePerDateState extends Equatable {
  const FetchNumberOfAllIssuePerDateState({
  this.status = FetchNumberOfAllIssuePerDateStatus.initial,
  int? numberOfAllIssuePerDate,
  })
      : numberOfAllIssuePerDate = numberOfAllIssuePerDate ?? 0;

  final FetchNumberOfAllIssuePerDateStatus status;
  final int numberOfAllIssuePerDate;

  @override
  // TODO: implement props
  List<Object> get props => [status, numberOfAllIssuePerDate];

  FetchNumberOfAllIssuePerDateState copyWith({
    FetchNumberOfAllIssuePerDateStatus? status,
    int? numberOfAllIssuePerDate
  }) {
    return FetchNumberOfAllIssuePerDateState(
        status: status ?? this.status,
      numberOfAllIssuePerDate: numberOfAllIssuePerDate ?? numberOfAllIssuePerDate,
    );
  }

}