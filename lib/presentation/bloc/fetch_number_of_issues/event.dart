abstract class NumberOfIssuesEvent{
  List<Object> get props => [];
}

class GetNumberOfIssuesEvent extends NumberOfIssuesEvent {
  final String customerCode;
  final String reportKey;

  GetNumberOfIssuesEvent({required this.customerCode, required this.reportKey});

  @override
  List<Object> get props => [customerCode, reportKey];

}