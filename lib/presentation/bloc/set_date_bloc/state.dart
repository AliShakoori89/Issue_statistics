import 'package:equatable/equatable.dart';
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
    this.status = SetDateStatus.initial,
    String? date,
    String? month,
    List<IssueModel>? issueDetails,
    String? selectDate,
    String? allIssuePerDate,
    String? calculatePendarNumberOfIssue
  }): date = date ?? '' ,
        month = month ?? '',
        issueDetails = issueDetails ?? const[],
        selectDate = selectDate ?? '',
        allIssuePerDate = allIssuePerDate ?? '0',
        calculatePendarNumberOfIssue = calculatePendarNumberOfIssue ?? '0';


  final SetDateStatus status;
  final String date;
  final String month;
  final List<IssueModel> issueDetails;
  final String selectDate;
  final String allIssuePerDate;
  final String calculatePendarNumberOfIssue;

  @override
  // TODO: implement props
  List<Object> get props => [status, date, month, issueDetails,
    selectDate, allIssuePerDate, calculatePendarNumberOfIssue];

  SetDateState copyWith({
    SetDateStatus? status,
    String? date,
    String? month,
    List<IssueModel>? issueDetails,
    String? selectDate,
    String? allIssuePerDate,
    String? calculatePendarNumberOfIssue
  }) {
    return SetDateState(
        status: status ?? this.status,
        date: date ?? this.date,
        month: month ?? this.month,
        issueDetails: issueDetails ?? this.issueDetails,
        selectDate: selectDate ?? this.selectDate,
        allIssuePerDate: allIssuePerDate ?? this.allIssuePerDate,
        calculatePendarNumberOfIssue: calculatePendarNumberOfIssue ?? this.calculatePendarNumberOfIssue
    );
  }
}