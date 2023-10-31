abstract class SetDateEvent{
  List<Object> get props => [];
}

class InitialDateEvent extends SetDateEvent {}

class ReadDateEvent extends SetDateEvent {}

class ReadMonthEvent extends SetDateEvent {}

class WriteDateEvent extends SetDateEvent {
  final String date;
  final String month;

  WriteDateEvent(
      {required this.date, required this.month});

  @override
  List<Object> get props => [date, month];
}

class AddToDateEvent extends SetDateEvent{
  final String date;
  final String month;

  AddToDateEvent(
      {required this.date, required this.month});

  @override
  List<Object> get props => [date, month];
}

class ReduceDateEvent extends SetDateEvent{
  final String date;
  final String month;

  ReduceDateEvent(
      {required this.date, required this.month});

  @override
  List<Object> get props => [date, month];
}

// class SumExpensePerMonthEvent extends SetDateEvent {
//   final String month;
//
//   SumExpensePerMonthEvent(
//       {required this.month});
//
//   @override
//   List<Object> get props => [month];
// }
//
// class SumExpensePerDateEvent extends SetDateEvent {
//   final String date;
//
//   SumExpensePerDateEvent(
//       {required this.date});
//
//   @override
//   List<Object> get props => [date];
// }
//
// class CalculateCashPerMonthEvent extends SetDateEvent{
//   final String month;
//
//   CalculateCashPerMonthEvent(
//       {required this.month});
//
//   @override
//   List<Object> get props => [month];
// }
//
// class FetchIncomeEvent extends SetDateEvent {
//   final String month;
//
//   FetchIncomeEvent(
//       {required this.month});
//
//   @override
//   List<Object> get props => [month];
// }
//
// class FetchAllIncomeItemsEvent extends SetDateEvent {
//   final String month;
//
//   FetchAllIncomeItemsEvent(
//       {required this.month});
//
//   @override
//   List<Object> get props => [month];
// }
//
// class FetchExpensesItemsEvent extends SetDateEvent {
//   final String date;
//
//   FetchExpensesItemsEvent(
//       {required this.date});
//
//   @override
//   List<Object> get props => [date];
// }