import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_fanar/bloc.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_fanar/event.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_fanar/state.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_pendar/bloc.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_pendar/event.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_pendar/state.dart';
import '../page_helpers/date_picker_calendar.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    // BlocProvider.of<NumberOfIssuesBloc>(context)
    //     .add(GetNumberOfIssuesEvent(
    //     customerCode: "10101586520",
    //     reportKey: "0S2DXd7ISt3nGSL8DqSi+zKpMA0="
    // ));

    final now = DateTime.now();
    String  selectedDate = DateFormat('yyyy/MM/dd').format(now);

    print("selectedDate           "+selectedDate);

    BlocProvider.of<NumberOfIssuesFanarBloc>(context)
        .add(GetNumberOfIssuesFanarEvent(date: selectedDate));

    BlocProvider.of<NumberOfIssuesPendarBloc>(context)
        .add(GetNumberOfIssuesPendarEvent(date: selectedDate));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            left: width / 20,
            right: width / 20,
            top: height / 60
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                DatePickerCalendar(),
                SizedBox(
                  height: height / 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'تعداد گواهی صادر شده',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: width / 22),
                    ),
                    Text("نام مرکز صدور",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: width / 22)),
                  ],
                ),
                SizedBox(
                  height: height / 70,
                ),
                const Divider(color: Colors.black87),
                SizedBox(
                  height: height / 50,
                ),
                BlocBuilder<NumberOfIssuesFanarBloc, NumberOfIssuesFanarState>(
                  builder: (context, state) {
                if (state.status.isLoading) {
                  return const Center(
                      child: SizedBox(
                          height: 10,
                          width: 10,
                          child: CircularProgressIndicator()));
                }
                if (state.status.isSuccess) {
                  return Column(
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
                          const Text("توسعه تجارت الكترونيك تنيان",
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
                          const Text("راهكار هوشمند امن - اسپارا",
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state
                                    .numberOfIssueForToseeEttelaatVaErtebatatITSazaCo
                                    .isNotEmpty
                                ? state
                                    .numberOfIssueForToseeEttelaatVaErtebatatITSazaCo[
                                        0]
                                    .count
                                    .toString()
                                : 0.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            height: height / 80,
                          ),
                          const Text("توسعه اطلاعات و ارتباطات آی تی ساز",
                              style: TextStyle(color: Colors.black))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.numberOfIssueForKiyakushanAriyaCo.isNotEmpty
                                ? state
                                    .numberOfIssueForKiyakushanAriyaCo[0].count
                                    .toString()
                                : 0.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            height: height / 80,
                          ),
                          const Text("کیاهوشان آریا ",
                              style: TextStyle(color: Colors.black))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.numberOfIssueForToseeNovinHamrahKishCo
                                    .isNotEmpty
                                ? state
                                    .numberOfIssueForToseeNovinHamrahKishCo[0]
                                    .count
                                    .toString()
                                : 0.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            height: height / 80,
                          ),
                          const Text("توسعه نوین همراه کیش",
                              style: TextStyle(color: Colors.black))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.numberOfIssueForTabanAtiPardazCo.isNotEmpty
                                ? state
                                    .numberOfIssueForTabanAtiPardazCo[0].count
                                    .toString()
                                : 0.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            height: height / 80,
                          ),
                          const Text("تابان آتی پرداز",
                              style: TextStyle(color: Colors.black))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state
                                    .numberOfIssueForZherfAndishanHushmandDibaRayanCo
                                    .isNotEmpty
                                ? state
                                    .numberOfIssueForZherfAndishanHushmandDibaRayanCo[
                                        0]
                                    .count
                                    .toString()
                                : 0.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            height: height / 80,
                          ),
                          const Text("ژرف اندیشان هوشمند دیبارایان",
                              style: TextStyle(color: Colors.black))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.numberOfIssueForPardazeshEttelaatMaliPartCo
                                    .isNotEmpty
                                ? state
                                    .numberOfIssueForPardazeshEttelaatMaliPartCo[
                                        0]
                                    .count
                                    .toString()
                                : 0.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            height: height / 80,
                          ),
                          const Text("پردازش اطلاعات مالی پارت (فنار)",
                              style: TextStyle(color: Colors.black))
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
                          const Text("بانک تجارت (فنار)",
                              style: TextStyle(color: Colors.black))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state
                                    .numberOfIssueForPishgamanEtemadDijitalIraniyanCo
                                    .isNotEmpty
                                ? state
                                    .numberOfIssueForPishgamanEtemadDijitalIraniyanCo[
                                        0]
                                    .count
                                    .toString()
                                : 0.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            height: height / 80,
                          ),
                          const Text(
                              "پیشگامان اعتماد دیجیتال ایرانیان - ایران ساین",
                              style: TextStyle(color: Colors.black))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.numberOfIssueForFanAvaranEtemadRaahbatCo
                                    .isNotEmpty
                                ? state
                                    .numberOfIssueForFanAvaranEtemadRaahbatCo[0]
                                    .count
                                    .toString()
                                : 0.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            height: height / 80,
                          ),
                          const Text("فن آوران اعتماد راهبر",
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
                            state.faanarAllNumberOfIssue != 0
                                ? state.faanarAllNumberOfIssue.toString()
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
                  );
                }
                if (state.status.isError) {
                  return const SizedBox(
                    height: 500,
                    child: Center(
                        child: Text('Error',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                fontSize: 19))),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.only(top: 300),
                    child: Center(
                        child: Text('Your app don\'t have internet',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                fontSize: 19))),
                  );
                }
              }),
                SizedBox(
                  height: height / 50,
                ),
                const Divider(color: Colors.black87),
                SizedBox(
                  height: height / 50,
                ),
                BlocBuilder<NumberOfIssuesPendarBloc, NumberOfIssuesPendarState>(
                    builder: (context, state) {
                      if (state.status.isLoading) {
                        return const Center(
                            child: SizedBox(
                                height: 10,
                                width: 10,
                                child: CircularProgressIndicator()));
                      }
                      if (state.status.isSuccess) {
                        return Column(
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
                                const Text("پردازش اطلاعات مالی پارت (پندار)",
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
                                const Text("شبکه کاران سما",
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
                            SizedBox(
                              height: height / 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.pendarAllNumberOfIssue != 0
                                      ? state.pendarAllNumberOfIssue.toString()
                                      : 0.toString(),
                                  style: const TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                const Text("تعداد کل گواهی های شرکت پندار",
                                    style: TextStyle(color: Colors.black))
                              ],
                            ),
                          ],
                        );
                      }
                      if (state.status.isError) {
                        return const SizedBox(
                          height: 500,
                          child: Center(
                              child: Text('Error',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 19))),
                        );
                      } else {
                        return const Padding(
                          padding: EdgeInsets.only(top: 300),
                          child: Center(
                              child: Text('Your app don\'t have internet',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 19))),
                        );
                      }
                    }),

              ],
            )
          ),
          ),
        ),
      );
  }
}
