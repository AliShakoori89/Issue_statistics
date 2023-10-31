abstract class NumberOfIssuesPendarEvent{
  const NumberOfIssuesPendarEvent();
}

class GetNumberOfIssuesPendarEvent extends NumberOfIssuesPendarEvent {
  final String date;

  GetNumberOfIssuesPendarEvent({required this.date});

  List<Object> get props => [date];
}