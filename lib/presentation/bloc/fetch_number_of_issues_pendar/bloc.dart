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
    int intNumberOfIssueForBankTejaratCo = 0;
    int intNumberOfIssueForPardazeshMaliPartCo = 0;
    int intNumberOfIssueForBankParsiyanCo = 0;
    int intNumberOfIssueForShabakeKaranSamaCo = 0;
    int intNumberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo = 0;
    int intNumberOfIssueForBankMellat = 0;
    int intNumberOfIssueForTataCo = 0;
    int intNumberOfIssueForSimorghTejaratCo = 0;
    try {
      emit(state.copyWith(status: NumberOfIssuesPendarStatus.loading));

      final responSeNumberOfIssueForPardazeshMaliPartCo = await numberOfIssuesRepository.getNumberOfIssueForPardazeshEttelaatMaliPartCoPendar(event.startDate, event.endDate);
      Iterable l = json.decode(responSeNumberOfIssueForPardazeshMaliPartCo.body);
      List<ResponseModel> numberOfIssueForPardazeshMaliPartCo = List<ResponseModel>.from(l.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l.length ; i++){
        intNumberOfIssueForPardazeshMaliPartCo = intNumberOfIssueForPardazeshMaliPartCo + numberOfIssueForPardazeshMaliPartCo[i].count!;
      }

      final responseNumberOfIssueForBankTejaratCo = await numberOfIssuesRepository.getNumberOfIssueForBankTejaratCoPendar(event.startDate, event.endDate);
      Iterable l2 = json.decode(responseNumberOfIssueForBankTejaratCo.body);
      List<ResponseModel> numberOfIssueForBankTejaratCo = List<ResponseModel>.from(l2.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l2.length ; i++){
        intNumberOfIssueForBankTejaratCo = intNumberOfIssueForBankTejaratCo + numberOfIssueForBankTejaratCo[i].count!;
      }

      final responseNumberOfIssueForBankParsiyanCo = await numberOfIssuesRepository.getNumberOfIssueForBankParsianCo(event.startDate, event.endDate);
      Iterable l3 = json.decode(responseNumberOfIssueForBankParsiyanCo.body);
      List<ResponseModel> numberOfIssueForBankParsiyanCo = List<ResponseModel>.from(l3.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l3.length ; i++){
        intNumberOfIssueForBankParsiyanCo = intNumberOfIssueForBankParsiyanCo + numberOfIssueForBankParsiyanCo[i].count!;
      }

      final responseNumberOfIssueForShabakeKaranSamaCo = await numberOfIssuesRepository.getNumberOfIssueForShabakeKaranSamaCo(event.startDate, event.endDate);
      Iterable l4 = json.decode(responseNumberOfIssueForShabakeKaranSamaCo.body);
      List<ResponseModel> numberOfIssueForShabakeKaranSamaCo = List<ResponseModel>.from(l4.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l4.length ; i++){
        intNumberOfIssueForShabakeKaranSamaCo = intNumberOfIssueForShabakeKaranSamaCo + numberOfIssueForShabakeKaranSamaCo[i].count!;
      }

      final responseNumberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo = await numberOfIssuesRepository.getFanavariVaRahHalhayeHushmandSepehrCo(event.startDate, event.endDate);
      Iterable l5 = json.decode(responseNumberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo.body);
      List<ResponseModel> numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo = List<ResponseModel>.from(l5.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l5.length ; i++){
        intNumberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo = intNumberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo + numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo[i].count!;
      }

      final responseNumberOfIssueForBankMellat = await numberOfIssuesRepository.getNumberOfIssueForBankMellat(event.startDate, event.endDate);
      Iterable l6 = json.decode(responseNumberOfIssueForBankMellat.body);
      List<ResponseModel> numberOfIssueForBankMellat = List<ResponseModel>.from(l6.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l6.length ; i++){
        intNumberOfIssueForBankMellat = intNumberOfIssueForBankMellat + numberOfIssueForBankMellat[i].count!;
      }

      final responseNumberOfIssueForTataCo = await numberOfIssuesRepository.getNumberOfIssueForTataCo(event.startDate, event.endDate);
      Iterable l7 = json.decode(responseNumberOfIssueForTataCo.body);
      List<ResponseModel> numberOfIssueForTataCo = List<ResponseModel>.from(l7.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l7.length ; i++){
        intNumberOfIssueForTataCo = intNumberOfIssueForTataCo + numberOfIssueForTataCo[i].count!;
      }

      final responseNumberOfIssueForSimorghTejaratCo = await numberOfIssuesRepository.getNumberOfIssueForSimorghTejaratCo(event.startDate, event.endDate);
      Iterable l8 = json.decode(responseNumberOfIssueForSimorghTejaratCo.body);
      List<ResponseModel> numberOfIssueForSimorghTejaratCo = List<ResponseModel>.from(l8.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l8.length ; i++){
        intNumberOfIssueForSimorghTejaratCo = intNumberOfIssueForSimorghTejaratCo + numberOfIssueForSimorghTejaratCo[i].count!;
      }

      final pendarAllNumberOfIssue = await numberOfIssuesRepository.getPendarAllNumberOfIssue(
        intNumberOfIssueForPardazeshMaliPartCo ,
        intNumberOfIssueForBankTejaratCo,
        intNumberOfIssueForBankParsiyanCo ,
        intNumberOfIssueForShabakeKaranSamaCo ,
        intNumberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo ,
        intNumberOfIssueForBankMellat ,
        intNumberOfIssueForTataCo ,
        intNumberOfIssueForSimorghTejaratCo,
      );

      await numberOfIssuesRepository.writePendarAllNumberOfIssues(event.startDate, event.endDate, pendarAllNumberOfIssue);

      final pendarRaList = numberOfIssuesRepository.pendarRaList(
        intNumberOfIssueForPardazeshMaliPartCo ,
        intNumberOfIssueForBankTejaratCo,
        intNumberOfIssueForBankParsiyanCo ,
        intNumberOfIssueForShabakeKaranSamaCo ,
        intNumberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo ,
        intNumberOfIssueForBankMellat ,
        intNumberOfIssueForTataCo ,
        intNumberOfIssueForSimorghTejaratCo);

      emit(
        state.copyWith(
          status: NumberOfIssuesPendarStatus.success,
            numberOfIssueForPardazeshMaliPartCo: intNumberOfIssueForPardazeshMaliPartCo,
            numberOfIssueForBankTejaratCo: intNumberOfIssueForBankTejaratCo,
            numberOfIssueForBankParsiyanCo: intNumberOfIssueForBankParsiyanCo,
            numberOfIssueForShabakeKaranSamaCo: intNumberOfIssueForShabakeKaranSamaCo,
            numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo: intNumberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo,
            numberOfIssueForBankMellat: intNumberOfIssueForBankMellat,
            numberOfIssueForTataCo: intNumberOfIssueForTataCo,
            numberOfIssueForSimorghTejaratCo: intNumberOfIssueForSimorghTejaratCo,
            pendarAllNumberOfIssue: pendarAllNumberOfIssue,
            pendarRaList: pendarRaList
            ),
      );

    } catch (error) {
      emit(state.copyWith(status: NumberOfIssuesPendarStatus.error));
    }
  }
}