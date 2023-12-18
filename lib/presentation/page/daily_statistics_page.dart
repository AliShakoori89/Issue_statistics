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
import 'package:issue_statistics/presentation/page/fanar_daily_statistic_chart_page.dart';
import 'package:issue_statistics/presentation/page_helpers/const/no_data_page.dart';
import 'package:issue_statistics/presentation/page_helpers/fanar_issuer_list.dart';
import 'package:issue_statistics/presentation/page_helpers/pendar_issuer_list.dart';
import '../page_helpers/daily_date_picker_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart' as intl;

import '../page_helpers/const/shimmer.dart';

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
        padding: EdgeInsets.only(
          top: 20
        ),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const DailyDatePickerCalendar(),
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

            var allIssuePerDate = state.allIssuePerDate;
            var date = state.date;

            return BlocBuilder<NumberOfIssuesPendarBloc, NumberOfIssuesPendarState>(
                builder: (context, state) {

                  int allPendarIssueNumberPerDate = state.pendarAllNumberOfIssue;

                  print(state.pendarRaList);

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
                        allIssueBetweenDays: '0',
                        pageName: "DailyStatisticsPage",);
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

                    print(state.fanarRaList);

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
                  print("state.status.isError");
                  return Container();
                } else {
                  print("state");
                  return Container();
                }
              });
  }
}
