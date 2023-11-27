abstract class MonthlyChartEvent{
  const MonthlyChartEvent();
}

class MonthlyIssuePerYearEvent extends MonthlyChartEvent {
  final String year;

  MonthlyIssuePerYearEvent({required this.year});

  List<Object> get props => [year];
}

