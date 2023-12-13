import 'dart:convert';
import 'package:issue_statistics/data/model/response_model.dart';
import 'package:issue_statistics/logic/repositories/date_time_repository.dart';
import 'package:issue_statistics/logic/repositories/number_of_issues_repository.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_fanar/event.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_fanar/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberOfFanarIssuesBloc extends Bloc<NumberOfFanarEvent, NumberOfFanarIssuesState> {

  NumberOfIssuesRepository numberOfIssuesRepository;
  SetDateRepository setDateRepository;


  NumberOfFanarIssuesBloc(this.numberOfIssuesRepository, this.setDateRepository) : super(
      const NumberOfFanarIssuesState()){
    on<GetNumberOfIssuesFanarEvent>(_mapNumberOfIssuesEventToState);
  }

  void _mapNumberOfIssuesEventToState(
      GetNumberOfIssuesFanarEvent event, Emitter<NumberOfFanarIssuesState> emit) async {

    int intNumberOfIssueForAsrDaneshAfzarCo = 0;
    int intNumberOfIssueForToseeTejaratTeniyanCo = 0;
    int intNumberOfIssueForRahkarHushmandAmnCo = 0;
    int intNumberOfIssueForToseeEttelaatVaErtebatatITSazaCo = 0;
    int intNumberOfIssueForKiyaHushanAriyaCo = 0;
    int intNumberOfIssueForToseeNovinHamrahKishCo = 0;
    int intNumberOfIssueForTabanAtiPardazCo = 0;
    int intNumberOfIssueForZherfAndishanHushmandDibaRayanCo = 0;
    int intNumberOfIssueForPardazeshEttelaatMaliPartCo =0;
    int intNumberOfIssueForBankTejaratCo = 0;
    int intNumberOfIssueForPishgamanEtemadDijitalIraniyanCo = 0;
    int intNumberOfIssueForFanAvaranEtemadRaahbarCo = 0;
    int intNumberOfIssueForGrouhTejaratElectronicSadraKiyanCo = 0;
    int intNumberOfIssueForFinTekParsCo = 0;
    int intNumberOfIssueForTejaratElectronicRahbordEidealAminCo = 0;
    int intNumberOfIssueForFanavaranElectronicHoviyatAmnCo = 0;

    try {
      emit(state.copyWith(status: NumberOfIssuesFanarStatus.loading));

      final responSenumberOfIssueForAsrDaneshAfzarCo = await numberOfIssuesRepository.getNumberOfIssuesForAsrDaneshAfzarCo(event.startDate, event.endDate);
      Iterable l = json.decode(responSenumberOfIssueForAsrDaneshAfzarCo.body);
      List<ResponseModel> numberOfIssueForAsrDaneshAfzarCo = List<ResponseModel>.from(l.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l.length ; i++){
        intNumberOfIssueForAsrDaneshAfzarCo = intNumberOfIssueForAsrDaneshAfzarCo + numberOfIssueForAsrDaneshAfzarCo[i].count!;
      }

      final responseNumberOfIssueForToseeTejaratTeniyanCo = await numberOfIssuesRepository.getNumberOfIssuesForToseTejaratElectronicTenianCo(event.startDate, event.endDate);
      Iterable l2 = json.decode(responseNumberOfIssueForToseeTejaratTeniyanCo.body);
      List<ResponseModel> numberOfIssueForToseeTejaratTeniyanCo = List<ResponseModel>.from(l2.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l2.length ; i++){
        intNumberOfIssueForToseeTejaratTeniyanCo = intNumberOfIssueForToseeTejaratTeniyanCo + numberOfIssueForToseeTejaratTeniyanCo[i].count!;
      }

      final responseNumberOfIssueForRahkarHushmandAmnCo = await numberOfIssuesRepository.getNumberOfIssueForRahkarHushmandAmnCo(event.startDate, event.endDate);
      Iterable l3 = json.decode(responseNumberOfIssueForRahkarHushmandAmnCo.body);
      List<ResponseModel> numberOfIssueForRahkarHushmandAmnCo = List<ResponseModel>.from(l3.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l3.length ; i++){
        intNumberOfIssueForRahkarHushmandAmnCo = intNumberOfIssueForRahkarHushmandAmnCo + numberOfIssueForRahkarHushmandAmnCo[i].count!;
      }

      final responseNumberOfIssueForToseeEttelaatVaErtebatatITSazaCo = await numberOfIssuesRepository.getNumberOfIssueForToseeEttelaatVaErtebatatITSazaCo(event.startDate, event.endDate);
      Iterable l4 = json.decode(responseNumberOfIssueForToseeEttelaatVaErtebatatITSazaCo.body);
      List<ResponseModel> numberOfIssueForToseeEttelaatVaErtebatatITSazaCo = List<ResponseModel>.from(l4.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l4.length ; i++){
        intNumberOfIssueForToseeEttelaatVaErtebatatITSazaCo = intNumberOfIssueForToseeEttelaatVaErtebatatITSazaCo + numberOfIssueForToseeEttelaatVaErtebatatITSazaCo[i].count!;
      }

      final responseNumberOfIssueForKiyakushanAriyaCo = await numberOfIssuesRepository.getNumberOfIssueForKiyakushanAriyaCo(event.startDate, event.endDate);
      Iterable l5 = json.decode(responseNumberOfIssueForKiyakushanAriyaCo.body);
      List<ResponseModel> numberOfIssueForKiyakushanAriyaCo = List<ResponseModel>.from(l5.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l5.length ; i++){
        intNumberOfIssueForKiyaHushanAriyaCo = intNumberOfIssueForKiyaHushanAriyaCo + numberOfIssueForKiyakushanAriyaCo[i].count!;
      }

      final responseNumberOfIssueForToseeNovinHamrahKishCo = await numberOfIssuesRepository.getNumberOfIssueForToseeNovinHamrahKishCo(event.startDate, event.endDate);
      Iterable l6 = json.decode(responseNumberOfIssueForToseeNovinHamrahKishCo.body);
      List<ResponseModel> numberOfIssueForToseeNovinHamrahKishCo = List<ResponseModel>.from(l6.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l6.length ; i++){
        intNumberOfIssueForToseeNovinHamrahKishCo = intNumberOfIssueForToseeNovinHamrahKishCo + numberOfIssueForToseeNovinHamrahKishCo[i].count!;
      }

      final responseNumberOfIssueForTabanAtiPardazCo = await numberOfIssuesRepository.getNumberOfIssueForTabanAtiPardazCo(event.startDate, event.endDate);
      Iterable l7 = json.decode(responseNumberOfIssueForTabanAtiPardazCo.body);
      List<ResponseModel> numberOfIssueForTabanAtiPardazCo = List<ResponseModel>.from(l7.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l7.length ; i++){
        intNumberOfIssueForTabanAtiPardazCo = intNumberOfIssueForTabanAtiPardazCo + numberOfIssueForTabanAtiPardazCo[i].count!;
      }

      final responseNumberOfIssueForZherfAndishanHushmandDibaRayanCo = await numberOfIssuesRepository.getNumberOfIssueForZherfAndishanHushmandDibaRayanCo(event.startDate, event.endDate);
      Iterable l8 = json.decode(responseNumberOfIssueForZherfAndishanHushmandDibaRayanCo.body);
      List<ResponseModel> numberOfIssueForZherfAndishanHushmandDibaRayanCo = List<ResponseModel>.from(l8.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l8.length ; i++){
        intNumberOfIssueForZherfAndishanHushmandDibaRayanCo = intNumberOfIssueForZherfAndishanHushmandDibaRayanCo + numberOfIssueForZherfAndishanHushmandDibaRayanCo[i].count!;
      }

      final responseNumberOfIssueForPardazeshEttelaatMaliPartCo = await numberOfIssuesRepository.getNumberOfIssueForPardazeshEttelaatMaliPartCoFanar(event.startDate, event.endDate);
      Iterable l9 = json.decode(responseNumberOfIssueForPardazeshEttelaatMaliPartCo.body);
      List<ResponseModel> numberOfIssueForPardazeshEttelaatMaliPartCo = List<ResponseModel>.from(l9.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l9.length ; i++){
        intNumberOfIssueForPardazeshEttelaatMaliPartCo = intNumberOfIssueForPardazeshEttelaatMaliPartCo + numberOfIssueForPardazeshEttelaatMaliPartCo[i].count!;
      }

      final responseNumberOfIssueForBankTejaratCo = await numberOfIssuesRepository.getNumberOfIssueForBankTejaratCoFanar(event.startDate, event.endDate);
      Iterable l10 = json.decode(responseNumberOfIssueForBankTejaratCo.body);
      List<ResponseModel> numberOfIssueForBankTejaratCo = List<ResponseModel>.from(l10.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l10.length ; i++){
        intNumberOfIssueForBankTejaratCo = intNumberOfIssueForBankTejaratCo + numberOfIssueForBankTejaratCo[i].count!;
      }

      final responseNumberOfIssueForPishgamanEtemadDijitalIraniyanCo = await numberOfIssuesRepository.getNumberOfIssueForPishgamanEtemadDijitalIraniyanCo(event.startDate, event.endDate);
      Iterable l11 = json.decode(responseNumberOfIssueForPishgamanEtemadDijitalIraniyanCo.body);
      List<ResponseModel> numberOfIssueForPishgamanEtemadDijitalIraniyanCo = List<ResponseModel>.from(l11.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l11.length ; i++){
        intNumberOfIssueForPishgamanEtemadDijitalIraniyanCo = intNumberOfIssueForPishgamanEtemadDijitalIraniyanCo + numberOfIssueForPishgamanEtemadDijitalIraniyanCo[i].count!;
      }

      final responseNumberOfIssueForFanAvaranEtemadRaahbarCo = await numberOfIssuesRepository.getNumberOfIssueForFanAvaranEtemadRaahbarCo(event.startDate, event.endDate);
      Iterable l12 = json.decode(responseNumberOfIssueForFanAvaranEtemadRaahbarCo.body);
      List<ResponseModel> numberOfIssueForFanAvaranEtemadRaahbarCo = List<ResponseModel>.from(l12.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l12.length ; i++){
        intNumberOfIssueForFanAvaranEtemadRaahbarCo = intNumberOfIssueForFanAvaranEtemadRaahbarCo + numberOfIssueForFanAvaranEtemadRaahbarCo[i].count!;
      }

      final responseNumberOfIssueForGrouhTejaratElectronicSadraKiyanCo = await numberOfIssuesRepository.getNumberOfIssueForGrouhTejaratElectronicSadraKiyantCo(event.startDate, event.endDate);
      Iterable l13 = json.decode(responseNumberOfIssueForGrouhTejaratElectronicSadraKiyanCo.body);
      List<ResponseModel> numberOfIssueForGrouhTejaratElectronicSadraKiyanCo = List<ResponseModel>.from(l13.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l13.length ; i++){
        intNumberOfIssueForGrouhTejaratElectronicSadraKiyanCo = intNumberOfIssueForGrouhTejaratElectronicSadraKiyanCo + numberOfIssueForGrouhTejaratElectronicSadraKiyanCo[i].count!;
      }

      final responseNumberOfIssueForFinTekParsCo = await numberOfIssuesRepository.getNumberOfIssueForFinTekParsCo(event.startDate, event.endDate);
      Iterable l14 = json.decode(responseNumberOfIssueForFinTekParsCo.body);
      List<ResponseModel> numberOfIssueForFinTekParsCo = List<ResponseModel>.from(l14.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l14.length ; i++){
        intNumberOfIssueForFinTekParsCo = intNumberOfIssueForFinTekParsCo + numberOfIssueForFinTekParsCo[i].count!;
      }

      final responseNumberOfIssueForTejaratElectronicRahbordEidealAminCo = await numberOfIssuesRepository.getNumberOfIssueForTejaratElectronicRahbordEidealAminCo(event.startDate, event.endDate);
      Iterable l15 = json.decode(responseNumberOfIssueForTejaratElectronicRahbordEidealAminCo.body);
      List<ResponseModel> numberOfIssueForTejaratElectronicRahbordEidealAminCo = List<ResponseModel>.from(l15.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l15.length ; i++){
        intNumberOfIssueForTejaratElectronicRahbordEidealAminCo = intNumberOfIssueForTejaratElectronicRahbordEidealAminCo + numberOfIssueForTejaratElectronicRahbordEidealAminCo[i].count!;
      }

      final responseNumberOfIssueForFanavaranElectronicHoviyatAmnCo = await numberOfIssuesRepository.getNumberOfIssueForFanavaranHoviyatElectroniciAmnCo(event.startDate, event.endDate);
      Iterable l16 = json.decode(responseNumberOfIssueForFanavaranElectronicHoviyatAmnCo.body);
      List<ResponseModel> numberOfIssueForFanavaranElectronicHoviyatAmnCo = List<ResponseModel>.from(l16.map((model)=> ResponseModel.fromJson(model)));
      for(int i = 0; i < l16.length ; i++){
        intNumberOfIssueForFanavaranElectronicHoviyatAmnCo = intNumberOfIssueForFanavaranElectronicHoviyatAmnCo + numberOfIssueForFanavaranElectronicHoviyatAmnCo[i].count!;
      }

      final faanarAllNumberOfIssue = numberOfIssuesRepository.getFanarAllNumberOfIssue(
          intNumberOfIssueForAsrDaneshAfzarCo,
          intNumberOfIssueForToseeTejaratTeniyanCo ,
          intNumberOfIssueForRahkarHushmandAmnCo ,
          intNumberOfIssueForToseeEttelaatVaErtebatatITSazaCo ,
          intNumberOfIssueForKiyaHushanAriyaCo ,
          intNumberOfIssueForToseeNovinHamrahKishCo ,
          intNumberOfIssueForTabanAtiPardazCo ,
          intNumberOfIssueForZherfAndishanHushmandDibaRayanCo ,
          intNumberOfIssueForPardazeshEttelaatMaliPartCo ,
          intNumberOfIssueForBankTejaratCo ,
          intNumberOfIssueForPishgamanEtemadDijitalIraniyanCo ,
          intNumberOfIssueForFanAvaranEtemadRaahbarCo ,
          intNumberOfIssueForGrouhTejaratElectronicSadraKiyanCo,
          intNumberOfIssueForFinTekParsCo,
          intNumberOfIssueForTejaratElectronicRahbordEidealAminCo,
          intNumberOfIssueForFanavaranElectronicHoviyatAmnCo
      );

      await numberOfIssuesRepository.writeFanarAllNumberOfIssues(event.startDate, event.endDate, faanarAllNumberOfIssue);

      final fanarRaList = numberOfIssuesRepository.fanarRaList(
          intNumberOfIssueForAsrDaneshAfzarCo,
          intNumberOfIssueForToseeTejaratTeniyanCo ,
          intNumberOfIssueForRahkarHushmandAmnCo ,
          intNumberOfIssueForToseeEttelaatVaErtebatatITSazaCo ,
          intNumberOfIssueForKiyaHushanAriyaCo ,
          intNumberOfIssueForToseeNovinHamrahKishCo ,
          intNumberOfIssueForTabanAtiPardazCo ,
          intNumberOfIssueForZherfAndishanHushmandDibaRayanCo ,
          intNumberOfIssueForPardazeshEttelaatMaliPartCo ,
          intNumberOfIssueForBankTejaratCo ,
          intNumberOfIssueForPishgamanEtemadDijitalIraniyanCo ,
          intNumberOfIssueForFanAvaranEtemadRaahbarCo ,
          intNumberOfIssueForGrouhTejaratElectronicSadraKiyanCo,
          intNumberOfIssueForFinTekParsCo,
          intNumberOfIssueForTejaratElectronicRahbordEidealAminCo,
          intNumberOfIssueForFanavaranElectronicHoviyatAmnCo);

      emit(
        state.copyWith(
          status: NumberOfIssuesFanarStatus.success,
          numberOfIssueForAsrDaneshAfzarCo: intNumberOfIssueForAsrDaneshAfzarCo,
          numberOfIssueForToseeTejaratTeniyanCo: intNumberOfIssueForToseeTejaratTeniyanCo,
          numberOfIssueForRahkarHushmandAmnCo: intNumberOfIssueForRahkarHushmandAmnCo,
          numberOfIssueForToseeEttelaatVaErtebatatITSazaCo: intNumberOfIssueForToseeEttelaatVaErtebatatITSazaCo,
          numberOfIssueForKiyakushanAriyaCo: intNumberOfIssueForKiyaHushanAriyaCo,
          numberOfIssueForToseeNovinHamrahKishCo: intNumberOfIssueForToseeNovinHamrahKishCo,
          numberOfIssueForTabanAtiPardazCo: intNumberOfIssueForTabanAtiPardazCo,
          numberOfIssueForZherfAndishanHushmandDibaRayanCo: intNumberOfIssueForZherfAndishanHushmandDibaRayanCo,
          numberOfIssueForPardazeshEttelaatMaliPartCo: intNumberOfIssueForPardazeshEttelaatMaliPartCo,
          numberOfIssueForBankTejaratCo: intNumberOfIssueForBankTejaratCo,
          numberOfIssueForPishgamanEtemadDijitalIraniyanCo: intNumberOfIssueForPishgamanEtemadDijitalIraniyanCo,
          numberOfIssueForFanAvaranEtemadRaahbarCo: intNumberOfIssueForFanAvaranEtemadRaahbarCo,
          numberOfIssueForGrouhTejaratElectronicSadraKiyanCo: intNumberOfIssueForGrouhTejaratElectronicSadraKiyanCo,
          numberOfIssueFinTekParsCo: intNumberOfIssueForFinTekParsCo,
          numberOfIssueForTejaratElectronicRahbordEidealAminCo: intNumberOfIssueForTejaratElectronicRahbordEidealAminCo,
          numberOfIssueForFanavaranElectronicHoviyatAmnCo: intNumberOfIssueForFanavaranElectronicHoviyatAmnCo,
          fanarAllNumberOfIssue: faanarAllNumberOfIssue,
          fanarRaList: fanarRaList
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: NumberOfIssuesFanarStatus.error));
    }
  }

}