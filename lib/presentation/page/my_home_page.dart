import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:issue_statistics/presentation/page/several_days_statistics_page.dart';
import '../page_helpers/app_colors.dart';
import 'daily_statistics_page.dart';

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
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: AppColors.mainColor,
        //   child: Icon(Icons.bar_chart),
        //     onPressed: (){
        //
        //     }),
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)
              ),
              height: 50,
              padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)
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
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: const [
            Center(
              child: DailyStatisticsPage(),
            ),
            Center(
              child: SeveralDaysStatisticsPage(),
            ),
          ],
        ),
      ),
    );
  }
}
