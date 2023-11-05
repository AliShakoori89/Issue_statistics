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
import '../page_helpers/date_picker_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart' as intl;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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

  // Future checkFirstSeen() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.getBool('seen') == null || prefs.getBool('seen') == false
  //       ? await prefs.setBool('seen', false)
  //       : await prefs.setBool('seen', true);
  //
  //   if (prefs.getBool('seen') == false) {
  //     await prefs.setBool('seen', true);
  //     final now = DateTime.now();
  //     String  selectedDate = intl.DateFormat('yyyy/MM/dd').format(now);
  //
  //     BlocProvider.of<NumberOfIssuesFanarBloc>(context)
  //         .add(GetNumberOfIssuesFanarEvent(date: selectedDate));
  //
  //
  //   }
  // }

  // void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final now = DateTime.now();
    String  selectedDate = intl.DateFormat('yyyy/MM/dd').format(now);

    BlocProvider.of<NumberOfIssuesPendarBloc>(context)
        .add(GetNumberOfIssuesPendarEvent(date: selectedDate));

    BlocProvider.of<SetDateBloc>(context)
        .add(CalculatePendarNumberOfIssueAndSumEvent(date: selectedDate));

    BlocProvider.of<SetDateBloc>(context)
        .add(ReadAllIssuePerDateEvent(date: selectedDate));

    BlocProvider.of<NumberOfIssuesFanarBloc>(context)
        .add(GetNumberOfIssuesFanarEvent(date: selectedDate));

    // checkFirstSeen();

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
                            state.numberOfIssueForToseeEttelaatVaErtebatatITSazaCo.isNotEmpty
                                ? state.numberOfIssueForToseeEttelaatVaErtebatatITSazaCo[0].count.toString()
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
                                ? state.numberOfIssueForKiyakushanAriyaCo[0].count.toString()
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
                            state.numberOfIssueForToseeNovinHamrahKishCo.isNotEmpty
                                ? state.numberOfIssueForToseeNovinHamrahKishCo[0].count.toString()
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
                                ? state.numberOfIssueForTabanAtiPardazCo[0].count.toString()
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
                            state.numberOfIssueForZherfAndishanHushmandDibaRayanCo.isNotEmpty
                                ? state.numberOfIssueForZherfAndishanHushmandDibaRayanCo[0].count.toString()
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
                            state.numberOfIssueForPardazeshEttelaatMaliPartCo.isNotEmpty
                                ? state.numberOfIssueForPardazeshEttelaatMaliPartCo[0].count.toString()
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
                              "پیشگامان اعتماد دیجیتال ایرانیان - ایران ساین",
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
                        BlocBuilder<SetDateBloc, SetDateState>(
                          builder: (context, state){
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    BlocBuilder<SetDateBloc, SetDateState>(
                                        builder: (context, state){
                                          print("22222222222                "+state.calculate.toString());
                                          return Text(state.calculate.toString());
                                        }),

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
                                    Text(state.allIssue.toString()),
                                    Row(
                                      children: [
                                        GestureDetector(
                                            onTap: (){
                                              showDialog(
                                                context: context,
                                                builder: (ctx) => AlertDialog(
                                                  backgroundColor: Colors.white ,
                                                  shape: const RoundedRectangleBorder(
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
                                                      decoration: InputDecoration(
                                                        border: OutlineInputBorder(),
                                                        hintText: 'تعداد کل گواهی',
                                                      ),
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(
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
                                                                  final setDateBloc = BlocProvider.of<SetDateBloc>(context);
                                                                  setDateBloc.add(
                                                                      AddAllIssuePerDateEvent(
                                                                          date: state.date,
                                                                          allIssuePerDate: int.parse(controller.text)));
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
                                            child: Icon(Icons.help, size: 15,)),
                                        const Text("تعداد کل گواهی های شرکت پندار",
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(color: Colors.black)),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            );
                          })
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
                })
              ],
            )
          ),
          ),
        ),
      );
  }
}
