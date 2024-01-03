import 'package:flutter/material.dart';
import 'package:issue_statistics/presentation/page_helpers/const/app_colors.dart';
import '../page_helpers/chart/pendar_daily_issue_bar_chart.dart';
import '../page_helpers/chart/pendar_daily_issue_pie_chart.dart';

class PendarDailyStatisticChartPage extends StatelessWidget {

  final List pendarRaList;
  final int pendarIssues;
  const PendarDailyStatisticChartPage({super.key, required this.pendarRaList,
  required this.pendarIssues});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  AppColors.contentColorBlue,
                  AppColors.backgroundColor
                ])
        ),
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(
                left: width / 30,
                right: width / 30,
                bottom: height / 30
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_ios,
                          color: Colors.black,
                      size: 15),
                      Text("نمودار مراکز صدور شرکت پندار",
                        style: TextStyle(color: Colors.black,
                            fontSize: 18),)
                    ],
                  ),
                  SizedBox(height: height / 10,),
                  PendarDailyBarChart(pendarRaList: pendarRaList, pendarIssues: pendarIssues),
                  SizedBox(height: height / 4,),
                  PendarPieDailyChart(pendarRaList: pendarRaList, pendarIssues: pendarIssues,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
