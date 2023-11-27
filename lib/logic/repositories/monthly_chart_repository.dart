import '../../data/data_base/data_base.dart';

class MonthlyChartRepository {

  late final DatabaseHelper helper;

  MonthlyChartRepository() {
    helper = DatabaseHelper();
  }

  getAllMonthlyIssuePerYear(String year) async{
    return await helper.getMonthlyRAIssuePerYear(year);
  }

}