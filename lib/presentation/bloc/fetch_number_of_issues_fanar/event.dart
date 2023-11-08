abstract class NumberOfFanarFanarEvent{
  const NumberOfFanarFanarEvent();
}

class GetNumberOfIssuesFanarEvent extends NumberOfFanarFanarEvent {
  final String date;

  GetNumberOfIssuesFanarEvent({required this.date});

  List<Object> get props => [date];
}