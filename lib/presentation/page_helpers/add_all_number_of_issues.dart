import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/issue_model.dart';
import '../bloc/set_date_bloc/bloc.dart';
import '../bloc/set_date_bloc/event.dart';

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
          Icons.add_circle_outline,
          size: 15,
        ));
  }
}
