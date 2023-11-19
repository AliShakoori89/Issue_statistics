import 'package:flutter/material.dart';
import 'package:issue_statistics/presentation/page_helpers/app_colors.dart';
import '../page_helpers/daily_issue_chart.dart';
import '../page_helpers/pie_chart.dart';

class MonthlyStatisticChartPage extends StatelessWidget {
  const MonthlyStatisticChartPage({super.key});

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
            const BarChartSample3(),
            SizedBox(height: height / 4,),
            Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: const PieChartSample2())
          ],
        ),
      ),
    );
  }
}
