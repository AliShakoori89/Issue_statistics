import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:issue_statistics/presentation/page/several_days_statistics_page.dart';
import '../page_helpers/const/app_colors.dart';
import 'daily_statistics_page.dart';
import 'monthly_statistic_chart_page.dart';

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 20
          ),
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
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TabBar(
                        controller: tabController,
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.white,
                        indicator: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15
                        ),
                        tabs: const [
                          Tab(
                            text: "آمار روزانه",
                          ),
                          Tab(
                            text: "آمار چند روزه",
                          ),
                          Tab(
                            text: "نمودار ماهانه",
                          ),
                        ],

                      ),
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: TabBarView(
                      controller: tabController,
                      children: const [
                        Center(
                          child: DailyStatisticsPage(),
                        ),
                        Center(
                          child: SeveralDaysStatisticsPage(),
                        ),
                        Center(
                          child: MonthlyChart(),
                        ),
                      ],
                    )
                  ),

                ],
              ),
            ),
          ),
        )

      ),
    );
  }
}
