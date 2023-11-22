import 'package:flutter/material.dart';
import 'package:issue_statistics/presentation/page_helpers/const/app_colors.dart';
import '../page_helpers/chart/fanar_daily_issue_bar_chart.dart';
import '../page_helpers/chart/fanar_daily_issue_pie_chart.dart';

class FanarDailyStatisticChartPage extends StatelessWidget {

  final List fanarRaList;
  const FanarDailyStatisticChartPage({super.key, required this.fanarRaList});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: const Align(
            alignment: Alignment.centerRight,
            child: Text("نمودار صدور گواهی روزانه")),
        titleTextStyle: TextStyle(
          fontSize: 15
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: width / 30,
          right: width / 30,
          top: height / 100,
          bottom: height / 30
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("مراکز صدور شرکت فنار",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: width / 22),),
            SizedBox(height: height / 50,),
            FanarDailyBarChart(fanarRaList: fanarRaList),
            SizedBox(height: height / 4,),
            FanarPieDailyChart(fanarRaList: fanarRaList,)
          ],
        ),
      ),
    );
  }
}
