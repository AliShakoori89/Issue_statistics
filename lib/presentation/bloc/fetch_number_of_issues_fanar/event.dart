abstract class NumberOfFanarEvent{
  const NumberOfFanarEvent();
}

class GetNumberOfIssuesFanarEvent extends NumberOfFanarEvent {
  final String startDate;
  final String endDate;

  GetNumberOfIssuesFanarEvent({required this.startDate, required this.endDate});

  List<Object> get props => [startDate, endDate];
}