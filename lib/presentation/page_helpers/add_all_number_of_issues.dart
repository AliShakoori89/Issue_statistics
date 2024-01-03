import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:issue_statistics/presentation/page_helpers/const/app_colors.dart';
import '../../data/model/issue_model.dart';
import '../bloc/set_date_bloc/bloc.dart';
import '../bloc/set_date_bloc/event.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import '../bloc/set_date_bloc/state.dart';


class AddAllNumberOfIssues extends StatelessWidget {

  final double width;
  final double height;
  final TextEditingController controller;
  final String date;
  final int allFanarIssueNumberPerDate;
  final int allPendarIssueNumberPerDate;
  const AddAllNumberOfIssues({super.key, required this.width, required this.height,
    required this.controller, required this.date, required this.allFanarIssueNumberPerDate,
    required this.allPendarIssueNumberPerDate});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
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
                width: 30,
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'تعداد کل گواهی',
                      hintTextDirection: TextDirection.rtl
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
                        height: 40,
                        width: 60,
                        child: BlocBuilder<SetDateBloc, SetDateState>(
                            builder: (context, state) {
                              return ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.contentColorGreenLike),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          )
                                      )
                                  ),
                                  onPressed: () {
                                    late IssueModel issueModel = IssueModel();

                                    final dateList = state.date.split("/");

                                    print(dateList);


                                    Gregorian g = Gregorian(int.parse(dateList[0]),
                                        int.parse(dateList[1]),
                                        int.parse(dateList[2]));

                                    Jalali g2j1 = g.toJalali();

                                    String month;
                                    String day;

                                    if(g2j1.month < 10){
                                      month = "0${g2j1.month}";
                                    }else{
                                      month = "${g2j1.month}";
                                    }

                                    if(g2j1.day < 10){
                                      day = "0${g2j1.day}";
                                    }else{
                                      day = "${g2j1.day}";
                                    }

                                    print("11111111111111111111                         "+month);
                                    print("22222222222222222222                         "+day);


                                    issueModel.issueDate = "${g2j1.year}/$month/$day";
                                    issueModel.issueMonth = month;
                                    issueModel.issueYear = day;
                                    issueModel.allIssueNumber = int.parse(controller.text);
                                    issueModel.allFanarIssueNumberPerDate = allFanarIssueNumberPerDate;

                                    BlocProvider.of<SetDateBloc>(context)
                                        .add(AddNumberOfIssueEvent(
                                        issueModel: issueModel));

                                    Navigator.of(ctx).pop();
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "ثبت",
                                      style: TextStyle(
                                          fontSize: width / 25,
                                          color: AppColors.contentColorBlack),
                                    ),
                                  ));
                            })
                    ),
                  ),
                )
              ],
            ),
          );
        },
        child: const Icon(
          Icons.add_circle_outline,
          size: 15,
        ));
  }
}