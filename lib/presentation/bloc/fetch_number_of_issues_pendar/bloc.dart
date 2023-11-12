import 'dart:convert';
import 'package:issue_statistics/data/model/response_model.dart';
import 'package:issue_statistics/logic/repositories/number_of_issues_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_pendar/state.dart';
import '../../../logic/repositories/date_time_repository.dart';
import 'event.dart';

class NumberOfIssuesPendarBloc extends Bloc<NumberOfIssuesPendarEvent, NumberOfIssuesPendarState> {

  NumberOfIssuesRepository numberOfIssuesRepository;
  SetDateRepository setDateRepository;

  NumberOfIssuesPendarBloc(this.numberOfIssuesRepository, this.setDateRepository) : super(
      const NumberOfIssuesPendarState()){
    on<GetNumberOfIssuesPendarEvent>(_mapNumberOfIssuesEventToState);
  }

  void _mapNumberOfIssuesEventToState(
      GetNumberOfIssuesPendarEvent event, Emitter<NumberOfIssuesPendarState> emit) async {
    try {
      emit(state.copyWith(status: NumberOfIssuesPendarStatus.loading));

      final responSeNumberOfIssueForPardazeshMaliPartCo = await numberOfIssuesRepository.getNumberOfIssueForPardazeshEttelaatMaliPartCoPendar(event.startDate, event.endDate);
      Iterable l = json.decode(responSeNumberOfIssueForPardazeshMaliPartCo.body);
      List<ResponseModel> numberOfIssueForPardazeshMaliPartCo = List<ResponseModel>.from(l.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForBankTejaratCo = await numberOfIssuesRepository.getNumberOfIssueForBankTejaratCoPendar(event.startDate, event.endDate);
      Iterable l2 = json.decode(responseNumberOfIssueForBankTejaratCo.body);
      List<ResponseModel> numberOfIssueForBankTejaratCo = List<ResponseModel>.from(l2.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForBankParsiyanCo = await numberOfIssuesRepository.getNumberOfIssueForBankParsianCo(event.startDate, event.endDate);
      Iterable l3 = json.decode(responseNumberOfIssueForBankParsiyanCo.body);
      List<ResponseModel> numberOfIssueForBankParsiyanCo = List<ResponseModel>.from(l3.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForShabakeKaranSamaCo = await numberOfIssuesRepository.getNumberOfIssueForShabakeKaranSamaCo(event.startDate, event.endDate);
      Iterable l4 = json.decode(responseNumberOfIssueForShabakeKaranSamaCo.body);
      List<ResponseModel> numberOfIssueForShabakeKaranSamaCo = List<ResponseModel>.from(l4.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo = await numberOfIssuesRepository.getFanavariVaRahHalhayeHushmandSepehrCo(event.startDate, event.endDate);
      Iterable l5 = json.decode(responseNumberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo.body);
      List<ResponseModel> numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo = List<ResponseModel>.from(l5.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForBankMellat = await numberOfIssuesRepository.getNumberOfIssueForBankMellat(event.startDate, event.endDate);
      Iterable l6 = json.decode(responseNumberOfIssueForBankMellat.body);
      List<ResponseModel> numberOfIssueForBankMellat = List<ResponseModel>.from(l6.map((model)=> ResponseModel.fromJson(model)));

      final pendarAllNumberOfIssue = await numberOfIssuesRepository.getPendarAllNumberOfIssue(
        numberOfIssueForPardazeshMaliPartCo.isNotEmpty ? numberOfIssueForPardazeshMaliPartCo[0].count : 0 ,
        numberOfIssueForBankTejaratCo.isNotEmpty ? numberOfIssueForBankTejaratCo[0].count : 0 ,
        numberOfIssueForBankParsiyanCo.isNotEmpty ? numberOfIssueForBankParsiyanCo[0].count : 0 ,
        numberOfIssueForShabakeKaranSamaCo.isNotEmpty ? numberOfIssueForShabakeKaranSamaCo[0].count : 0 ,
        numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo.isNotEmpty ? numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo[0].count : 0 ,
        numberOfIssueForBankMellat.isNotEmpty ? numberOfIssueForBankMellat[0].count : 0 ,
      );

      await numberOfIssuesRepository.writePendarAllNumberOfIssues(event.startDate, event.endDate, pendarAllNumberOfIssue);

      emit(
        state.copyWith(
          status: NumberOfIssuesPendarStatus.success,
            numberOfIssueForPardazeshMaliPartCo: numberOfIssueForPardazeshMaliPartCo,
            numberOfIssueForBankTejaratCo: numberOfIssueForBankTejaratCo,
            numberOfIssueForBankParsiyanCo: numberOfIssueForBankParsiyanCo,
            numberOfIssueForShabakeKaranSamaCo: numberOfIssueForShabakeKaranSamaCo,
            numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo: numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo,
            numberOfIssueForBankMellat: numberOfIssueForBankMellat,
            pendarAllNumberOfIssue: pendarAllNumberOfIssue),
      );


    } catch (error) {
      emit(state.copyWith(status: NumberOfIssuesPendarStatus.error));
    }
  }
}