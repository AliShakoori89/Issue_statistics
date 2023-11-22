import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../const/app_colors.dart';

class PendarPieDailyChart extends StatefulWidget {
  final List pendarRaList;
  final int pendarIssues;
  const PendarPieDailyChart({super.key, required this.pendarRaList,
  required this.pendarIssues});

  @override
  State<StatefulWidget> createState() => PendarPieDailyChartState(pendarRaList, pendarIssues);
}

class PendarPieDailyChartState extends State {
  int touchedIndex = -1;
  final List pendarRaList;
  final int pendarIssues;


  PendarPieDailyChartState(this.pendarRaList, this.pendarIssues);


  @override
  Widget build(BuildContext context) {

    return AspectRatio(
      aspectRatio: 1.5,
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
            touchCallback: (FlTouchEvent event, pieTouchResponse) {
              setState(() {
                if (!event.isInterestedForInteractions ||
                    pieTouchResponse == null ||
                    pieTouchResponse.touchedSection == null) {
                  touchedIndex = -1;
                  return;
                }
                touchedIndex = pieTouchResponse
                    .touchedSection!.touchedSectionIndex;
              });
            },
          ),
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 5,
          centerSpaceRadius: 40,
          sections: showingSections(),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {

    int sum =
        pendarRaList[0] +
            pendarRaList[1] +
            pendarRaList[2] +
            pendarRaList[3] +
            pendarRaList[4] +
            pendarRaList[5] +
            pendarIssues;

    return List.generate(7, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.contentColorBlue,
            value: double.parse((int.parse(pendarRaList[0].toString()) * 100 / sum).toStringAsFixed(2)),
            title: '${double.parse((int.parse(pendarRaList[0].toString()) * 100 / sum).toStringAsFixed(2))}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.contentColorBlack,
            value: double.parse((int.parse(pendarRaList[1].toString()) * 100 / sum).toStringAsFixed(2)),
            title: '${double.parse((int.parse(pendarRaList[1].toString()) * 100 / sum).toStringAsFixed(2))}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.contentColorGreen,
            value: double.parse((int.parse(pendarRaList[2].toString()) * 100 / sum).toStringAsFixed(2)),
            title: '${double.parse((int.parse(pendarRaList[2].toString()) * 100 / sum).toStringAsFixed(2))}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: AppColors.contentColorOrange,
            value: double.parse((int.parse(pendarRaList[3].toString()) * 100 / sum).toStringAsFixed(2)),
            title: '${double.parse((int.parse(pendarRaList[3].toString()) * 100 / sum).toStringAsFixed(2))}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 4:
          return PieChartSectionData(
            color: AppColors.contentColorPink,
            value: double.parse((int.parse(pendarRaList[4].toString()) * 100 / sum).toStringAsFixed(2)),
            title: '${double.parse((int.parse(pendarRaList[4].toString()) * 100 / sum).toStringAsFixed(2))}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 5:
          return PieChartSectionData(
            color: AppColors.contentColorPurple,
            value: double.parse((int.parse(pendarRaList[5].toString()) * 100 / sum).toStringAsFixed(2)),
            title: '${double.parse((int.parse(pendarRaList[5].toString()) * 100 / sum).toStringAsFixed(2))}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 6:
          return PieChartSectionData(
            color: AppColors.contentColorRed,
            value: double.parse((int.parse(pendarIssues.toString()) * 100 / sum).toStringAsFixed(2)),
            title: '${double.parse((int.parse(pendarIssues.toString()) * 100 / sum).toStringAsFixed(2))}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}