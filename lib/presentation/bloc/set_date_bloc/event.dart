import 'package:issue_statistics/data/model/issue_model.dart';

abstract class SetDateEvent{
  List<Object> get props => [];
}

class InitialDateEvent extends SetDateEvent {}

class ReadDateEvent extends SetDateEvent {}

class WriteDateEvent extends SetDateEvent {
  final String date;
  final String month;
  final String year;

  WriteDateEvent(
      {required this.date, required this.month, required this.year});

  @override
  List<Object> get props => [date, month, year];
}

class AddToDateEvent extends SetDateEvent{
  final String date;
  final String month;
  final String year;

  AddToDateEvent(
      {required this.date, required this.month, required this.year});

  @override
  List<Object> get props => [date, month, year];
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

  AddNumberOfIssueEvent(
      {required this.issueModel});

  @override
  List<Object> get props => [issueModel];
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