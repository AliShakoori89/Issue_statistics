import 'package:issue_statistics/data/model/response_model.dart';
import 'package:issue_statistics/logic/repositories/number_of_issues_repository.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues/event.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberOfIssuesBloc extends Bloc<NumberOfIssuesEvent, NumberOfIssuesState> {

  NumberOfIssuesRepository numberOfIssuesRepository = NumberOfIssuesRepository();

  NumberOfIssuesBloc(this.numberOfIssuesRepository) : super(
      const NumberOfIssuesState()){
    on<GetNumberOfIssuesEvent>(_mapNumberOfIssuesEventToState);
  }

  void _mapNumberOfIssuesEventToState(
      GetNumberOfIssuesEvent event, Emitter<NumberOfIssuesState> emit) async {
    try {
      emit(state.copyWith(status: NumberOfIssuesStatus.loading));
      print("2222222222");
      final List<ResponseModel> numberOfIssue = await numberOfIssuesRepository.getNumberOfIssues(event.reportKey, event.customerCode);
      print("3333333333");
      emit(
        state.copyWith(
          status: NumberOfIssuesStatus.success,
          numberOfIssue: numberOfIssue,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: NumberOfIssuesStatus.error));
    }
  }
}