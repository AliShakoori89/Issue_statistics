import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_fanar/bloc.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_fanar/event.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_fanar/state.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_pendar/bloc.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_pendar/event.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_pendar/state.dart';
import 'package:issue_statistics/presentation/bloc/set_date_bloc/bloc.dart';
import 'package:issue_statistics/presentation/bloc/set_date_bloc/event.dart';
import 'package:issue_statistics/presentation/bloc/set_date_bloc/state.dart';
import 'package:issue_statistics/presentation/page_helpers/error_notif.dart';
import 'package:issue_statistics/presentation/page_helpers/homepage_header.dart';
import 'package:issue_statistics/presentation/page_helpers/fanar_issuer_list.dart';
import 'package:issue_statistics/presentation/page_helpers/pendar_issuer_list.dart';
import '../page_helpers/daily_date_picker_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart' as intl;

import '../page_helpers/shimmer.dart';

class DailyStatisticsPage extends StatefulWidget {
  const DailyStatisticsPage({Key? key}) : super(key: key);


  @override
  State<DailyStatisticsPage> createState() => _DailyStatisticsPageState();
}

class _DailyStatisticsPageState extends State<DailyStatisticsPage> {

  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getBool('seen') == null || prefs.getBool('seen') == false
        ? await prefs.setBool('seen', false)
        : await prefs.setBool('seen', true);

    if (prefs.getBool('seen') == false) {
      await prefs.setBool('seen', true);
      final now = DateTime.now();
      String  selectedDate = intl.DateFormat('yyyy/MM/dd').format(now);

      BlocProvider.of<NumberOfIssuesPendarBloc>(context)
          .add(GetNumberOfIssuesPendarEvent(startDate: selectedDate, endDate: selectedDate));

      BlocProvider.of<NumberOfFanarIssuesBloc>(context)
          .add(GetNumberOfIssuesFanarEvent(startDate: selectedDate, endDate: selectedDate));

      BlocProvider.of<SetDateBloc>(context)
          .add(ReadNumberOfIssuePerDateEvent(startDate: selectedDate, endDate: selectedDate));
    }
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    checkFirstSeen();

    return SafeArea(
      child: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(
            left: width / 30,
            right: width / 30,
        ),
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                DailyDatePickerCalendar(),
                HomePageHeader(width: width, height: height),
                const Divider(color: Colors.black87),
                SizedBox(
                  height: height / 50,
                ),
                fanarWrapperItemList(width, height),
                SizedBox(
                  height: height / 50,
                ),
                allIssueNumbers(height, width),
                SizedBox(
                  height: height / 50,
                ),
              ],
            )
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

            String allIssuePerDate = state.allIssuePerDate;
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
                        date: date);
                  }
                  if (state.status.isError) {
                    return const ErrorNotification();
                  } else {
                    return const ErrorNotification();
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
                  return FanarIssuerList(state: state, height: height);
                }
                if (state.status.isError) {
                  return const ErrorNotification();
                } else {
                  return const ErrorNotification();
                }
              });
  }
}
