import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:issue_statistics/logic/repositories/date_time_repository.dart';
import 'package:issue_statistics/logic/repositories/number_of_issues_repository.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_fanar/bloc.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_pendar/bloc.dart';
import 'package:issue_statistics/presentation/bloc/set_date_bloc/bloc.dart';
import 'package:issue_statistics/presentation/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              NumberOfIssuesFanarBloc(NumberOfIssuesRepository(), SetDateRepository())),
        BlocProvider(
            create: (BuildContext context) =>
                NumberOfIssuesPendarBloc(NumberOfIssuesRepository(), SetDateRepository()))
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}
