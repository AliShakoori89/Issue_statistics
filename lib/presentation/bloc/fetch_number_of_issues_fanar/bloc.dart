import 'dart:convert';
import 'package:issue_statistics/data/model/response_model.dart';
import 'package:issue_statistics/logic/repositories/date_time_repository.dart';
import 'package:issue_statistics/logic/repositories/number_of_issues_repository.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_fanar/event.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_fanar/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberOfIssuesFanarBloc extends Bloc<NumberOfIssuesFanarEvent, NumberOfIssuesFanarState> {

  NumberOfIssuesRepository numberOfIssuesRepository;
  SetDateRepository setDateRepository;

  NumberOfIssuesFanarBloc(this.numberOfIssuesRepository, this.setDateRepository) : super(
      const NumberOfIssuesFanarState()){
    on<GetNumberOfIssuesFanarEvent>(_mapNumberOfIssuesEventToState);
  }

  void _mapNumberOfIssuesEventToState(
      GetNumberOfIssuesFanarEvent event, Emitter<NumberOfIssuesFanarState> emit) async {
    try {
      emit(state.copyWith(status: NumberOfIssuesFanarStatus.loading));

      final responSenumberOfIssueForAsrDaneshAfzarCo = await numberOfIssuesRepository.getNumberOfIssuesForAsrDaneshAfzarCo(event.date);
      Iterable l = json.decode(responSenumberOfIssueForAsrDaneshAfzarCo.body);
      List<ResponseModel> numberOfIssueForAsrDaneshAfzarCo = List<ResponseModel>.from(l.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForToseeTejaratTeniyanCo = await numberOfIssuesRepository.getNumberOfIssuesForToseTejaratElectronicTenianCo(event.date);
      Iterable l2 = json.decode(responseNumberOfIssueForToseeTejaratTeniyanCo.body);
      List<ResponseModel> numberOfIssueForToseeTejaratTeniyanCo = List<ResponseModel>.from(l2.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForRahkarHushmandAmnCo = await numberOfIssuesRepository.getNumberOfIssueForRahkarHushmandAmnCo(event.date);
      Iterable l3 = json.decode(responseNumberOfIssueForRahkarHushmandAmnCo.body);
      List<ResponseModel> numberOfIssueForRahkarHushmandAmnCo = List<ResponseModel>.from(l3.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForToseeEttelaatVaErtebatatITSazaCo = await numberOfIssuesRepository.getNumberOfIssueForToseeEttelaatVaErtebatatITSazaCo(event.date);
      Iterable l4 = json.decode(responseNumberOfIssueForToseeEttelaatVaErtebatatITSazaCo.body);
      List<ResponseModel> numberOfIssueForToseeEttelaatVaErtebatatITSazaCo = List<ResponseModel>.from(l4.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForKiyakushanAriyaCo = await numberOfIssuesRepository.getNumberOfIssueForKiyakushanAriyaCo(event.date);
      Iterable l5 = json.decode(responseNumberOfIssueForKiyakushanAriyaCo.body);
      List<ResponseModel> numberOfIssueForKiyakushanAriyaCo = List<ResponseModel>.from(l5.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForToseeNovinHamrahKishCo = await numberOfIssuesRepository.getNumberOfIssueForToseeNovinHamrahKishCo(event.date);
      Iterable l6 = json.decode(responseNumberOfIssueForToseeNovinHamrahKishCo.body);
      List<ResponseModel> numberOfIssueForToseeNovinHamrahKishCo = List<ResponseModel>.from(l6.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForTabanAtiPardazCo = await numberOfIssuesRepository.getNumberOfIssueForTabanAtiPardazCo(event.date);
      Iterable l7 = json.decode(responseNumberOfIssueForTabanAtiPardazCo.body);
      List<ResponseModel> numberOfIssueForTabanAtiPardazCo = List<ResponseModel>.from(l7.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForZherfAndishanHushmandDibaRayanCo = await numberOfIssuesRepository.getNumberOfIssueForZherfAndishanHushmandDibaRayanCo(event.date);
      Iterable l8 = json.decode(responseNumberOfIssueForZherfAndishanHushmandDibaRayanCo.body);
      List<ResponseModel> numberOfIssueForZherfAndishanHushmandDibaRayanCo = List<ResponseModel>.from(l8.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForPardazeshEttelaatMaliPartCo = await numberOfIssuesRepository.getNumberOfIssueForPardazeshEttelaatMaliPartCoFanar(event.date);
      Iterable l9 = json.decode(responseNumberOfIssueForPardazeshEttelaatMaliPartCo.body);
      List<ResponseModel> numberOfIssueForPardazeshEttelaatMaliPartCo = List<ResponseModel>.from(l9.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForBankTejaratCo = await numberOfIssuesRepository.getNumberOfIssueForBankTejaratCoFanar(event.date);
      Iterable l10 = json.decode(responseNumberOfIssueForBankTejaratCo.body);
      List<ResponseModel> numberOfIssueForBankTejaratCo = List<ResponseModel>.from(l10.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForPishgamanEtemadDijitalIraniyanCo = await numberOfIssuesRepository.getNumberOfIssueForPishgamanEtemadDijitalIraniyanCo(event.date);
      Iterable l11 = json.decode(responseNumberOfIssueForPishgamanEtemadDijitalIraniyanCo.body);
      List<ResponseModel> numberOfIssueForPishgamanEtemadDijitalIraniyanCo = List<ResponseModel>.from(l11.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForFanAvaranEtemadRaahbarCo = await numberOfIssuesRepository.getNumberOfIssueForFanAvaranEtemadRaahbarCo(event.date);
      Iterable l12 = json.decode(responseNumberOfIssueForFanAvaranEtemadRaahbarCo.body);
      List<ResponseModel> numberOfIssueForFanAvaranEtemadRaahbatCo = List<ResponseModel>.from(l12.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForGrouhTejaratElectronicSadraKiyanCo = await numberOfIssuesRepository.getNumberOfIssueForGrouhTejaratElectronicSadraKiyantCo(event.date);
      Iterable l13 = json.decode(responseNumberOfIssueForGrouhTejaratElectronicSadraKiyanCo.body);
      List<ResponseModel> numberOfIssueForGrouhTejaratElectronicSadraKiyanCo = List<ResponseModel>.from(l13.map((model)=> ResponseModel.fromJson(model)));

      final responseNumberOfIssueForFinTekParsCo = await numberOfIssuesRepository.getNumberOfIssueForFinTekParsCo(event.date);
      Iterable l14 = json.decode(responseNumberOfIssueForFinTekParsCo.body);
      List<ResponseModel> numberOfIssueForFinTekParsCo = List<ResponseModel>.from(l14.map((model)=> ResponseModel.fromJson(model)));

      final faanarAllNumberOfIssue = await numberOfIssuesRepository.getFanarAllNumberOfIssue(
        numberOfIssueForFinTekParsCo.isNotEmpty ? numberOfIssueForFinTekParsCo[0].count : 0,
        numberOfIssueForGrouhTejaratElectronicSadraKiyanCo.isNotEmpty ? numberOfIssueForGrouhTejaratElectronicSadraKiyanCo[0].count : 0,
        numberOfIssueForFanAvaranEtemadRaahbatCo.isNotEmpty ? numberOfIssueForFanAvaranEtemadRaahbatCo[0].count : 0 ,
        numberOfIssueForPishgamanEtemadDijitalIraniyanCo.isNotEmpty ? numberOfIssueForPishgamanEtemadDijitalIraniyanCo[0].count : 0 ,
        numberOfIssueForBankTejaratCo.isNotEmpty ? numberOfIssueForBankTejaratCo[0].count : 0 ,
        numberOfIssueForPardazeshEttelaatMaliPartCo.isNotEmpty ? numberOfIssueForPardazeshEttelaatMaliPartCo[0].count : 0 ,
        numberOfIssueForZherfAndishanHushmandDibaRayanCo.isNotEmpty ? numberOfIssueForZherfAndishanHushmandDibaRayanCo[0].count : 0 ,
        numberOfIssueForTabanAtiPardazCo.isNotEmpty ? numberOfIssueForTabanAtiPardazCo[0].count : 0 ,
        numberOfIssueForToseeNovinHamrahKishCo.isNotEmpty ? numberOfIssueForToseeNovinHamrahKishCo[0].count : 0 ,
        numberOfIssueForKiyakushanAriyaCo.isNotEmpty ? numberOfIssueForKiyakushanAriyaCo[0].count : 0 ,
        numberOfIssueForToseeEttelaatVaErtebatatITSazaCo.isNotEmpty ? numberOfIssueForToseeEttelaatVaErtebatatITSazaCo[0].count : 0 ,
        numberOfIssueForRahkarHushmandAmnCo.isNotEmpty ? numberOfIssueForRahkarHushmandAmnCo[0].count : 0 ,
        numberOfIssueForToseeTejaratTeniyanCo.isNotEmpty ? numberOfIssueForToseeTejaratTeniyanCo[0].count : 0 ,
        numberOfIssueForAsrDaneshAfzarCo.isNotEmpty ? numberOfIssueForAsrDaneshAfzarCo[0].count : 0
      );

      await numberOfIssuesRepository.writeFanarAllNumberOfIssues(event.date, faanarAllNumberOfIssue);

      emit(
        state.copyWith(
          status: NumberOfIssuesFanarStatus.success,
          numberOfIssueForAsrDaneshAfzarCo: numberOfIssueForAsrDaneshAfzarCo,
          numberOfIssueForToseeTejaratTeniyanCo: numberOfIssueForToseeTejaratTeniyanCo,
          numberOfIssueForRahkarHushmandAmnCo: numberOfIssueForRahkarHushmandAmnCo,
          numberOfIssueForToseeEttelaatVaErtebatatITSazaCo: numberOfIssueForToseeEttelaatVaErtebatatITSazaCo,
          numberOfIssueForKiyakushanAriyaCo: numberOfIssueForKiyakushanAriyaCo,
          numberOfIssueForToseeNovinHamrahKishCo: numberOfIssueForToseeNovinHamrahKishCo,
          numberOfIssueForTabanAtiPardazCo: numberOfIssueForTabanAtiPardazCo,
          numberOfIssueForZherfAndishanHushmandDibaRayanCo: numberOfIssueForZherfAndishanHushmandDibaRayanCo,
          numberOfIssueForPardazeshEttelaatMaliPartCo: numberOfIssueForPardazeshEttelaatMaliPartCo,
          numberOfIssueForBankTejaratCo: numberOfIssueForBankTejaratCo,
          numberOfIssueForPishgamanEtemadDijitalIraniyanCo: numberOfIssueForPishgamanEtemadDijitalIraniyanCo,
          numberOfIssueForFanAvaranEtemadRaahbatCo: numberOfIssueForFanAvaranEtemadRaahbatCo,
          numberOfIssueForGrouhTejaratElectronicSadraKiyanCo: numberOfIssueForGrouhTejaratElectronicSadraKiyanCo,
          numberOfIssueFinTekParsCo: numberOfIssueForFinTekParsCo,
          fanarAllNumberOfIssue: faanarAllNumberOfIssue
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: NumberOfIssuesFanarStatus.error));
    }
  }

}