import 'package:flutter/material.dart';
import 'package:issue_statistics/presentation/page_helpers/const/app_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:numberpicker/numberpicker.dart';

class MonthlyChart extends StatefulWidget {
  const MonthlyChart({super.key});

  @override
  State<MonthlyChart> createState() => _MonthlyChartState();
}

class _MonthlyChartState extends State<MonthlyChart> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    int _currentHorizontalIntValue = 1402;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
        body: Container(
          margin: EdgeInsets.only(
            top: height / 10,
            left: 20,
            right: 20,
            bottom: height / 10,
          ),
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NumberPicker(
                value: _currentHorizontalIntValue,
                minValue: 1401,
                maxValue: 1450,
                step: 1,
                itemHeight: 100,
                axis: Axis.horizontal,
                onChanged: (value) =>
                    setState(() => _currentHorizontalIntValue = value),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black26),
                ),
              ),
              SfCartesianChart(
                // Initialize category axis
                  primaryXAxis: CategoryAxis(
                      labelRotation: 90
                  ),

                  series: <LineSeries<SalesData, String>>[
                    LineSeries<SalesData, String>(

                      // Bind data source
                        dataSource:  <SalesData>[
                          SalesData('فروردین', 35),
                          SalesData('اردیبهشت', 28),
                          SalesData('خرداد', 34),
                          SalesData('تیر', 32),
                          SalesData('مرداد', 40),
                          SalesData('شهریور', 40),
                          SalesData('مهر', 40),
                          SalesData('آبان', 40),
                          SalesData('آذر', 40),
                          SalesData('دی', 40),
                          SalesData('بهمن', 40),
                          SalesData('اسفند', 40),
                        ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales
                    )
                  ]
              )

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