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
    String? todayExpenses
  }): date = date ?? '' ,
        month = month ?? '',
        selectDate = selectDate ?? '';

  final SetDateStatus status;
  final String date;
  final String month;
  final String selectDate;

  @override
  // TODO: implement props
  List<Object> get props => [status, date, month, selectDate];

  SetDateState copyWith({
    SetDateStatus? status,
    String? date,
    String? month,
    String? selectDate,
  }) {
    return SetDateState(
        status: status ?? this.status,
        date: date ?? this.date,
        month: month ?? this.month,
        selectDate: selectDate ?? this.selectDate,
    );
  }
}