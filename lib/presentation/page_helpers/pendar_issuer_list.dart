import 'package:flutter/material.dart';
import 'package:issue_statistics/presentation/page/daily_statistics_page.dart';
import '../../data/model/issue_model.dart';
import '../bloc/fetch_number_of_issues_pendar/state.dart';
import '../bloc/set_date_bloc/bloc.dart';
import '../bloc/set_date_bloc/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PendarIssuerList extends StatelessWidget {

  final NumberOfIssuesPendarState state;
  final double height;
  final double width;
  final TextEditingController controller;
  final String allIssuePerDate;
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
        Container(
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
                    Text(
                      state.numberOfIssueForPardazeshMaliPartCo
                          .isNotEmpty
                          ? state.numberOfIssueForPardazeshMaliPartCo[0]
                          .count.toString()
                          : 0.toString(),
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
                    Text(
                      state.numberOfIssueForBankTejaratCo.isNotEmpty
                          ? state.numberOfIssueForBankTejaratCo[0].count
                          .toString()
                          : 0.toString(),
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
                    Text(
                      state.numberOfIssueForBankParsiyanCo.isNotEmpty
                          ? state.numberOfIssueForBankParsiyanCo[0]
                          .count
                          .toString()
                          : 0.toString(),
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
                    Text(
                      state.numberOfIssueForShabakeKaranSamaCo
                          .isNotEmpty
                          ? state.numberOfIssueForShabakeKaranSamaCo[0]
                          .count.toString()
                          : 0.toString(),
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
                    Text(
                      state
                          .numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo
                          .isNotEmpty
                          ? state
                          .numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo[0]
                          .count.toString()
                          : 0.toString(),
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
                    Text(
                      state.numberOfIssueForBankMellat.isNotEmpty
                          ? state.numberOfIssueForBankMellat[0].count
                          .toString()
                          : 0.toString(),
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
                    pageName == "DailyStatisticsPage"
                        ? Text("${int.parse(allIssuePerDate) -
                        allPendarIssueNumberPerDate -
                        allFanarIssueNumberPerDate}",
                        style: const TextStyle(color: Colors.black))
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
                        ? Text("${state.pendarAllNumberOfIssue+int.parse(allIssuePerDate) -
                            allPendarIssueNumberPerDate
                            -
                            allFanarIssueNumberPerDate}")
                        : Text("${state.pendarAllNumberOfIssue+int.parse(allIssueBetweenDays) -
                            allPendarIssueNumberPerDate
                            -
                            allFanarIssueNumberPerDate}"),
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
        SizedBox(height: height / 50,),
        Container(
          color: Colors.white,
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
                    ? Text(allIssuePerDate,
                    style: const TextStyle(color: Colors.black))
                    : Text(allIssueBetweenDays,
                    style: const TextStyle(color: Colors.black)),
                pageName == "DailyStatisticsPage"
                    ? Row(
                  children: [
                          GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    backgroundColor: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    title: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Text(
                                          "تعداد کل گواهی های صادره را وارد نمایید :",
                                          style: TextStyle(
                                              fontSize: width / 30,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.black)),
                                    ),
                                    content: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: TextFormField(
                                        controller: controller,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'تعداد کل گواهی',
                                        ),
                                      ),
                                    ),
                                    actions: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, bottom: 15),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: SizedBox(
                                              height: 50,
                                              width: 60,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.green),
                                                  onPressed: () {
                                                    late IssueModel issueModel =
                                                        IssueModel();

                                                    issueModel.issueDate = date;
                                                    issueModel
                                                            .allIssueNumberNumber =
                                                        int.parse(
                                                            controller.text);
                                                    issueModel
                                                            .allFanarIssueNumberPerDate =
                                                        allFanarIssueNumberPerDate;

                                                    BlocProvider.of<
                                                                SetDateBloc>(
                                                            context)
                                                        .add(
                                                            AddNumberOfIssueEvent(
                                                                issueModel:
                                                                    issueModel,
                                                                date: date));

                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Text(
                                                    "ثبت",
                                                    style: TextStyle(
                                                        fontSize: width / 25),
                                                  ))),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.help,
                                size: 15,
                              )),
                          const Text("تعداد کل گواهی های صادر شده",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(color: Colors.black)),
                        ],
                )
                    : const Text("تعداد کل گواهی های صادر شده",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(color: Colors.black))
              ],
            ),
          ),
        )
      ],
    );
  }
}
