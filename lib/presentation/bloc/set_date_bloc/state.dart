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
    String? expensesPerMonth,
    String? expensesPerDate,
  }): date = date ?? '' ,
        month = month ?? '',
        selectDate = selectDate ?? '',
        expensesPerMonth = expensesPerMonth ?? "",
        expensesPerDate = expensesPerDate ?? "";


  final SetDateStatus status;
  final String date;
  final String month;
  final String selectDate;
  final String expensesPerMonth;
  final String expensesPerDate;

  @override
  // TODO: implement props
  List<Object> get props => [status, date, month, selectDate, expensesPerMonth,
    expensesPerDate];

  SetDateState copyWith({
    SetDateStatus? status,
    String? date,
    String? month,
    String? selectDate,
    String? expensesPerMonth,
    String? expensesPerDate
  }) {
    return SetDateState(
        status: status ?? this.status,
        date: date ?? this.date,
        month: month ?? this.month,
        selectDate: selectDate ?? this.selectDate,
        expensesPerMonth: expensesPerMonth ?? this.expensesPerMonth,
        expensesPerDate: expensesPerDate ?? this.expensesPerDate,
    );
  }
}