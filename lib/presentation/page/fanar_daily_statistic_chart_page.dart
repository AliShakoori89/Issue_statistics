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
      body: Container(
        decoration: const BoxDecoration(
            gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  AppColors.contentColorBlue,
                  AppColors.backgroundColor
                ])
        ),
        child: Container(
          margin: EdgeInsets.only(
              left: width / 30,
              right: width / 30,
              top: height / 100,
              bottom: height / 30
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios,
                      color: Colors.white),
                  Text('نمودار مراکز صدور گواهی شرکت فنار',
                  style: TextStyle(color: Colors.white,
                  fontSize: 18),)
                ],
              ),
              SizedBox(height: height / 10,),
              FanarDailyBarChart(fanarRaList: fanarRaList),
              SizedBox(height: height / 6,),
              FanarPieDailyChart(fanarRaList: fanarRaList,)
            ],
          ),
        ),
      ),
    );
  }
}
