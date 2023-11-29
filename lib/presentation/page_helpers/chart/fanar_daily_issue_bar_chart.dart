import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../const/app_colors.dart';
import '../const/indicator.dart';

class _BarChart extends StatelessWidget {
  final List fanarRaList;
  const _BarChart(this.fanarRaList);

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
          maxY: double.parse(fanarRaList[8].toString()),
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
      case 14:
        row =
        const Row(
          children: [
            Text('تجارت الکترونیک راهبرد ایده آل امین - نسیبا', style: style),
            SizedBox(width: 5),
            Indicator(
              color: AppColors.contentColorLowGreen,
              text: '',
              isSquare: true,
            ),

          ],
        );
        break;
      case 15:
        row =
        const Row(
          children: [
            Text('فناوران هويت الكترونيكي امن (هويتا)', style: style),
            SizedBox(width: 5),
            Indicator(
              color: AppColors.contentColorGreen,
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
      sideTitles: SideTitles(showTitles: false,),
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
      AppColors.contentColorWhite,
      AppColors.mainTextColor3,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  List<BarChartGroupData> get barGroups => [
    BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(
          toY: double.parse(fanarRaList[0].toString()),
          gradient: _barsGradient,
            width: 20
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 1,
      barRods: [
        BarChartRodData(
          toY: double.parse(fanarRaList[1].toString()),
          gradient: _barsGradient,
            width: 20
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 2,
      barRods: [
        BarChartRodData(
          toY: double.parse(fanarRaList[2].toString()),
          gradient: _barsGradient,
            width: 20
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 3,
      barRods: [
        BarChartRodData(
          toY: double.parse(fanarRaList[3].toString()),
          gradient: _barsGradient,
            width: 20
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 4,
      barRods: [
        BarChartRodData(
          toY: double.parse(fanarRaList[4].toString()),
          gradient: _barsGradient,
            width: 20
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 5,
      barRods: [
        BarChartRodData(
          toY: double.parse(fanarRaList[5].toString()),
          gradient: _barsGradient,
            width: 20
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 6,
      barRods: [
        BarChartRodData(
          toY: double.parse(fanarRaList[6].toString()),
          gradient: _barsGradient,
            width: 20
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 7,
      barRods: [
        BarChartRodData(
          toY: double.parse(fanarRaList[7].toString()),
          gradient: _barsGradient,
            width: 20
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 8,
      barRods: [
        BarChartRodData(
          toY: double.parse(fanarRaList[8].toString()),
          gradient: _barsGradient,
          width: 20
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 9,
      barRods: [
        BarChartRodData(
          toY: double.parse(fanarRaList[9].toString()),
          gradient: _barsGradient,
            width: 20
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 10,
      barRods: [
        BarChartRodData(
          toY: double.parse(fanarRaList[10].toString()),
          gradient: _barsGradient,
            width: 20
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 11,
      barRods: [
        BarChartRodData(
          toY: double.parse(fanarRaList[11].toString()),
          gradient: _barsGradient,
            width: 20
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 12,
      barRods: [
        BarChartRodData(
          toY: double.parse(fanarRaList[12].toString()),
          gradient: _barsGradient,
            width: 20
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 13,
      barRods: [
        BarChartRodData(
          toY: double.parse(fanarRaList[13].toString()),
          gradient: _barsGradient,
            width: 20
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 14,
      barRods: [
        BarChartRodData(
          toY: double.parse(fanarRaList[14].toString()),
          gradient: _barsGradient,
            width: 20
        )
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 15,
      barRods: [
        BarChartRodData(
          toY: double.parse(fanarRaList[15].toString()),
          gradient: _barsGradient,
            width: 20
        )
      ],
      showingTooltipIndicators: [0],
    ),
  ];
}

class FanarDailyBarChart extends StatefulWidget {
  final List fanarRaList;
  const FanarDailyBarChart({super.key, required this.fanarRaList});

  @override
  State<StatefulWidget> createState() => FanarDailyBarChartState(fanarRaList);
}

class FanarDailyBarChartState extends State<FanarDailyBarChart> {
  final List fanarRaList;

  FanarDailyBarChartState(this.fanarRaList);

  @override
  Widget build(BuildContext context) {

    return AspectRatio(
      aspectRatio: 1.9,
      child: _BarChart(widget.fanarRaList),
    );
  }
}