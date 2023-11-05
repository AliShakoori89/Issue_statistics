import 'package:equatable/equatable.dart';

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
    String? selectDate,
    int? allIssue,
    int? calculate,
  }): date = date ?? '' ,
        month = month ?? '',
        selectDate = selectDate ?? '',
        allIssue = allIssue ?? 0,
        calculate = calculate ?? 0;


  final SetDateStatus status;
  final String date;
  final String month;
  final String selectDate;
  final int allIssue;
  final int calculate;

  @override
  // TODO: implement props
  List<Object> get props => [status, date, month, selectDate, allIssue,
    calculate];

  SetDateState copyWith({
    SetDateStatus? status,
    String? date,
    String? month,
    String? selectDate,
    int? allIssue,
    int? calculate
  }) {
    return SetDateState(
        status: status ?? this.status,
        date: date ?? this.date,
        month: month ?? this.month,
        selectDate: selectDate ?? this.selectDate,
        allIssue: allIssue ?? this.allIssue,
        calculate: calculate ?? this.calculate
    );
  }
}