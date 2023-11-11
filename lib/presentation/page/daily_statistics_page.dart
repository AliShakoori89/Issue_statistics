import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:issue_statistics/data/model/issue_model.dart';
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
          .add(GetNumberOfIssuesPendarEvent(date: selectedDate));

      BlocProvider.of<NumberOfFanarIssuesBloc>(context)
          .add(GetNumberOfIssuesFanarEvent(date: selectedDate));

      BlocProvider.of<SetDateBloc>(context)
          .add(ReadNumberOfIssuePerDateEvent(date: selectedDate));
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
                pendarWrapperItemList(width, height),
                SizedBox(
                  height: height / 80,
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

  BlocBuilder<NumberOfIssuesPendarBloc, NumberOfIssuesPendarState> allIssueNumbers(double height, double width) {
    return BlocBuilder<NumberOfIssuesPendarBloc, NumberOfIssuesPendarState>(
              builder: (context, state) {
                int allPendarIssueNumberPerDate = state.pendarAllNumberOfIssue;
                return BlocBuilder<NumberOfFanarIssuesBloc, NumberOfFanarIssuesState>(
                    builder: (context, state) {

                      int allFanarIssueNumberPerDate = state.fanarAllNumberOfIssue;

                      return BlocBuilder<SetDateBloc, SetDateState>(
                          builder: (context, state){

                            var date = state.date;

                            if (state.status.isLoading) {
                              return const Center(
                                  child: SizedBox(
                                      height: 10,
                                      width: 10,
                                      child: CircularProgressIndicator()));
                            }if (state.status.isSuccess) {
                              return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("${int.parse(state.allIssuePerDate) - allPendarIssueNumberPerDate - allFanarIssueNumberPerDate}",
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
                                        Text(state.allIssuePerDate,
                                            style: const TextStyle(color: Colors.black)),
                                        Row(
                                          children: [
                                            GestureDetector(
                                                onTap: (){
                                                  showDialog(
                                                    context: context,
                                                    builder: (ctx) => AlertDialog(
                                                      backgroundColor: Colors.white ,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.all(Radius.circular(20.0))),
                                                      title: Directionality(
                                                        textDirection: TextDirection.rtl,
                                                        child: Text("تعداد کل گواهی های صادره را وارد نمایید :",
                                                            style: TextStyle(
                                                                fontSize: width / 30,
                                                                fontWeight: FontWeight.w900,
                                                                color: Colors.black)),
                                                      ),
                                                      content: SizedBox(
                                                        height: 50 ,
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
                                                              left: 15,
                                                              bottom: 15
                                                          ),
                                                          child: Align(
                                                            alignment: Alignment.centerLeft,
                                                            child: SizedBox(
                                                                height: 50 ,
                                                                width: 60,
                                                                child: ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor: Colors.green
                                                                    ),
                                                                    onPressed: () {

                                                                      late IssueModel issueModel = IssueModel();

                                                                      issueModel.issueDate = date;
                                                                      issueModel.allIssueNumberNumber = int.parse(controller.text);
                                                                      issueModel.allFanarIssueNumberPerDate = allFanarIssueNumberPerDate;

                                                                      BlocProvider.of<SetDateBloc>(context).add(
                                                                          AddNumberOfIssueEvent(issueModel: issueModel, date: date));

                                                                      Navigator.of(ctx).pop();
                                                                    },
                                                                    child: Text(
                                                                      "ثبت", style: TextStyle(
                                                                        fontSize: width / 25
                                                                    ),))),
                                                          ),
                                                        )

                                                      ],
                                                    ),
                                                  );
                                                },
                                                child: const Icon(Icons.help, size: 15,)),
                                            const Text("تعداد کل گواهی های شرکت پندار",
                                                textDirection: TextDirection.rtl,
                                                style: TextStyle(color: Colors.black)),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                );
                            }if (state.status.isError) {
                              return const ErrorNotification();
                            } else {
                              return const ErrorNotification();
                            }

                          });

                    });
              });
  }

  BlocBuilder<NumberOfIssuesPendarBloc, NumberOfIssuesPendarState> pendarWrapperItemList(double width, double height) {
    return BlocBuilder<NumberOfIssuesPendarBloc, NumberOfIssuesPendarState>(
                  builder: (context, state) {
                    if (state.status.isLoading) {
                      return CustomShimmer(
                        width: width,
                        height: height,
                        itemCount: 7,
                      );
                    }
                    if (state.status.isSuccess) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
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
                                    state.numberOfIssueForPardazeshMaliPartCo.isNotEmpty
                                        ? state.numberOfIssueForPardazeshMaliPartCo[0].count.toString()
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
                                        ? state.numberOfIssueForBankTejaratCo[0].count.toString()
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
                                        ? state.numberOfIssueForBankParsiyanCo[0].count.toString()
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
                                    state.numberOfIssueForShabakeKaranSamaCo.isNotEmpty
                                        ? state.numberOfIssueForShabakeKaranSamaCo[0].count.toString()
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
                                    state.numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo.isNotEmpty
                                        ? state.numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo[0].count.toString()
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
                                        ? state.numberOfIssueForBankMellat[0].count.toString()
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

                            ],
                          ),
                        ),
                      );
                    }
                    if (state.status.isError) {
                      return const ErrorNotification();
                    } else {
                      return const ErrorNotification();
                    }
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
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(
                        right: 10,
                        left: 10,
                        top: 10,
                        bottom: 10
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.numberOfIssueForAsrDaneshAfzarCo.isNotEmpty
                                    ? state
                                        .numberOfIssueForAsrDaneshAfzarCo[0].count
                                        .toString()
                                    : 0.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: height / 80,
                              ),
                              const Text("شرکت عصر دانش افزار",
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.numberOfIssueForToseeTejaratTeniyanCo
                                        .isNotEmpty
                                    ? state.numberOfIssueForToseeTejaratTeniyanCo[0]
                                        .count
                                        .toString()
                                    : 0.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: height / 80,
                              ),
                              const Text("شرکت توسعه تجارت الكترونيك تنيان",
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.numberOfIssueForRahkarHushmandAmnCo.isNotEmpty
                                    ? state.numberOfIssueForRahkarHushmandAmnCo[0]
                                        .count
                                        .toString()
                                    : 0.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: height / 80,
                              ),
                              const Text("شرکت راهكار هوشمند امن - اسپارا",
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.numberOfIssueForToseeEttelaatVaErtebatatITSazaCo
                                    .isNotEmpty
                                    ? state.numberOfIssueForToseeEttelaatVaErtebatatITSazaCo[0].count.toString()
                                    : 0.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: height / 80,
                              ),
                              const Text("شرکت توسعه اطلاعات و ارتباطات آی تی ساز",
                                  style: TextStyle(color: Colors.black))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.numberOfIssueForKiyakushanAriyaCo.isNotEmpty
                                    ? state.numberOfIssueForKiyakushanAriyaCo[0].count.toString()
                                    : 0.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: height / 80,
                              ),
                              const Text("شرکت کیاهوشان آریا",
                                  style: TextStyle(color: Colors.black))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.numberOfIssueForToseeNovinHamrahKishCo.isNotEmpty
                                    ? state.numberOfIssueForToseeNovinHamrahKishCo[0].count.toString()
                                    : 0.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: height / 80,
                              ),
                              const Text("شرکت توسعه نوین همراه کیش",
                                  style: TextStyle(color: Colors.black))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.numberOfIssueForTabanAtiPardazCo.isNotEmpty
                                    ? state.numberOfIssueForTabanAtiPardazCo[0].count.toString()
                                    : 0.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: height / 80,
                              ),
                              const Text("شرکت تابان آتی پرداز",
                                  style: TextStyle(color: Colors.black))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.numberOfIssueForZherfAndishanHushmandDibaRayanCo.isNotEmpty
                                    ? state.numberOfIssueForZherfAndishanHushmandDibaRayanCo[0].count.toString()
                                    : 0.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: height / 80,
                              ),
                              const Text("شرکت ژرف اندیشان هوشمند دیبارایان",
                                  style: TextStyle(color: Colors.black))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.numberOfIssueForPardazeshEttelaatMaliPartCo.isNotEmpty
                                    ? state.numberOfIssueForPardazeshEttelaatMaliPartCo[0].count.toString()
                                    : 0.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: height / 80,
                              ),
                              const Text("شرکت پردازش اطلاعات مالی پارت (فنار)",
                                  style: TextStyle(color: Colors.black))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.numberOfIssueForBankTejaratCo.isNotEmpty
                                    ? state.numberOfIssueForBankTejaratCo[0].count.toString()
                                    : 0.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: height / 80,
                              ),
                              const Text("بانک تجارت (فنار)",
                                  style: TextStyle(color: Colors.black))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.numberOfIssueForPishgamanEtemadDijitalIraniyanCo.isNotEmpty
                                    ? state.numberOfIssueForPishgamanEtemadDijitalIraniyanCo[0].count.toString()
                                    : 0.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: height / 80,
                              ),
                              const Text(
                                  "شرکت پیشگامان اعتماد دیجیتال ایرانیان - ایران ساین",
                                  style: TextStyle(color: Colors.black))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.numberOfIssueForFanAvaranEtemadRaahbatCo.isNotEmpty
                                    ? state.numberOfIssueForFanAvaranEtemadRaahbatCo[0].count.toString()
                                    : 0.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: height / 80,
                              ),
                              const Text("شرکت فن آوران اعتماد راهبر",
                                  style: TextStyle(color: Colors.black))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.numberOfIssueForGrouhTejaratElectronicSadraKiyanCo.isNotEmpty
                                    ? state.numberOfIssueForGrouhTejaratElectronicSadraKiyanCo[0].count.toString()
                                    : 0.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: height / 80,
                              ),
                              const Text("گروه تجارت الکترونیک صدرا کیان",
                                  style: TextStyle(color: Colors.black))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.numberOfIssueFinTekParsCo.isNotEmpty
                                    ? state.numberOfIssueFinTekParsCo[0].count.toString()
                                    : 0.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: height / 80,
                              ),
                              const Text("شرکت فین و تک پارس",
                                  style: TextStyle(color: Colors.black))
                            ],
                          ),
                          SizedBox(
                            height: height / 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.fanarAllNumberOfIssue != 0
                                    ? state.fanarAllNumberOfIssue.toString()
                                    : 0.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: height / 80,
                              ),
                              const Text("تعداد کل گواهی های شرکت فنار",
                                  style: TextStyle(color: Colors.black))
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
                if (state.status.isError) {
                  return const ErrorNotification();
                } else {
                  return const ErrorNotification();
                }
              });
  }
}
