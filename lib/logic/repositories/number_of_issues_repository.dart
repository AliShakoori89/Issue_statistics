import 'dart:convert';
import '../../presentation/networking/api_base_helper.dart';


class NumberOfIssuesRepository {

  ApiBaseHelper api = ApiBaseHelper();

  Future<dynamic> getNumberOfIssuesForAsrDaneshAfzarCo(String date) async {
      var body = jsonEncode({"reportkey":"0S2DXd7ISt3nGSL8DqSi+zKpMA0=","customercode":"10101586520",
        "startdate":date,"enddate":date,"type":"PerCA"});
      var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
      print(response.body);
      return response;
    }

  Future<dynamic> getNumberOfIssuesForToseTejaratElectronicTenianCo(String date) async {
    var body = jsonEncode({"reportkey":"0j0UVtan1zl+TOzFJioZemMx93A=","customercode":"10320408934",
      "startdate":date,"enddate":date,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForRahkarHushmandAmnCo(String date) async {
    var body = jsonEncode({"reportkey":"z86QSWd3EsgwuyZHO1bTnLWlTgU=","customercode":"14008132883",
      "startdate":date,"enddate":date,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForToseeEttelaatVaErtebatatITSazaCo(String date) async {
    var body = jsonEncode({"reportkey":"viqwUtP89+ywIk7D9qkOHi4HPV0=","customercode":"14008019700",
      "startdate":date,"enddate":date,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForKiyakushanAriyaCo(String date) async {
    var body = jsonEncode({"reportkey":"viqwUtP89+ywIk7D9qkOHi4HPV0=","customercode":"14008019700",
      "startdate":date,"enddate":date,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForToseeNovinHamrahKishCo(String date) async {
    var body = jsonEncode({"reportkey":"z/VbuOIyV9FaKmppGB9F/z6PAzA=","customercode":"14008335076",
      "startdate":date,"enddate":date,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForTabanAtiPardazCo(String date) async {
    var body = jsonEncode({"reportkey":"QRV8GKfQSCEQ3GIT+rGEV/xAOe4=","customercode":"14007345928",
      "startdate":date,"enddate":date,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForZherfAndishanHushmandDibaRayanCo(String date) async {
    var body = jsonEncode({"reportkey":"C587lmNrh1B0zkcAQNfXXvL1Xlg=","customercode":"14010464575",
      "startdate":date,"enddate":date,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForPardazeshEttelaatMaliPartCoFanar(String date) async {
    var body = jsonEncode({"reportkey":"4b8ngUfvEnA/4AiSB76+kqz2Ztk=","customercode":"10320874334",
      "startdate":date,"enddate":date,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForBankTejaratCoFanar(String date) async {
    var body = jsonEncode({"reportkey":"fpLNU2BPeWZE0lNdK/FfeqAXcn4=","customercode":"10100834460",
      "startdate":date,"enddate":date,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForPishgamanEtemadDijitalIraniyanCo(String date) async {
    var body = jsonEncode({"reportkey":"TE6SEHJpXLkbAZROFmp8twK/W00=","customercode":"14010501932",
      "startdate":date,"enddate":date,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForFanAvaranEtemadRaahbatCo(String date) async {
    var body = jsonEncode({"reportkey":"l3oRfI3cGMlQhHF5kaLWXReqH3o=","customercode":"10320475120",
      "startdate":date,"enddate":date,"type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  int getFanarAllNumberOfIssue(
      int? numberOfIssueForFanAvaranEtemadRaahbatCoCount,
      int? numberOfIssueForPishgamanEtemadDijitalIraniyanCoCount,
      int? numberOfIssueForBankTejaratCoCountFanar,
      int? numberOfIssueForPardazeshEttelaatMaliPartCoCountFanar,
      int? numberOfIssueForZherfAndishanHushmandDibaRayanCoCount,
      int? numberOfIssueForTabanAtiPardazCoCount,
      int? numberOfIssueForToseeNovinHamrahKishCoCount,
      int? numberOfIssueForKiyakushanAriyaCoCount,
      int? numberOfIssueForToseeEttelaatVaErtebatatITSazaCoCount,
      int? numberOfIssueForRahkarHushmandAmnCoCount,
      int? numberOfIssuesForToseeTejaratTeniyanCoCount,
      int? numberOfIssuesForAsrDaneshAfzarCoCount) {
    int sum = numberOfIssueForFanAvaranEtemadRaahbatCoCount! +
        numberOfIssueForPishgamanEtemadDijitalIraniyanCoCount! +
        numberOfIssueForBankTejaratCoCountFanar! +
        numberOfIssueForPardazeshEttelaatMaliPartCoCountFanar! +
        numberOfIssueForZherfAndishanHushmandDibaRayanCoCount! +
        numberOfIssueForTabanAtiPardazCoCount! +
        numberOfIssueForToseeNovinHamrahKishCoCount! +
        numberOfIssueForKiyakushanAriyaCoCount! +
        numberOfIssueForToseeEttelaatVaErtebatatITSazaCoCount! +
        numberOfIssueForRahkarHushmandAmnCoCount! +
        numberOfIssuesForToseeTejaratTeniyanCoCount! +
        numberOfIssuesForAsrDaneshAfzarCoCount!;

    return sum;
  }

  //********************************************************************************

  Future<dynamic> getNumberOfIssueForPardazeshEttelaatMaliPartCoPendar(String date) async {
    var body = jsonEncode({"reportkey":"4b8ngUfvEnA/4AiSB76+kqz2Ztk=","customercode":"10320874334",
      "startdate":date,"enddate":date,"type":"PerCA"});
    var response = await api.post("https://api.pki.co.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForBankTejaratCoPendar(String date) async {
    var body = jsonEncode({"reportkey":"fpLNU2BPeWZE0lNdK/FfeqAXcn4=","customercode":"10100834460",
      "startdate":date,"enddate":date,"type":"PerCA"});
    var response = await api.post("https://api.pki.co.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForBankParsianCo(String date) async {
    var body = jsonEncode({"reportkey":"GPeiwBmRp6rshYiNDrL2mdBhsoY=","customercode":"10102203401",
      "startdate":date,"enddate":date,"type":"PerCA"});
    var response = await api.post("https://api.pki.co.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForShabakeKaranSamaCo(String date) async {
    var body = jsonEncode({"reportkey":"SsQlkXfyG372NSpiagJZUSD6U84=","customercode":"14005082159",
      "startdate":date,"enddate":date,"type":"PerCA"});
    var response = await api.post("https://api.pki.co.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getFanavariVaRahHalhayeHushmandSepehrCo(String date) async {
    var body = jsonEncode({"reportkey":"G1T8lcl3llsvBdMip0otcGi4xHM=","customercode":"14005371250",
      "startdate":date,"enddate":date,"type":"PerCA"});
    var response = await api.post("https://api.pki.co.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForBankMellat(String date) async {
    var body = jsonEncode({"reportkey":"u39ttGp4ayh9aKDP5En0W7Ykgh4=","customercode":"10100834967",
      "startdate":date,"enddate":date,"type":"PerCA"});
    var response = await api.post("https://api.pki.co.ir/api/IssuingReport", body);
    return response;
  }

  int getPendarAllNumberOfIssue(
      int? numberOfIssueForPardazeshMaliPartCoCountPendar,
      int? numberOfIssueForBankTejaratCoCountPendar,
      int? numberOfIssueForBankParsiyanCoCount,
      int? numberOfIssueForShabakeKaranSamaCoCount,
      int? numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCoCount,
      int? numberOfIssueForBankMellatCount){
    int sum = numberOfIssueForPardazeshMaliPartCoCountPendar! +
        numberOfIssueForBankTejaratCoCountPendar! +
        numberOfIssueForBankParsiyanCoCount! +
        numberOfIssueForShabakeKaranSamaCoCount! +
        numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCoCount! +
        numberOfIssueForBankMellatCount!;

    return sum;
  }



}