abstract class FetchNumberOfAllIssueEvent{
  List<Object> get props => [];
}
class FetchNumberOfAllIssuePerDateEvent extends FetchNumberOfAllIssueEvent {

  final String date;

  FetchNumberOfAllIssuePerDateEvent({required this.date});

  @override
  List<Object> get props => [date];
}