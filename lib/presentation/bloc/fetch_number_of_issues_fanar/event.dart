abstract class NumberOfIssuesFanarEvent{
  const NumberOfIssuesFanarEvent();
}

class GetNumberOfIssuesFanarEvent extends NumberOfIssuesFanarEvent {
  final String date;

  GetNumberOfIssuesFanarEvent({required this.date});

  List<Object> get props => [date];
}