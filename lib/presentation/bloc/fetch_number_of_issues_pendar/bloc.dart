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

      final responSeNumberOfIssueForPardazeshMaliPartCo = await numberOfIssuesRepository.getNumberOfIssueForPardazeshEttelaatMaliPartCoPendar(event.date);
      Iterable l = json.decode(responSeNumberOfIssueForPardazeshMaliPartCo.body);
      List<ResponseModel> numberOfIssueForPardazeshMaliPartCo = List<ResponseModel>.from(l.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForBankTejaratCo = await numberOfIssuesRepository.getNumberOfIssueForBankTejaratCoPendar(event.date);
      Iterable l2 = json.decode(responseNumberOfIssueForBankTejaratCo.body);
      List<ResponseModel> numberOfIssueForBankTejaratCo = List<ResponseModel>.from(l2.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForBankParsiyanCo = await numberOfIssuesRepository.getNumberOfIssueForBankParsianCo(event.date);
      Iterable l3 = json.decode(responseNumberOfIssueForBankParsiyanCo.body);
      List<ResponseModel> numberOfIssueForBankParsiyanCo = List<ResponseModel>.from(l3.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForShabakeKaranSamaCo = await numberOfIssuesRepository.getNumberOfIssueForShabakeKaranSamaCo(event.date);
      Iterable l4 = json.decode(responseNumberOfIssueForShabakeKaranSamaCo.body);
      List<ResponseModel> numberOfIssueForShabakeKaranSamaCo = List<ResponseModel>.from(l4.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo = await numberOfIssuesRepository.getFanavariVaRahHalhayeHushmandSepehrCo(event.date);
      Iterable l5 = json.decode(responseNumberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo.body);
      List<ResponseModel> numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo = List<ResponseModel>.from(l5.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForBankMellat = await numberOfIssuesRepository.getNumberOfIssueForBankMellat(event.date);
      Iterable l6 = json.decode(responseNumberOfIssueForBankMellat.body);
      List<ResponseModel> numberOfIssueForBankMellat = List<ResponseModel>.from(l6.map((model)=> ResponseModel.fromJson(model)));

      final PendarAllNumberOfIssue = await numberOfIssuesRepository.getPendarAllNumberOfIssue(
        numberOfIssueForPardazeshMaliPartCo.isNotEmpty ? numberOfIssueForPardazeshMaliPartCo[0].count : 0 ,
        numberOfIssueForBankTejaratCo.isNotEmpty ? numberOfIssueForBankTejaratCo[0].count : 0 ,
        numberOfIssueForBankParsiyanCo.isNotEmpty ? numberOfIssueForBankParsiyanCo[0].count : 0 ,
        numberOfIssueForShabakeKaranSamaCo.isNotEmpty ? numberOfIssueForShabakeKaranSamaCo[0].count : 0 ,
        numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo.isNotEmpty ? numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo[0].count : 0 ,
          numberOfIssueForBankMellat.isNotEmpty ? numberOfIssueForBankMellat[0].count : 0
      );

      emit(
        state.copyWith(
          status: NumberOfIssuesPendarStatus.success,
            numberOfIssueForPardazeshMaliPartCo: numberOfIssueForPardazeshMaliPartCo,
            numberOfIssueForBankTejaratCo: numberOfIssueForBankTejaratCo,
            numberOfIssueForBankParsiyanCo: numberOfIssueForBankParsiyanCo,
            numberOfIssueForShabakeKaranSamaCo: numberOfIssueForShabakeKaranSamaCo,
            numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo: numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo,
            numberOfIssueForBankMellat: numberOfIssueForBankMellat,
            pendarAllNumberOfIssue: PendarAllNumberOfIssue,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: NumberOfIssuesPendarStatus.error));
    }
  }
}