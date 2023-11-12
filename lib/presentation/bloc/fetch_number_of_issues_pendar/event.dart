abstract class NumberOfIssuesPendarEvent{
  const NumberOfIssuesPendarEvent();
}

class GetNumberOfIssuesPendarEvent extends NumberOfIssuesPendarEvent {
  final String startDate;
  final String endDate;

  GetNumberOfIssuesPendarEvent({required this.startDate, required this.endDate});

  List<Object> get props => [startDate, endDate];
}

