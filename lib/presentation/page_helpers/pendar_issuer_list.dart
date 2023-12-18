import 'package:flutter/material.dart';
import 'package:issue_statistics/data/model/all_issues_per_day_model.dart';
import 'package:issue_statistics/presentation/page_helpers/add_all_number_of_issues.dart';
import '../bloc/fetch_number_of_issues_pendar/state.dart';
import '../page/pendar_daily_statistic_chart_page.dart';


class PendarIssuerList extends StatelessWidget {

  final NumberOfIssuesPendarState state;
  final double height;
  final double width;
  final TextEditingController controller;
  final AllIssuePerDayModel? allIssuePerDate;
  final int allFanarIssueNumberPerDate;
  final int allPendarIssueNumberPerDate;
  final String date;
  final String pageName;
  final String allIssueBetweenDays;

  const PendarIssuerList({super.key, required this.state, required this.height,
    required this.width, required this.controller,
    required this.allIssuePerDate, required this.allPendarIssueNumberPerDate,
    required this.allFanarIssueNumberPerDate, required this.date,
    required this.pageName, required this.allIssueBetweenDays});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  PendarDailyStatisticChartPage(
                      pendarRaList: state.pendarRaList,
                      pendarIssues:  pageName == "DailyStatisticsPage"
                          ? int.parse(allIssuePerDate!.data![0].cnt.toString()) -
                          allPendarIssueNumberPerDate -
                          allFanarIssueNumberPerDate
                          : int.parse(allIssueBetweenDays) -
                          allPendarIssueNumberPerDate -
                          allFanarIssueNumberPerDate
                  )),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Container(
              margin: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: 10
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text( state.numberOfIssueForPardazeshMaliPartCo.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      const Text("شرکت پردازش اطلاعات مالی پارت (پندار)",
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(state.numberOfIssueForBankTejaratCo.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      const Text("بانک تجارت (پندار)",
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text( state.numberOfIssueForBankParsiyanCo.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      const Text("بانک پارسیان(دیبا رایان)",
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text( state.numberOfIssueForShabakeKaranSamaCo.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      const Text("شرکت شبکه کاران سما",
                          style: TextStyle(color: Colors.black))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text( state.numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      const Text("شرکت فناوری و راه حلهای هوشمند سپهر",
                          style: TextStyle(color: Colors.black))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text( state.numberOfIssueForBankMellat.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      const Text("بانک ملت",
                          style: TextStyle(color: Colors.black))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text( state.numberOfIssueForTataCo.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      const Text("بانک تجارت  - شزکت تاتا",
                          style: TextStyle(color: Colors.black))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text( state.numberOfIssueForSimorghTejaratCo.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      const Text("بانک تجارت - سیمرغ تجارت",
                          style: TextStyle(color: Colors.black))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      pageName == "DailyStatisticsPage"
                      ? allIssuePerDate!.data!.isNotEmpty
                          ? Text("${int.parse(allIssuePerDate!.data![0].cnt.toString()) -
                          allPendarIssueNumberPerDate -
                          allFanarIssueNumberPerDate}",
                          style: const TextStyle(color: Colors.black))
                          : Text("0")
                        : Text("${int.parse(allIssueBetweenDays) -
                        allPendarIssueNumberPerDate -
                        allFanarIssueNumberPerDate}",
                          style: const TextStyle(color: Colors.black)),
                      SizedBox(
                        height: height / 80,
                      ),
                      const Text("شرکت پندار کوشک ایمن",
                          style: TextStyle(color: Colors.black))
                    ],
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      pageName == "DailyStatisticsPage"
                        ? allIssuePerDate!.data!.isNotEmpty
                          ? Text("${allPendarIssueNumberPerDate
                          + int.parse(allIssuePerDate!.data![0].cnt.toString())
                          - allPendarIssueNumberPerDate
                          - allFanarIssueNumberPerDate}")
                          : Text("0")
                          : Text("${state.pendarAllNumberOfIssue
                          + int.parse(allIssueBetweenDays)
                          - allPendarIssueNumberPerDate
                          - allFanarIssueNumberPerDate}"),
                      SizedBox(
                        height: height / 80,
                      ),
                      const Text("تعداد کل گواهی های شرکت پندار",
                          style: TextStyle(color: Colors.black))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: height / 50,),
        allIssuesContainer()
      ],
    );
  }

  Container allIssuesContainer() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Container(
        margin: const EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: 10
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            pageName == "DailyStatisticsPage"
                ? allIssuePerDate!.data!.isNotEmpty
                ? Text(allIssuePerDate!.data![0].cnt.toString(),
                style: const TextStyle(color: Colors.black))
                : Text("0")
              : Text(allIssueBetweenDays,
              style: const TextStyle(color: Colors.black)),
            pageName == "DailyStatisticsPage"
                ? Row(
              children: [
                AddAllNumberOfIssues(width: width, height: height, controller: controller,
                    date: date, allFanarIssueNumberPerDate: allFanarIssueNumberPerDate,
                    allPendarIssueNumberPerDate: allPendarIssueNumberPerDate),
                const Text("تعداد کل گواهی های صادر شده",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(color: Colors.black)),
              ],)
                : const Text("تعداد کل گواهی های صادر شده",
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Colors.black))
          ],
        ),
      ),
    );
  }
}