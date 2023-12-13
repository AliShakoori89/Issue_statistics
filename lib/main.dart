import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:issue_statistics/logic/repositories/date_time_repository.dart';
import 'package:issue_statistics/logic/repositories/monthly_chart_repository.dart';
import 'package:issue_statistics/logic/repositories/number_of_issues_repository.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_all_issue_per_date/bloc.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_fanar/bloc.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_pendar/bloc.dart';
import 'package:issue_statistics/presentation/bloc/monthly_chart/bloc.dart';
import 'package:issue_statistics/presentation/bloc/set_date_bloc/bloc.dart';
import 'package:issue_statistics/presentation/page/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                SetDateBloc(SetDateRepository())),
        BlocProvider(
          create: (BuildContext context) =>
              NumberOfFanarIssuesBloc(NumberOfIssuesRepository(), SetDateRepository())),
        BlocProvider(
            create: (BuildContext context) =>
                NumberOfIssuesPendarBloc(NumberOfIssuesRepository(), SetDateRepository())),
        BlocProvider(
            create: (BuildContext context) =>
                MonthlyChartBloc(MonthlyChartRepository())),
        BlocProvider(
            create: (BuildContext context) =>
                FetchNumberOfAllIssuePerDateBloc(SetDateRepository()))
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}
