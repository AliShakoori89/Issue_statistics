import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:issue_statistics/presentation/page_helpers/const/app_colors.dart';
import '../../data/model/issue_model.dart';
import '../bloc/set_date_bloc/bloc.dart';
import '../bloc/set_date_bloc/event.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';


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
                        child: ElevatedButton(
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

                              print("dateeeee                    "+date);
                              String newDate = date.replaceAll('/','-');
                              print("dateeeee                    "+newDate);
                              DateTime g = DateTime.parse(newDate);
                              print("dateeeee                    "+g.toString());
                              Jalali j1 = g.toJalali();
                              print("dateeeee                    "+j1.toString());
                              print("dateeeee                    "+j1.year.toString());
                              issueModel.issueDate = date;
                              issueModel.issueMonth = j1.month.toString();
                              issueModel.issueYear = j1.year.toString();
                              issueModel.allIssueNumberNumber = int.parse(controller.text);
                              issueModel.allFanarIssueNumberPerDate = allFanarIssueNumberPerDate;

                              BlocProvider.of<SetDateBloc>(context)
                                  .add(AddNumberOfIssueEvent(
                                      issueModel: issueModel,
                                      date: date));

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
                            ))),
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
