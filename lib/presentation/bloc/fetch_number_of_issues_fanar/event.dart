abstract class NumberOfFanarFanarEvent{
  const NumberOfFanarFanarEvent();
}

class GetNumberOfIssuesFanarEvent extends NumberOfFanarFanarEvent {
  final String startDate;
  final String endDate;

  GetNumberOfIssuesFanarEvent({required this.startDate, required this.endDate});

  List<Object> get props => [startDate, endDate];
}