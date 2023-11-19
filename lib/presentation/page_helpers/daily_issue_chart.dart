import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'indicator.dart';

class _BarChart extends StatelessWidget {
  const _BarChart();

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
          maxY: 30,
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
            Text('شرکت عصر دانش افزار', style: style),
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
                Text('شرکت توسعه تجارت الكترونيك تنيان', style: style),
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
                Text('شرکت راهكار هوشمند امن - اسپارا', style: style),
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
                Text('شرکت توسعه اطلاعات و ارتباطات آی تی ساز', style: style),
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
                Text('شرکت کیاهوشان آریا', style: style),
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
                Text('شرکت توسعه نوین همراه کیش', style: style),
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
                Text('شرکت تابان آتی پرداز', style: style),
                SizedBox(width: 5),
                Indicator(
                  color: AppColors.contentColorRed,
                  text: '',
                  isSquare: true,
                ),
              ],
            );
        break;
      case 7:
        row =
            const Row(
              children: [
                Text('شرکت ژرف اندیشان هوشمند دیبارایان', style: style),

                Indicator(
                  color: AppColors.contentColorYellowLike,
                  text: '',
                  isSquare: true,
                ),

              ],
            );
        break;
      case 8:
        row =
            const Row(
              children: [
                Text('شرکت پردازش اطلاعات مالی پارت (فنار)', style: style),
                SizedBox(width: 5),
                Indicator(
                  color: AppColors.contentColorNavyBlue,
                  text: '',
                  isSquare: true,
                ),
              ],
            );
        break;
      case 9:
        row =
            const Row(
              children: [
                Text('بانک تجارت (فنار)', style: style),
                SizedBox(width: 5),
                Indicator(
                  color: AppColors.contentColorLowPurple,
                  text: '',
                  isSquare: true,
                ),

              ],
            );
        break;
      case 10:
        row =
            const Row(
              children: [
                Text('شرکت پیشگامان اعتماد دیجیتال ایرانیان - ایران ساین', style: style),
                SizedBox(width: 5),
                Indicator(
                  color: AppColors.contentColorBrown,
                  text: '',
                  isSquare: true,
                ),

              ],
            );
        break;
      case 11:
        row =
            const Row(
              children: [
                Text('شرکت فن آوران اعتماد راهبر', style: style),
                SizedBox(width: 5),
                Indicator(
                  color: AppColors.contentColorCyan,
                  text: '',
                  isSquare: true,
                ),

              ],
            );
        break;
      case 12:
        row =
            const Row(
              children: [
                Text('گروه تجارت الکترونیک صدرا کیان', style: style),
                SizedBox(width: 5),
                Indicator(
                  color: AppColors.contentColorGreen2,
                  text: '',
                  isSquare: true,
                ),
              ]
            );
        break;
      case 13:
        row =
        const Row(
          children: [
            Text('شرکت فین و تک پارس', style: style),
            SizedBox(width: 5),
            Indicator(
              color: AppColors.contentColorLowOrange,
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
          toY: 8,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 1,
      barRods: [
        BarChartRodData(
          toY: 10,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 2,
      barRods: [
        BarChartRodData(
          toY: 14,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 3,
      barRods: [
        BarChartRodData(
          toY: 15,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 4,
      barRods: [
        BarChartRodData(
          toY: 13,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 5,
      barRods: [
        BarChartRodData(
          toY: 10,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 6,
      barRods: [
        BarChartRodData(
          toY: 16,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 7,
      barRods: [
        BarChartRodData(
          toY: 16,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 8,
      barRods: [
        BarChartRodData(
          toY: 16,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 9,
      barRods: [
        BarChartRodData(
          toY: 16,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 10,
      barRods: [
        BarChartRodData(
          toY: 16,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 11,
      barRods: [
        BarChartRodData(
          toY: 16,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 12,
      barRods: [
        BarChartRodData(
          toY: 18,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 13,
      barRods: [
        BarChartRodData(
          toY: 18,
          gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [0],
    ),
  ];
}

class BarChartSample3 extends StatefulWidget {
  const BarChartSample3({super.key});

  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<BarChartSample3> {
  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 1.9,
      child: _BarChart(),
    );
  }
}