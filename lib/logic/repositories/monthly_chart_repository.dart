import '../../data/data_base/data_base.dart';

class MonthlyChartRepository {

  late final DatabaseHelper helper;

  MonthlyChartRepository() {
    helper = DatabaseHelper();
  }

  getFarvardinIssuePerYear(String year) async{
    print("MonthlyChartRepository     ");
    return await helper.getFarvardinRAIssuePerYear(year);
  }

  getOrdibeheshtIssuePerYear(String year) async{
    return await helper.getOrdibeheshtRAIssuePerYear(year);
  }

  getKhordadIssuePerYear(String year) async{
    return await helper.getKhordadRAIssuePerYear(year);
  }

  getTirIssuePerYear(String year) async{
    return await helper.getTirRAIssuePerYear(year);
  }

  getMordadIssuePerYear(String year) async{
    return await helper.getMordadRAIssuePerYear(year);
  }

  getShahrivarIssuePerYear(String year) async{
    return await helper.getShahrivarRAIssuePerYear(year);
  }

  getMehrIssuePerYear(String year) async{
    return await helper.getMehrRAIssuePerYear(year);
  }

  getAbanIssuePerYear(String year) async{
    return await helper.getAbanRAIssuePerYear(year);
  }

  getAzarIssuePerYear(String year) async{
    return await helper.getAzarRAIssuePerYear(year);
  }

  getDeyIssuePerYear(String year) async{
    return await helper.getDeyRAIssuePerYear(year);
  }

  getBahmanIssuePerYear(String year) async{
    return await helper.getBahmanRAIssuePerYear(year);
  }

  getEsfandIssuePerYear(String year) async{
    return await helper.getEsfandRAIssuePerYear(year);
  }

}