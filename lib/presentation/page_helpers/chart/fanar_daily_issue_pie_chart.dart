import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../const/app_colors.dart';

class FanarPieDailyChart extends StatefulWidget {
  final List fanarRaList;
  const FanarPieDailyChart({super.key, required this.fanarRaList});

  @override
  State<StatefulWidget> createState() => FanarPieDailyChartState(fanarRaList);
}

class FanarPieDailyChartState extends State {
  int touchedIndex = -1;
  final List fanarRaList;

  FanarPieDailyChartState(this.fanarRaList);


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
        fanarRaList[0] +
            fanarRaList[1] +
            fanarRaList[2] +
           fanarRaList[3] +
            fanarRaList[4] +
            fanarRaList[5] +
            fanarRaList[6] +
            fanarRaList[7] +
            fanarRaList[8]+
            fanarRaList[9] +
            fanarRaList[10] +
            fanarRaList[11] +
            fanarRaList[12]+
            fanarRaList[13] ;

    return List.generate(13, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.contentColorBlue,
            value: double.parse((int.parse(fanarRaList[0].toString()) * 100 / sum).toStringAsFixed(2)),
            title: '${double.parse((int.parse(fanarRaList[0].toString()) * 100 / sum).toStringAsFixed(2))}%',
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
            value: double.parse((int.parse(fanarRaList[1].toString()) * 100 / sum).toStringAsFixed(2)),
            title: '${double.parse((int.parse(fanarRaList[1].toString()) * 100 / sum).toStringAsFixed(2))}%',
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
            value: double.parse((int.parse(fanarRaList[2].toString()) * 100 / sum).toStringAsFixed(2)),
            title: '${double.parse((int.parse(fanarRaList[2].toString()) * 100 / sum).toStringAsFixed(2))}%',
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
            value: double.parse((int.parse(fanarRaList[3].toString()) * 100 / sum).toStringAsFixed(2)),
            title: '${double.parse((int.parse(fanarRaList[3].toString()) * 100 / sum).toStringAsFixed(2))}%',
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
            value: double.parse((int.parse(fanarRaList[4].toString()) * 100 / sum).toStringAsFixed(2)),
            title: '${double.parse((int.parse(fanarRaList[4].toString()) * 100 / sum).toStringAsFixed(2))}%',
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
            value: double.parse((int.parse(fanarRaList[5].toString()) * 100 / sum).toStringAsFixed(2)),
            title: '${double.parse((int.parse(fanarRaList[5].toString()) * 100 / sum).toStringAsFixed(2))}%',
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
            value: double.parse((int.parse(fanarRaList[6].toString()) * 100 / sum).toStringAsFixed(2)),
            title: '${double.parse((int.parse(fanarRaList[6].toString()) * 100 / sum).toStringAsFixed(2))}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 7:
          return PieChartSectionData(
            color: AppColors.contentColorGreen,
            value: double.parse((int.parse(fanarRaList[7].toString()) * 100 / sum).toStringAsFixed(2)),
            title: '${double.parse((int.parse(fanarRaList[7].toString()) * 100 / sum).toStringAsFixed(2))}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 8:
          return PieChartSectionData(
            color: AppColors.contentColorNavyBlue,
            value: double.parse((int.parse(fanarRaList[8].toString()) * 100 / sum).toStringAsFixed(2)),
            title: '${double.parse((int.parse(fanarRaList[8].toString()) * 100 / sum).toStringAsFixed(2))}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 9:
          return PieChartSectionData(
            color: AppColors.contentColorLowPurple,
            value: double.parse((int.parse(fanarRaList[9].toString()) * 100 / sum).toStringAsFixed(2)),
            title: '${double.parse((int.parse(fanarRaList[9].toString()) * 100 / sum).toStringAsFixed(2))}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 10:
          return PieChartSectionData(
            color: AppColors.contentColorBrown,
            value: double.parse((int.parse(fanarRaList[10].toString()) * 100 / sum).toStringAsFixed(2)),
            title: '${double.parse((int.parse(fanarRaList[10].toString()) * 100 / sum).toStringAsFixed(2))}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 11:
          return PieChartSectionData(
            color: AppColors.contentColorCyan,
            value: double.parse((int.parse(fanarRaList[11].toString()) * 100 / sum).toStringAsFixed(2)),
            title: '${double.parse((int.parse(fanarRaList[11].toString()) * 100 / sum).toStringAsFixed(2))}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 12:
          return PieChartSectionData(
            color: AppColors.contentColorGreen2,
            value: double.parse((int.parse(fanarRaList[12].toString()) * 100 / sum).toStringAsFixed(2)),
            title: '${double.parse((int.parse(fanarRaList[12].toString()) * 100 / sum).toStringAsFixed(2))}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 13:
          return PieChartSectionData(
            color: AppColors.contentColorLowOrange,
            value: double.parse((int.parse(fanarRaList[13].toString()) * 100 / sum).toStringAsFixed(2)),
            title: '${double.parse((int.parse(fanarRaList[13].toString()) * 100 / sum).toStringAsFixed(2))}%',
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