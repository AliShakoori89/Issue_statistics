import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:issue_statistics/presentation/page_helpers/several_days_date_picker_calendar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/fetch_number_of_issues_fanar/bloc.dart';
import '../bloc/fetch_number_of_issues_fanar/state.dart';
import '../bloc/fetch_number_of_issues_pendar/bloc.dart';
import '../bloc/fetch_number_of_issues_pendar/state.dart';
import '../bloc/set_date_bloc/bloc.dart';
import '../bloc/set_date_bloc/event.dart';
import '../bloc/set_date_bloc/state.dart';
import '../page_helpers/const/app_colors.dart';
import '../page_helpers/const/no_data_page.dart';
import '../page_helpers/fanar_issuer_list.dart';
import '../page_helpers/pendar_issuer_list.dart';
import '../page_helpers/const/shimmer.dart';
import 'package:intl/intl.dart' as intl;
import 'fanar_daily_statistic_chart_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class SeveralDaysStatisticsPage extends StatefulWidget {
  const SeveralDaysStatisticsPage({Key? key}) : super(key: key);

  @override
  State<SeveralDaysStatisticsPage> createState() => _SeveralDaysStatisticsPageState();
}

class _SeveralDaysStatisticsPageState extends State<SeveralDaysStatisticsPage> {

  late TextEditingController controller;
  ConnectivityResult connectivityResult = ConnectivityResult.none;
  Connectivity connectivity = Connectivity();

  @override
  void initState() {
    connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        connectivityResult = result;
      });
      log(result.name);
    });
    controller = TextEditingController();
    final now = DateTime.now();
    String  selectedDate = intl.DateFormat('yyyy/MM/dd').format(now);
    BlocProvider.of<SetDateBloc>(context).add(ReadNumberOfIssueBetweenDaysEvent(startDate: selectedDate, endDate: selectedDate));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
            gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  AppColors.contentColorBlue,
                  AppColors.backgroundColor
                ])
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SeveralDatePickerCalendar(),
              SizedBox(
                height: height / 50,
              ),
              connectivityResult == ConnectivityResult.none
                  ? const NoDataPage()
                  : Column(
                children: [
                  fanarWrapperItemList(width, height),
                  SizedBox(
                    height: height / 50,
                  ),
                  allIssueNumbers(height, width),
                ],
              ),
              SizedBox(
                height: height / 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BlocBuilder<NumberOfFanarIssuesBloc, NumberOfFanarIssuesState> allIssueNumbers(double height, double width) {
    return BlocBuilder<NumberOfFanarIssuesBloc, NumberOfFanarIssuesState>(
        builder: (context, state) {
          int allFanarIssueNumberPerDate = state.fanarAllNumberOfIssue;

          return BlocBuilder<SetDateBloc, SetDateState>(
              builder: (context, state) {

                var allIssuePerDate = state.allIssuePerDate;
                String allIssueBetweenDays = state.allIssueBetweenDays;
                var date = state.date;

                return BlocBuilder<NumberOfIssuesPendarBloc, NumberOfIssuesPendarState>(
                    builder: (context, state) {

                      int allPendarIssueNumberPerDate = state.pendarAllNumberOfIssue;


                      if (state.status.isLoading) {
                        return CustomShimmer(
                          width: width,
                          height: height,
                          itemCount: 7,
                        );
                      }if (state.status.isSuccess) {
                        return PendarIssuerList(
                          state: state,
                          height: height,
                          width: width,
                          controller: controller,
                          allIssuePerDate: allIssuePerDate,
                          allPendarIssueNumberPerDate: allPendarIssueNumberPerDate,
                          allFanarIssueNumberPerDate: allFanarIssueNumberPerDate,
                          date: date,
                          allIssueBetweenDays: allIssueBetweenDays,
                          pageName: "SeveralDaysStatisticsPage",);
                      }
                      if (state.status.isError) {
                        return Container();
                      } else {
                        return const NoDataPage();
                      }

                    });
              });
        });
  }

  BlocBuilder<NumberOfFanarIssuesBloc, NumberOfFanarIssuesState> fanarWrapperItemList(double width, double height) {
    return BlocBuilder<NumberOfFanarIssuesBloc, NumberOfFanarIssuesState>(
        builder: (context, state) {
          if (state.status.isLoading) {
            return CustomShimmer(
              width: width,
              height: height,
              itemCount: 15,
            );
          }
          if (state.status.isSuccess) {
            return GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        FanarDailyStatisticChartPage(
                          fanarRaList: state.fanarRaList,
                        )),
                  );
                },
                child: FanarIssuerList(state: state, height: height));
          }
          if (state.status.isError) {
            return const NoDataPage();
          } else {
            return Container();
          }
        });
  }
}