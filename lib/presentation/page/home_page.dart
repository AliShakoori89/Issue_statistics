import 'package:flutter/material.dart';
import 'package:issue_statistics/presentation/page/several_days_statistics_page.dart';

import 'daily_statistics_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


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
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248,249,253,1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: const Color.fromRGBO(248,249,253,1),
          elevation: 0,
          bottom: TabBar(
            controller: tabController,
            unselectedLabelColor: Colors.grey,
            dividerColor: Colors.black,
            labelColor: Colors.black,
            indicatorColor: Colors.black,

            labelStyle: const TextStyle(
              color: Colors.black,
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
    );
  }
}