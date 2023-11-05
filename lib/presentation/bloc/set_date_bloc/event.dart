abstract class SetDateEvent{
  List<Object> get props => [];
}

// class InitialDateEvent extends SetDateEvent {}
//
// class ReadDateEvent extends SetDateEvent {}
//
// class ReadMonthEvent extends SetDateEvent {}
//
// class WriteDateEvent extends SetDateEvent {
//   final String date;
//   final String month;
//
//   WriteDateEvent(
//       {required this.date, required this.month});
//
//   @override
//   List<Object> get props => [date, month];
// }

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

class ReadAllIssuePerDateEvent extends SetDateEvent {

  final String date;

  ReadAllIssuePerDateEvent(
      {required this.date});

  @override
  List<Object> get props => [date];
}

class AddAllIssuePerDateEvent extends SetDateEvent {

  final String date;
  final int allIssuePerDate;

  AddAllIssuePerDateEvent(
      {required this.allIssuePerDate, required this.date});

  @override
  List<Object> get props => [allIssuePerDate, date];
}

class CalculatePendarNumberOfIssueAndSumEvent extends SetDateEvent {

  final String date;

  CalculatePendarNumberOfIssueAndSumEvent(
      {required this.date});

  @override
  List<Object> get props => [date];
}