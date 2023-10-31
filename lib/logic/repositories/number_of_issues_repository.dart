import 'dart:convert';
import '../../presentation/networking/api_base_helper.dart';


class NumberOfIssuesRepository {

  ApiBaseHelper api = ApiBaseHelper();

  Future<dynamic> getNumberOfIssuesForAsrDaneshAfzarCo() async {
      var body = jsonEncode({"reportkey":"0S2DXd7ISt3nGSL8DqSi+zKpMA0=","customercode":"10101586520",
        "startdate":"2023/10/28","enddate":"2023/10/28","type":"PerCA"});
      var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
      print(response.body);
      return response;
    }

  Future<dynamic> getNumberOfIssuesForToseeTejaratTeniyanCo() async {
    var body = jsonEncode({"reportkey":"0j0UVtan1zl+TOzFJioZemMx93A=","customercode":"10320408934",
      "startdate":"2023/10/28","enddate":"2023/10/28","type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForRahkarHushmandAmnCo() async {
    var body = jsonEncode({"reportkey":"z86QSWd3EsgwuyZHO1bTnLWlTgU=","customercode":"14008132883",
      "startdate":"2023/10/28","enddate":"2023/10/28","type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForToseeEttelaatVaErtebatatITSazaCo() async {
    var body = jsonEncode({"reportkey":"viqwUtP89+ywIk7D9qkOHi4HPV0=","customercode":"14008019700",
      "startdate":"2023/10/28","enddate":"2023/10/28","type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForKiyakushanAriyaCo() async {
    var body = jsonEncode({"reportkey":"viqwUtP89+ywIk7D9qkOHi4HPV0=","customercode":"14008019700",
      "startdate":"2023/10/28","enddate":"2023/10/28","type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForToseeNovinHamrahKishCo() async {
    var body = jsonEncode({"reportkey":"z/VbuOIyV9FaKmppGB9F/z6PAzA=","customercode":"14008335076",
      "startdate":"2023/10/28","enddate":"2023/10/28","type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForTabanAtiPardazCo() async {
    var body = jsonEncode({"reportkey":"QRV8GKfQSCEQ3GIT+rGEV/xAOe4=","customercode":"14007345928",
      "startdate":"2023/10/28","enddate":"2023/10/28","type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForZherfAndishanHushmandDibaRayanCo() async {
    var body = jsonEncode({"reportkey":"C587lmNrh1B0zkcAQNfXXvL1Xlg=","customercode":"14010464575",
      "startdate":"2023/10/28","enddate":"2023/10/28","type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForPardazeshEttelaatMaliPartCoFanaar() async {
    var body = jsonEncode({"reportkey":"4b8ngUfvEnA/4AiSB76+kqz2Ztk=","customercode":"10320874334",
      "startdate":"2023/10/28","enddate":"2023/10/28","type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForBankTejaratCoFanaar() async {
    var body = jsonEncode({"reportkey":"fpLNU2BPeWZE0lNdK/FfeqAXcn4=","customercode":"10100834460",
      "startdate":"2023/10/28","enddate":"2023/10/28","type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForPishgamanEtemadDijitalIraniyanCo() async {
    var body = jsonEncode({"reportkey":"TE6SEHJpXLkbAZROFmp8twK/W00=","customercode":"14010501932",
      "startdate":"2023/10/28","enddate":"2023/10/28","type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForFanAvaranEtemadRaahbatCo() async {
    var body = jsonEncode({"reportkey":"l3oRfI3cGMlQhHF5kaLWXReqH3o=","customercode":"10320475120",
      "startdate":"2023/10/28","enddate":"2023/10/28","type":"PerCA"});
    var response = await api.post("https://api.raahbartrust.ir/api/IssuingReport", body);
    return response;
  }

  Future<int> getfaanarAllNumberOfIssue(
      int? numberOfIssueForFanAvaranEtemadRaahbatCoCount,
      int? numberOfIssueForPishgamanEtemadDijitalIraniyanCoCount,
      int? numberOfIssueForBankTejaratCoCount,
      int? numberOfIssueForPardazeshEttelaatMaliPartCoCount,
      int? numberOfIssueForZherfAndishanHushmandDibaRayanCoCount,
      int? numberOfIssueForTabanAtiPardazCoCount,
      int? numberOfIssueForToseeNovinHamrahKishCoCount,
      int? numberOfIssueForKiyakushanAriyaCoCount,
      int? numberOfIssueForToseeEttelaatVaErtebatatITSazaCoCount,
      int? numberOfIssueForRahkarHushmandAmnCoCount,
      int? numberOfIssuesForToseeTejaratTeniyanCoCount,
      int? numberOfIssuesForAsrDaneshAfzarCoCount) async {
    int sum = numberOfIssueForFanAvaranEtemadRaahbatCoCount! +
        numberOfIssueForPishgamanEtemadDijitalIraniyanCoCount! +
        numberOfIssueForBankTejaratCoCount! +
        numberOfIssueForPardazeshEttelaatMaliPartCoCount! +
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

  Future<dynamic> getNumberOfIssueForPardazeshEttelaatMaliPartCoPendar() async {
    var body = jsonEncode({"reportkey":"4b8ngUfvEnA/4AiSB76+kqz2Ztk=","customercode":"10320874334",
      "startdate":"2023/10/28","enddate":"2023/10/28","type":"PerCA"});
    var response = await api.post("https://api.pki.co.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForBankTejaratCoPendar() async {
    var body = jsonEncode({"reportkey":"fpLNU2BPeWZE0lNdK/FfeqAXcn4=","customercode":"10100834460",
      "startdate":"2023/10/28","enddate":"2023/10/28","type":"PerCA"});
    var response = await api.post("https://api.pki.co.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForBankParsianCo() async {
    var body = jsonEncode({"reportkey":"GPeiwBmRp6rshYiNDrL2mdBhsoY=","customercode":"10102203401",
      "startdate":"2023/10/28","enddate":"2023/10/28","type":"PerCA"});
    var response = await api.post("https://api.pki.co.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForShabakeKaranSamaCo() async {
    var body = jsonEncode({"reportkey":"SsQlkXfyG372NSpiagJZUSD6U84=","customercode":"14005082159",
      "startdate":"2023/10/28","enddate":"2023/10/28","type":"PerCA"});
    var response = await api.post("https://api.pki.co.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getFanavariVaRahHalhayeHushmandSepehrCo() async {
    var body = jsonEncode({"reportkey":"G1T8lcl3llsvBdMip0otcGi4xHM=","customercode":"14005371250",
      "startdate":"2023/10/28","enddate":"2023/10/28","type":"PerCA"});
    var response = await api.post("https://api.pki.co.ir/api/IssuingReport", body);
    return response;
  }

  Future<dynamic> getNumberOfIssueForBankMellat() async {
    var body = jsonEncode({"reportkey":"u39ttGp4ayh9aKDP5En0W7Ykgh4=","customercode":"10100834967",
      "startdate":"2023/10/28","enddate":"2023/10/28","type":"PerCA"});
    var response = await api.post("https://api.pki.co.ir/api/IssuingReport", body);
    return response;
  }

  Future<int> getPendarAllNumberOfIssue(
      int? numberOfIssueForPardazeshMaliPartCoCount,
      int? numberOfIssueForBankTejaratCoCount,
      int? numberOfIssueForBankParsiyanCoCount,
      int? numberOfIssueForShabakeKaranSamaCoCount,
      int? numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCoCount,
      int? numberOfIssueForBankMellatCount) async {
    int sum = numberOfIssueForPardazeshMaliPartCoCount! +
        numberOfIssueForBankTejaratCoCount! +
        numberOfIssueForBankParsiyanCoCount! +
        numberOfIssueForShabakeKaranSamaCoCount! +
        numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCoCount! +
        numberOfIssueForBankMellatCount!;

    return sum;
  }
}