import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:issue_statistics/presentation/bloc/set_date_bloc/bloc.dart';
import 'package:issue_statistics/presentation/bloc/set_date_bloc/event.dart';
import 'package:issue_statistics/presentation/bloc/set_date_bloc/state.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../bloc/fetch_number_of_issues_fanar/bloc.dart';
import '../bloc/fetch_number_of_issues_fanar/event.dart';
import '../bloc/fetch_number_of_issues_pendar/bloc.dart';
import '../bloc/fetch_number_of_issues_pendar/event.dart';
import 'const/app_colors.dart';


class SeveralDatePickerCalendar extends StatefulWidget {
  const SeveralDatePickerCalendar({Key? key}) : super(key: key);

  @override
  State<SeveralDatePickerCalendar> createState() => SeveralDatePickerCalendarState();
}

class SeveralDatePickerCalendarState extends State<SeveralDatePickerCalendar> {

  String label = '';
  JalaliRange picked =  JalaliRange(start: Jalali.now(), end: Jalali.now());
  String selectedDate = "";

  String month = "${Jalali.now().year}-${Jalali.now().month}";
  String date = Jalali.now().day < 10 && Jalali.now().month < 10
      ? "${Jalali.now().year}-0${Jalali.now().month}-0${Jalali.now().day}"
      : Jalali.now().month < 10
      ? "${Jalali.now().year}-0${Jalali.now().month}-${Jalali.now().day}"
      : "${Jalali.now().year}-${Jalali.now().month}-0${Jalali.now().day}";

  @override
  void initState() {
    selectedDate = DateFormat('yyyy-MM').format(DateTime.parse(Jalali.now().toJalaliDateTime()));
    BlocProvider.of<SetDateBloc>(context).add(ReadNumberOfIssueBetweenDaysEvent(startDate: selectedDate, endDate: selectedDate));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SetDateBloc, SetDateState>(builder: (context, state) {

      var height = MediaQuery.of(context).size.height;
      var width = MediaQuery.of(context).size.width;

      return Container(
        margin: const EdgeInsets.only(
            top: 20,
            bottom: 20
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
        ),
        child: optionalDatePicker(context, height, width),
      );
    });
  }

  GestureDetector optionalDatePicker(BuildContext context, double height, double width) {
    return GestureDetector(
      onTap: () async {
        picked = (await showPersianDateRangePicker(
          context: context,

          initialDateRange: JalaliRange(
            start: Jalali(1402, 8, 15),
            end: Jalali(1402, 8, 18),
          ),
          firstDate: Jalali(1402, 1),
          lastDate: Jalali(1450, 9),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: AppColors.contentColorLowPurple, // header background color
                  onPrimary: Colors.white, // header text color
                  onSurface: AppColors.contentColorBlack,
                  surface: AppColors.dateTimePickerColor// body text color
                ),
              ),
              child: child!,
            );
          }
        ))!;

        setState(() {
          label =
          "${picked.start.toJalaliDateTime() ?? ""} ${picked.end.toJalaliDateTime() ?? ""}";
          // print("label                               :"+picked?.start.day);
        });

        if (picked.start.month.toString().length != 1) {
          if (picked.start.day.toString().length != 1) {
            month = "${picked.start.year}-${picked.start.month}";
            date = "${picked.start.year}-${picked.start.month}-${picked.start.day}";
          } else {
            month = "${picked.start.year}-${picked.start.month}";
            date =
            "${picked.start.year}-${picked.start.month}-0${picked.start.day}";
          }
        } else {
          if (picked.start.day.toString().length != 1) {
            month = "${picked.start.year}-0${picked.start.month}";
            date =
            "${picked.start.year}-0${picked.start.month}-${picked.start.day}";
          } else {
            month = "${picked.start.year}-0${picked.start.month}";
            date =
            "${picked.start.year}-0${picked.start.month}-0${picked.start.day}";
          }
        }

        DateTime gStart = DateTime.parse(date);
        Jalali jStart = Jalali(gStart.year, gStart.month, gStart.day);
        Gregorian j2g1Start = jStart.toGregorian();
        String gregorianStartDate = "${j2g1Start.year}/${j2g1Start.month}/${j2g1Start.day}";

        String gregorianStartMonth = "${j2g1Start.year}/${j2g1Start.month}";

        if (picked.end.month.toString().length != 1) {
          if (picked.end.day.toString().length != 1) {
            month = "${picked.end.year}-${picked.end.month}";
            date = "${picked.end.year}-${picked.end.month}-${picked.end.day}";
          } else {
            month = "${picked.end.year}-${picked.end.month}";
            date =
            "${picked.end.year}-${picked.end.month}-0${picked.end.day}";
          }
        } else {
          if (picked.end.day.toString().length != 1) {
            month = "${picked.end.year}-0${picked.end.month}";
            date =
            "${picked.end.year}-0${picked.end.month}-${picked.end.day}";
          } else {
            month = "${picked.end.year}-0${picked.end.month}";
            date =
            "${picked.end.year}-0${picked.end.month}-0${picked.end.day}";
          }
        }

        DateTime gEnd = DateTime.parse(date);
        Jalali jEnd = Jalali(gEnd.year, gEnd.month, gEnd.day);
        Gregorian j2g1End = jEnd.toGregorian();

        String gregorianEndDate = "${j2g1End.year}/${j2g1End.month}/${j2g1End.day}";
        String gregorianEndMonth = "${j2g1End.year}/${j2g1End.month}";
        String gregorianEndYear = "${j2g1End.year}";

        BlocProvider.of<SetDateBloc>(context)
            .add(WriteDateEvent(date: gregorianStartDate, month: gregorianStartMonth, year: gregorianEndYear));
        BlocProvider.of<SetDateBloc>(context)
            .add(WriteDateEvent(date: gregorianEndDate, month: gregorianEndMonth, year: gregorianEndYear));
        BlocProvider.of<SetDateBloc>(context).add(AddToDateEvent(
            date: gregorianStartDate,
            month: gregorianStartMonth,
            year: gregorianEndYear));
        BlocProvider.of<SetDateBloc>(context).add(AddToDateEvent(
            date: gregorianEndDate,
            month: gregorianEndMonth,
            year: gregorianEndYear));
        BlocProvider.of<SetDateBloc>(context)
            .add(ReadDateEvent());

        BlocProvider.of<NumberOfIssuesPendarBloc>(context)
            .add(GetNumberOfIssuesPendarEvent(startDate: gregorianStartDate, endDate: gregorianEndDate));
        BlocProvider.of<NumberOfFanarIssuesBloc>(context)
            .add(GetNumberOfIssuesFanarEvent(startDate: gregorianStartDate, endDate: gregorianEndDate));
        BlocProvider.of<SetDateBloc>(context)
            .add(ReadNumberOfIssueBetweenDaysEvent(startDate: gregorianStartDate, endDate: gregorianEndDate));
      },
      child: Container(
        height: height / 20,
        margin: EdgeInsets.only(
          right: width / 10,
          left: width / 10,
        ),
        // key: keyButton2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
                Icons.calendar_today,
                size: width / 20),
            SizedBox(
              width: width / 20,
            ),
            Text(
                DateFormat('yyyy / MM / dd')
                    .format(DateTime.parse(date))
                    .toPersianDigit(),
                style: TextStyle(
                    fontSize: width / 20)),
          ],
        ),
      ),
    );
  }
}