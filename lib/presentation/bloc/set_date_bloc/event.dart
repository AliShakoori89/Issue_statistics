import 'package:issue_statistics/data/model/issue_model.dart';

abstract class SetDateEvent{
  List<Object> get props => [];
}

class InitialDateEvent extends SetDateEvent {}
//
class ReadDateEvent extends SetDateEvent {}
//
// class ReadMonthEvent extends SetDateEvent {}
//
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

class AddNumberOfIssueEvent extends SetDateEvent {

  final IssueModel issueModel;
  final String date;

  AddNumberOfIssueEvent(
      {required this.issueModel, required this.date});

  @override
  List<Object> get props => [issueModel, date];
}

class ReadNumberOfIssuePerDateEvent extends SetDateEvent {
  final String startDate;
  final String endDate;

  ReadNumberOfIssuePerDateEvent(
      {required this.startDate, required this.endDate});

  @override
  List<Object> get props => [startDate, endDate];
}

class ReadNumberOfIssueBetweenDaysEvent extends SetDateEvent {
  final String startDate;
  final String endDate;

  ReadNumberOfIssueBetweenDaysEvent(
      {required this.startDate, required this.endDate});

  @override
  List<Object> get props => [startDate, endDate];
}

class CalculatePendarNumberOfIssue extends SetDateEvent {
  final String date;

  CalculatePendarNumberOfIssue(
      {required this.date});

  @override
  List<Object> get props => [date];
}