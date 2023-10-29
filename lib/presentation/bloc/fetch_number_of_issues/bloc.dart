import 'dart:convert';

import 'package:issue_statistics/data/model/response_model.dart';
import 'package:issue_statistics/logic/repositories/number_of_issues_repository.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues/event.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberOfIssuesBloc extends Bloc<NumberOfIssuesEvent, NumberOfIssuesState> {

  NumberOfIssuesRepository numberOfIssuesRepository;

  NumberOfIssuesBloc(this.numberOfIssuesRepository) : super(
      const NumberOfIssuesState()){
    on<GetNumberOfIssuesEvent>(_mapNumberOfIssuesEventToState);
  }

  void _mapNumberOfIssuesEventToState(
      GetNumberOfIssuesEvent event, Emitter<NumberOfIssuesState> emit) async {
    try {
      emit(state.copyWith(status: NumberOfIssuesStatus.loading));
      print("444444444444444     ${event.reportKey}");
      final response1 = await numberOfIssuesRepository.getNumberOfIssues(event.reportKey, event.customerCode);
      print("55555555555555555     "+response1.body);
      Iterable l = json.decode(response1.body);
      print("6666666666666666              $l");
      List<ResponseModel> numberOfIssue = List<ResponseModel>.from(l.map((model)=> ResponseModel.fromJson(model)));
      print("7777777777777777777777        $numberOfIssue");
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