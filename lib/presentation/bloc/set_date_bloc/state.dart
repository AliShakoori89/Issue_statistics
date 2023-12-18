import 'package:equatable/equatable.dart';
import 'package:issue_statistics/data/model/all_issues_per_day_model.dart';
import 'package:issue_statistics/data/model/issue_model.dart';

enum SetDateStatus { initial, success, error, loading }

extension SetDateStatusX on SetDateStatus {
  bool get isInitial => this == SetDateStatus.initial;
  bool get isSuccess => this == SetDateStatus.success;
  bool get isError => this == SetDateStatus.error;
  bool get isLoading => this == SetDateStatus.loading;
}

class SetDateState extends Equatable {

  const SetDateState({
    required this.status, required this.date, required this.month,
    required this.year, required this.issueDetails,
    required this.selectDate, required this.allIssuePerDate,
    required this.calculatePendarNumberOfIssue, required this.allIssueBetweenDays
  });

  static SetDateState initial() => const SetDateState(
    status: SetDateStatus.initial,
    date: "",
    month: "",
    year: "",
    issueDetails: [],
    selectDate: "",
    allIssuePerDate: null,
    calculatePendarNumberOfIssue: "",
    allIssueBetweenDays: "",
  );

  final SetDateStatus status;
  final String date;
  final String month;
  final String year;
  final List<IssueModel> issueDetails;
  final String selectDate;
  final AllIssuePerDayModel? allIssuePerDate;
  final String calculatePendarNumberOfIssue;
  final String allIssueBetweenDays;

  @override
  // TODO: implement props
  List<Object?> get props => [status, date, month, year,
    issueDetails, selectDate, allIssuePerDate,
    calculatePendarNumberOfIssue, allIssueBetweenDays];

  SetDateState copyWith({
    SetDateStatus? status,
    String? date,
    String? month,
    String? year,
    List<IssueModel>? issueDetails,
    String? selectDate,
    AllIssuePerDayModel? allIssuePerDate,
    String? calculatePendarNumberOfIssue,
    String? allIssueBetweenDays,
  }) {
    return SetDateState(
        status: status ?? this.status,
        date: date ?? this.date,
        month: month ?? this.month,
        year: year ?? this.year,
        issueDetails: issueDetails ?? this.issueDetails,
        selectDate: selectDate ?? this.selectDate,
        allIssuePerDate: allIssuePerDate ?? this.allIssuePerDate,
        calculatePendarNumberOfIssue: calculatePendarNumberOfIssue ?? this.calculatePendarNumberOfIssue,
        allIssueBetweenDays: allIssueBetweenDays ?? this.allIssueBetweenDays
    );
  }
}