import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:issue_statistics/logic/repositories/date_time_repository.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_all_issue_per_date/state.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_all_issue_per_date/event.dart';


class FetchNumberOfAllIssuePerDateBloc extends Bloc<FetchNumberOfAllIssueEvent, FetchNumberOfAllIssuePerDateState> {

  SetDateRepository setDateRepository;

  FetchNumberOfAllIssuePerDateBloc(this.setDateRepository)
      : super(
      const FetchNumberOfAllIssuePerDateState()) {
    on<FetchNumberOfAllIssuePerDateEvent>(_mapNumberOfAllIssuePerDateEventToState);
  }

  void _mapNumberOfAllIssuePerDateEventToState(
      FetchNumberOfAllIssuePerDateEvent event, Emitter<FetchNumberOfAllIssuePerDateState> emit) async {

    int numberOfAllIssuePerDate = 0;

    try {
      emit(state.copyWith(status: FetchNumberOfAllIssuePerDateStatus.loading));



      print("Bloc");

      final numberOfAllIssuePerDate =  await setDateRepository.fetchAllNumberOfIssuePerDate(event.date);
      emit(
        state.copyWith(
            status: FetchNumberOfAllIssuePerDateStatus.success,
            numberOfAllIssuePerDate: numberOfAllIssuePerDate,
        ),
      );
    }catch (error) {
      emit(state.copyWith(status: FetchNumberOfAllIssuePerDateStatus.error));
    }

  }

}