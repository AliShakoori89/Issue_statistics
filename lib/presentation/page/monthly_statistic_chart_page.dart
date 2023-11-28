import 'package:flutter/material.dart';
import 'package:issue_statistics/presentation/bloc/monthly_chart/bloc.dart';
import 'package:issue_statistics/presentation/bloc/monthly_chart/state.dart';
import 'package:issue_statistics/presentation/page_helpers/const/app_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/monthly_chart/event.dart';

class MonthlyChart extends StatefulWidget {
  const MonthlyChart({super.key});

  @override
  State<MonthlyChart> createState() => _MonthlyChartState();
}

class _MonthlyChartState extends State<MonthlyChart> {
  
  int currentHorizontalIntValue = 1402;

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
        body: Container(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NumberPicker(
                value: currentHorizontalIntValue,
                minValue: 1401,
                maxValue: 1450,
                step: 1,
                itemHeight: 100,
                axis: Axis.horizontal,
                onChanged: (value) =>
                    setState((){
                      currentHorizontalIntValue = value;
                      BlocProvider.of<MonthlyChartBloc>(context)
                          .add(MonthlyIssuePerYearEvent(
                          year: currentHorizontalIntValue.toString()));
                    }),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black26),
                ),
              ),
              BlocBuilder<MonthlyChartBloc, MonthlyChartState>(
              builder: (context, state) {

                print("sssssssssss                       "+state.azarIssues.toString());
                print("sssssssssss                       "+state.abanIssues.toString());
                print("sssssssssss                       "+state.tirIssues.toString());

                return SfCartesianChart(
                  // Initialize category axis
                    primaryXAxis: CategoryAxis(
                        labelRotation: 90
                    ),

                    series: <LineSeries<SalesData, String>>[
                      LineSeries<SalesData, String>(

                        // Bind data source
                          dataSource:  <SalesData>[
                            SalesData('فروردین', state.farvardinIssues),
                            SalesData('اردیبهشت', state.ordibeheshtIssues),
                            SalesData('خرداد',state.khordadIssues),
                            SalesData('تیر', state.tirIssues),
                            SalesData('مرداد', state.mordadIssues),
                            SalesData('شهریور', state.shahrivarIssues),
                            SalesData('مهر', state.mehrIssues),
                            SalesData('آبان', state.abanIssues),
                            SalesData('آذر', state.azarIssues),
                            SalesData('دی', state.deyIssues),
                            SalesData('بهمن', state.bahmanIssues),
                            SalesData('اسفند', state.esfandIssues),
                          ],
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales
                      )
                    ]
                );

              }),
            ],
          )
        )
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}