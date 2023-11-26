import 'dart:async';
import 'dart:convert';
import '../../presentation/networking/api_base_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';


class NumberOfIssuesRepository {

  ApiBaseHelper api = ApiBaseHelper();

  FutureOr<dynamic> getNumberOfIssuesForAsrDaneshAfzarCo(String startDate, String endDate) async {
      var body = jsonEncode({"reportkey":"0S2DXd7ISt3nGSL8DqSi+zKpMA0=","customercode":"10101586520",
        "startdate":startDate,"enddate":endDate,"type":"PerCA"});
      var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
      print(response.body);
      return response;
    }

  FutureOr<dynamic> getNumberOfIssuesForToseTejaratElectronicTenianCo(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"0j0UVtan1zl+TOzFJioZemMx93A=","customercode":"10320408934",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  FutureOr<dynamic> getNumberOfIssueForRahkarHushmandAmnCo(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"z86QSWd3EsgwuyZHO1bTnLWlTgU=","customercode":"14008132883",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  FutureOr<dynamic> getNumberOfIssueForToseeEttelaatVaErtebatatITSazaCo(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"viqwUtP89+ywIk7D9qkOHi4HPV0=","customercode":"14008019700",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  FutureOr<dynamic> getNumberOfIssueForKiyakushanAriyaCo(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"viqwUtP89+ywIk7D9qkOHi4HPV0=","customercode":"14008019700",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  FutureOr<dynamic> getNumberOfIssueForToseeNovinHamrahKishCo(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"z/VbuOIyV9FaKmppGB9F/z6PAzA=","customercode":"14008335076",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  FutureOr<dynamic> getNumberOfIssueForTabanAtiPardazCo(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"QRV8GKfQSCEQ3GIT+rGEV/xAOe4=","customercode":"14007345928",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  FutureOr<dynamic> getNumberOfIssueForZherfAndishanHushmandDibaRayanCo(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"C587lmNrh1B0zkcAQNfXXvL1Xlg=","customercode":"14010464575",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  FutureOr<dynamic> getNumberOfIssueForPardazeshEttelaatMaliPartCoFanar(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"4b8ngUfvEnA/4AiSB76+kqz2Ztk=","customercode":"10320874334",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  FutureOr<dynamic> getNumberOfIssueForBankTejaratCoFanar(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"fpLNU2BPeWZE0lNdK/FfeqAXcn4=","customercode":"10100834460",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  FutureOr<dynamic> getNumberOfIssueForPishgamanEtemadDijitalIraniyanCo(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"TE6SEHJpXLkbAZROFmp8twK/W00=","customercode":"14010501932",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  FutureOr<dynamic> getNumberOfIssueForFanAvaranEtemadRaahbarCo(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"l3oRfI3cGMlQhHF5kaLWXReqH3o=","customercode":"10320475120",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  FutureOr<dynamic> getNumberOfIssueForGrouhTejaratElectronicSadraKiyantCo(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"pkN/N16Iatf/QxXPMzxjmBsGQBI=","customercode":"14116082877",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  FutureOr<dynamic> getNumberOfIssueForFinTekParsCo(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"YhbM9AQp1oNKcVSNCOe+UUcDnNY=","customercode":"14007651115",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  FutureOr<dynamic> getNumberOfIssueForTejaratElectronicRahbordEidealAminCo(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"y9Bp5ZBhOzCKa2nq5jQ5sbfFoUQ==","customercode":"14009655202",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  int getFanarAllNumberOfIssue(
      int? numberOfIssueForFanAvaranEtemadRaahbarCoCount,
      int? numberOfIssueForPishgamanEtemadDijitalIraniyanCoCount,
      int? numberOfIssueForBankTejaratCoCountFanar,
      int? numberOfIssueForPardazeshEttelaatMaliPartCoCountFanar,
      int? numberOfIssueForZherfAndishanHushmandDibaRayanCoCount,
      int? numberOfIssueForTabanAtiPardazCoCount,
      int? numberOfIssueForToseeNovinHamrahKishCoCount,
      int? numberOfIssueForKiyakushanAriyaCoCount,
      int? numberOfIssueForToseeEttelaatVaErtebatatITSazaCoCount,
      int? numberOfIssueForRahkarHushmandAmnCoCount,
      int? numberOfIssueForToseeTejaratTeniyanCoCount,
      int? numberOfIssueForAsrDaneshAfzarCoCount,
      int? numberOfIssueForGrouhTejaratElectronicSadraKiyanCount,
      int? numberOfIssueForFinTekParsCount,
      int? numberOfIssueForTejaratElectronicRahbordEidealAminCo) {
    int sum = numberOfIssueForFanAvaranEtemadRaahbarCoCount! +
        numberOfIssueForPishgamanEtemadDijitalIraniyanCoCount! +
        numberOfIssueForBankTejaratCoCountFanar! +
        numberOfIssueForPardazeshEttelaatMaliPartCoCountFanar! +
        numberOfIssueForZherfAndishanHushmandDibaRayanCoCount! +
        numberOfIssueForTabanAtiPardazCoCount! +
        numberOfIssueForToseeNovinHamrahKishCoCount! +
        numberOfIssueForKiyakushanAriyaCoCount! +
        numberOfIssueForToseeEttelaatVaErtebatatITSazaCoCount! +
        numberOfIssueForRahkarHushmandAmnCoCount! +
        numberOfIssueForToseeTejaratTeniyanCoCount! +
        numberOfIssueForAsrDaneshAfzarCoCount! +
        numberOfIssueForGrouhTejaratElectronicSadraKiyanCount! +
        numberOfIssueForFinTekParsCount! +
        numberOfIssueForTejaratElectronicRahbordEidealAminCo!;

    return sum;
  }

  List fanarRaList (
      int? numberOfIssueForAsrDaneshAfzarCoCount,
      int? numberOfIssueForToseeTejaratTeniyanCoCount,
      int? numberOfIssueForRahkarHushmandAmnCoCount,
      int? numberOfIssueForToseeEttelaatVaErtebatatITSazaCoCount,
      int? numberOfIssueForKiyakushanAriyaCoCount,
      int? numberOfIssueForToseeNovinHamrahKishCoCount,
      int? numberOfIssueForTabanAtiPardazCoCount,
      int? numberOfIssueForZherfAndishanHushmandDibaRayanCoCount,
      int? numberOfIssueForPardazeshEttelaatMaliPartCoCountFanar,
      int? numberOfIssueForBankTejaratCoCountFanar,
      int? numberOfIssueForPishgamanEtemadDijitalIraniyanCoCount,
      int? numberOfIssueForFanAvaranEtemadRaahbarCoCount,
      int? numberOfIssueForGrouhTejaratElectronicSadraKiyanCount,
      int? numberOfIssueForFinTekParsCount,
      int? numberOfIssueForTejaratElectronicRahbordEidealAminCo){

    List fanarRaList = [];

    fanarRaList.add(numberOfIssueForAsrDaneshAfzarCoCount);
    fanarRaList.add(numberOfIssueForToseeTejaratTeniyanCoCount);
    fanarRaList.add(numberOfIssueForRahkarHushmandAmnCoCount);
    fanarRaList.add(numberOfIssueForToseeEttelaatVaErtebatatITSazaCoCount);
    fanarRaList.add(numberOfIssueForKiyakushanAriyaCoCount);
    fanarRaList.add(numberOfIssueForToseeNovinHamrahKishCoCount);
    fanarRaList.add(numberOfIssueForTabanAtiPardazCoCount);
    fanarRaList.add(numberOfIssueForZherfAndishanHushmandDibaRayanCoCount);
    fanarRaList.add(numberOfIssueForPardazeshEttelaatMaliPartCoCountFanar);
    fanarRaList.add(numberOfIssueForBankTejaratCoCountFanar);
    fanarRaList.add(numberOfIssueForPishgamanEtemadDijitalIraniyanCoCount);
    fanarRaList.add(numberOfIssueForFanAvaranEtemadRaahbarCoCount);
    fanarRaList.add(numberOfIssueForGrouhTejaratElectronicSadraKiyanCount);
    fanarRaList.add(numberOfIssueForFinTekParsCount);
    fanarRaList.add(numberOfIssueForTejaratElectronicRahbordEidealAminCo);


    return fanarRaList;
  }

  List pendarRaList (
      int? numberOfIssueForPardazeshEttelaatMaliPartCoCountPendar,
      int? numberOfIssueForBankTejaratCoCountPendar,
      int? numberOfIssueForBankParsianDibaRayanCoCount,
      int? numberOfIssueForShabakeKaranSamaCoCount,
      int? numberOfIssueForFanavariVaRahHalhayeHushmandSepehrCoCount,
      int? numberOfIssueForBankMellatCoCount,
      int? numberOfIssueForTataCo,
      int? numberOfIssueForSimorghTejaratCo){

    List pendarRaList = [];

    pendarRaList.add(numberOfIssueForPardazeshEttelaatMaliPartCoCountPendar);
    pendarRaList.add(numberOfIssueForBankTejaratCoCountPendar);
    pendarRaList.add(numberOfIssueForBankParsianDibaRayanCoCount);
    pendarRaList.add(numberOfIssueForShabakeKaranSamaCoCount);
    pendarRaList.add(numberOfIssueForFanavariVaRahHalhayeHushmandSepehrCoCount);
    pendarRaList.add(numberOfIssueForBankMellatCoCount);
    pendarRaList.add(numberOfIssueForTataCo);
    pendarRaList.add(numberOfIssueForSimorghTejaratCo);

    return pendarRaList;
  }

  //********************************************************************************

  FutureOr<dynamic> getNumberOfIssueForPardazeshEttelaatMaliPartCoPendar(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"4b8ngUfvEnA/4AiSB76+kqz2Ztk=","customercode":"10320874334",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.pki.co.ir/api/IssuingReport", body);
    return response;
  }

  FutureOr<dynamic> getNumberOfIssueForBankTejaratCoPendar(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"fpLNU2BPeWZE0lNdK/FfeqAXcn4=","customercode":"10100834460",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.pki.co.ir/api/IssuingReport", body);
    return response;
  }

  FutureOr<dynamic> getNumberOfIssueForBankParsianCo(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"GPeiwBmRp6rshYiNDrL2mdBhsoY=","customercode":"10102203401",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.pki.co.ir/api/IssuingReport", body);
    return response;
  }

  FutureOr<dynamic> getNumberOfIssueForShabakeKaranSamaCo(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"SsQlkXfyG372NSpiagJZUSD6U84=","customercode":"14005082159",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.pki.co.ir/api/IssuingReport", body);
    return response;
  }

  FutureOr<dynamic> getFanavariVaRahHalhayeHushmandSepehrCo(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"G1T8lcl3llsvBdMip0otcGi4xHM=","customercode":"14005371250",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.pki.co.ir/api/IssuingReport", body);
    return response;
  }

  FutureOr<dynamic> getNumberOfIssueForBankMellat(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"u39ttGp4ayh9aKDP5En0W7Ykgh4=","customercode":"10100834967",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.pki.co.ir/api/IssuingReport", body);
    return response;
  }

  FutureOr<dynamic> getNumberOfIssueForTataCo(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"CQnD7n7pso7BHamsszIkeclglX4=","customercode":"14003888568",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.pki.co.ir/api/IssuingReport", body);
    return response;
  }

  FutureOr<dynamic> getNumberOfIssueForSimorghTejaratCo(String startDate, String endDate) async {
    var body = jsonEncode({"reportkey":"t0ndZfTHBnruM4a2XkXdQWw350I=","customercode":"10320747147",
      "startdate":startDate,"enddate":endDate,"type":"PerCA"});
    var response = await api.post("https://api.pki.co.ir/api/IssuingReport", body);
    return response;
  }

  int getPendarAllNumberOfIssue(
      int? numberOfIssueForPardazeshMaliPartCoCountPendar,
      int? numberOfIssueForBankTejaratCoCountPendar,
      int? numberOfIssueForBankParsiyanCoCount,
      int? numberOfIssueForShabakeKaranSamaCoCount,
      int? numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCoCount,
      int? numberOfIssueForBankMellatCount,
      int? numberOfIssueForTataCo,
      int? numberOfIssueForSimorghTejaratCo){
    int sum = numberOfIssueForPardazeshMaliPartCoCountPendar! +
        numberOfIssueForBankTejaratCoCountPendar! +
        numberOfIssueForBankParsiyanCoCount! +
        numberOfIssueForShabakeKaranSamaCoCount! +
        numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCoCount! +
        numberOfIssueForBankMellatCount! +
        numberOfIssueForTataCo! +
        numberOfIssueForSimorghTejaratCo!;

    return sum;
  }

  writePendarAllNumberOfIssues(String startDate, String endDate, int pendarAllNumberOfIssue) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('WritePendarAllNumberOfIssues$startDate$endDate', pendarAllNumberOfIssue);
  }

  writeFanarAllNumberOfIssues(String startDate, String endDate, int fanarAllNumberOfIssue) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('WriteFanarAllNumberOfIssues$startDate$endDate', fanarAllNumberOfIssue);
  }
}