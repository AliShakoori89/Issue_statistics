import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../const/app_colors.dart';
import '../const/indicator.dart';

class _BarChart extends StatelessWidget {
  final List pendarRaList;
  final int pendarIssues;

  const _BarChart(this.pendarRaList, this.pendarIssues);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(30),
      child: BarChart(
        BarChartData(
          barTouchData: barTouchData,
          titlesData: titlesData,
          borderData: borderData,
          barGroups: barGroups,
          gridData: const FlGridData(show: false),
          alignment: BarChartAlignment.spaceAround,
          maxY: 15000,
        ),
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
    enabled: false,
    touchTooltipData: BarTouchTooltipData(
      tooltipBgColor: Colors.transparent,
      tooltipPadding: EdgeInsets.zero,
      tooltipMargin: 8,
      getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
          ) {
        return BarTooltipItem(
          rod.toY.round().toString(),
          const TextStyle(
            color: AppColors.contentColorBlack,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    ),
  );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColors.contentColorBlack,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget row;
    switch (value.toInt()) {
      case 0:
        row =
        const Row(
          children: [
            Text('شرکت پردازش اطلاعات مالی پارت (پندار)', style: style),
            SizedBox(width: 5),
            Indicator(
              color: AppColors.contentColorBlue,
              text: '',
              isSquare: true,
            ),
          ],
        );
        break;
      case 1:
        row =
        const Row(
          children: [
            Text('بانک تجارت (پندار)', style: style),
            SizedBox(width: 5),
            Indicator(
              color: AppColors.contentColorBlack,
              text: '',
              isSquare: true,
            ),
          ],
        );
        break;
      case 2:
        row =
        const Row(
          children: [
            Text('بانک پارسیان (دیبا رایان)', style: style),
            SizedBox(width: 5),
            Indicator(
              color: AppColors.contentColorGreen,
              text: '',
              isSquare: true,
            ),
          ],
        );
        break;
      case 3:
        row =
        const Row(
          children: [
            Text('شرکت شبکه کاران سما', style: style),
            SizedBox(width: 5),
            Indicator(
              color: AppColors.contentColorOrange,
              text: '',
              isSquare: true,
            ),
          ],
        );
        break;
      case 4:
        row =
        const Row(
          children: [
            Text('شرکت فناوری و راه حل های هوشمند سپهر', style: style),
            SizedBox(width: 5),
            Indicator(
              color: AppColors.contentColorPink,
              text: '',
              isSquare: true,
            ),
          ],
        );
        break;
      case 5:
        row =
        const Row(
          children: [
            Text('بانک ملت', style: style),
            SizedBox(width: 5),
            Indicator(
              color: AppColors.contentColorPurple,
              text: '',
              isSquare: true,
            ),
          ],
        );
        break;
      case 6:
        row =
        const Row(
          children: [
            Text('شرکت پندار کوشک ایمن', style: style),
            SizedBox(width: 5),
            Indicator(
              color: AppColors.contentColorRed,
              text: '',
              isSquare: true,
            ),
          ],
        );
        break;
      default:
        row =
        const Row(
          children: [
          ],
        );
        break;
    }
    return SideTitleWidget(
        angle: 1.3,
        axisSide: AxisSide.right,
        space: 200,
        child: row
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 90,
        getTitlesWidget: getTitles,
      ),
    ),
    leftTitles: const AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,),
    ),
    topTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
  );

  FlBorderData get borderData => FlBorderData(
    show: false,
  );

  LinearGradient get _barsGradient => const LinearGradient(
    colors: [
      AppColors.contentColorGreen,
      AppColors.contentColorGreenLike,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  List<BarChartGroupData> get barGroups => [
    BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(
          toY: double.parse(pendarRaList[0].toString()),
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 1,
      barRods: [
        BarChartRodData(
          toY: double.parse(pendarRaList[1].toString()),
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 2,
      barRods: [
        BarChartRodData(
          toY: double.parse(pendarRaList[2].toString()),
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 3,
      barRods: [
        BarChartRodData(
          toY: double.parse(pendarRaList[3].toString()),
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 4,
      barRods: [
        BarChartRodData(
          toY: double.parse(pendarRaList[4].toString()),
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 5,
      barRods: [
        BarChartRodData(
          toY: double.parse(pendarRaList[5].toString()),
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 6,
      barRods: [
        BarChartRodData(
          toY: double.parse(pendarIssues.toString()),
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
  ];
}

class PendarDailyBarChart extends StatefulWidget {
  final List pendarRaList;
  final int pendarIssues;
  const PendarDailyBarChart({super.key, required this.pendarRaList,
  required this.pendarIssues});

  @override
  State<StatefulWidget> createState() => PendarDailyBarChartState(pendarRaList, pendarIssues);
}

class PendarDailyBarChartState extends State<PendarDailyBarChart> {
  final List pendarRaList;
  final int pendarIssues;

  PendarDailyBarChartState(this.pendarRaList, this.pendarIssues);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.9,
      child: _BarChart(widget.pendarRaList, widget.pendarIssues),
    );
  }
}