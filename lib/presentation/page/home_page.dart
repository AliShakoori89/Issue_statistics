import 'package:flutter/material.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues/bloc.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues/event.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../page_helpers/date_picker_calendar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    BlocProvider.of<NumberOfIssuesBloc>(context)
        .add(GetNumberOfIssuesEvent(
        customerCode: "10320408934",
        reportKey: "0j0UVtan1zl+TOzFJioZemMx93A="
    ));

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
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<NumberOfIssuesBloc, NumberOfIssuesState>(
                            builder: (context, state) {
                              return Container(
                                color: Colors.grey,
                                height: 200,
                                width: 200,
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap:true,// -> Add this here
                                  itemCount: state.numberOfIssue.length,
                                  itemBuilder: (BuildContext context, int index){
                                    return Text( state.numberOfIssue[index].count,
                                    style: TextStyle(fontSize: 50),);
                                  },
                                ),
                              );
                            }),
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
                        Text("200"),
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
                        Text("200"),
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
                        Text("200"),
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
                        Text("200"),
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
                        Text("200"),
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
                        Text("200"),
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
                        Text("200"),
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
                        Text("200"),
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
                        Text("200"),
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
                        Text("200"),
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
                        Text("200"),
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
                        Text("200"),
                        SizedBox(
                          height: height / 80,
                        ),
                        const Text("تعداد کل گواهی های شرکت فنار",
                            style: TextStyle(color: Colors.black))
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 50,
                ),
                const Divider(color: Colors.black87),
                SizedBox(
                  height: height / 50,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("200"),
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
                        Text("200"),
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
                        Text("200"),
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
                        Text("200"),
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
                        Text("200"),
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
                        Text("200"),
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
                        Text("200"),
                        SizedBox(
                          height: height / 80,
                        ),
                        const Text("تعداد کل گواهی های شرکت پندار",
                            style: TextStyle(color: Colors.black))
                      ],
                    ),
                  ],
                ),
              ],
            )
          ),
          ),
        ),
      );
  }
}
