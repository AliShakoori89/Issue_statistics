import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_fanar/bloc.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_fanar/event.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_pendar/bloc.dart';
import 'package:issue_statistics/presentation/bloc/fetch_number_of_issues_pendar/event.dart';
import 'package:issue_statistics/presentation/bloc/set_date_bloc/bloc.dart';
import 'package:issue_statistics/presentation/bloc/set_date_bloc/event.dart';
import 'package:issue_statistics/presentation/bloc/set_date_bloc/state.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';


class DatePickerCalendar extends StatefulWidget {

  GlobalKey? keyBottomNavigation2;
  GlobalKey? keyBottomNavigation3;
  GlobalKey? keyBottomNavigation4;

  DatePickerCalendar({super.key, this.keyBottomNavigation2,
    this.keyBottomNavigation3, this.keyBottomNavigation4});

  @override
  State<DatePickerCalendar> createState() => DatePickerCalendarState(
      keyBottomNavigation2, keyBottomNavigation3, keyBottomNavigation4
  );
}

class DatePickerCalendarState extends State<DatePickerCalendar> {

  GlobalKey? keyBottomNavigation2;
  GlobalKey? keyBottomNavigation3;
  GlobalKey? keyBottomNavigation4;

  DatePickerCalendarState(this.keyBottomNavigation2, this.keyBottomNavigation3, this.keyBottomNavigation4);

  String label = '';
  Jalali picked = Jalali.now() ;
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SetDateBloc, SetDateState>(builder: (context, state) {

      var height = MediaQuery.of(context).size.height;
      var width = MediaQuery.of(context).size.width;

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leftArrow(context, width, height),
          optionalDatePicker(context, height, width),
          rightArrow(context, width, height),
        ],
      );
    });
  }

  Expanded optionalDatePicker(BuildContext context, double height, double width) {
    return Expanded(
      flex: 4,
      child: GestureDetector(
        onTap: () async {
          picked = (await showPersianDatePicker(
            context: context,
            initialDate: Jalali.now(),
            firstDate: Jalali(1385, 8),
            lastDate: Jalali(1450, 9),
            builder: (context, child) {
              return child!;
            },
          ))!;
          if (picked != selectedDate) {
            setState(() {
              label = picked.toJalaliDateTime();
            });
          }

          if (!mounted) return;

          if (picked.month.toString().length != 1) {
            if (picked.day.toString().length != 1) {
              month = "${picked.year}-${picked.month}";
              date = "${picked.year}-${picked.month}-${picked.day}";
            } else {
              month = "${picked.year}-${picked.month}";
              date =
              "${picked.year}-${picked.month}-0${picked.day}";
            }
          } else {
            if (picked.day.toString().length != 1) {
              month = "${picked.year}-0${picked.month}";
              date =
              "${picked.year}-0${picked.month}-${picked.day}";
            } else {
              month = "${picked.year}-0${picked.month}";
              date =
              "${picked.year}-0${picked.month}-0${picked.day}";
            }
          }

          DateTime g = DateTime.parse(date);
          Jalali j = Jalali(g.year, g.month, g.day);
          Gregorian j2g1 = j.toGregorian();
          String gregorianDate = "${j2g1.year}/${j2g1.month}/${j2g1.day}";

          // String gregorianMonth = "${j2g1.year}/${j2g1.month}";

          // BlocProvider.of<SetDateBloc>(context)
          //     .add(WriteDateEvent(date: gregorianDate, month: gregorianMonth));
          // BlocProvider.of<SetDateBloc>(context).add(AddToDateEvent(
          //     date: gregorianDate,
          //     month: gregorianMonth));
          // BlocProvider.of<SetDateBloc>(context)
          //     .add(ReadDateEvent());
          // BlocProvider.of<SetDateBloc>(context)
          //     .add(ReadMonthEvent());
          BlocProvider.of<SetDateBloc>(context)
              .add(CalculatePendarNumberOfIssueAndSumEvent(date: gregorianDate));
          BlocProvider.of<SetDateBloc>(context)
              .add(ReadAllIssuePerDateEvent(date: gregorianDate));

          BlocProvider.of<NumberOfIssuesPendarBloc>(context)
              .add(GetNumberOfIssuesPendarEvent(date: gregorianDate));
          BlocProvider.of<NumberOfIssuesFanarBloc>(context)
              .add(GetNumberOfIssuesFanarEvent(date: gregorianDate));
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
                  key: keyBottomNavigation3,
                  DateFormat('yyyy / MM / dd')
                      .format(DateTime.parse(date))
                      .toPersianDigit(),
                  style: TextStyle(
                      fontSize: width / 20)),
            ],
          ),
        ),
      ),
    );
  }

  Expanded leftArrow(BuildContext context, double width, double height) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          date =
          "${DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.parse(date))).add(const Duration(days: -1))}";

          DateTime g = DateTime.parse(date);
          Jalali j = Jalali(g.year, g.month, g.day);
          Gregorian j2g1 = j.toGregorian();
          String gregorianDate = "${j2g1.year}/${j2g1.month}/${j2g1.day}";

          // String gregorianMonth = "${j2g1.year}/${j2g1.month}";
          //
          // BlocProvider.of<SetDateBloc>(context)
          //     .add(WriteDateEvent(date: gregorianDate, month: gregorianMonth));
          // BlocProvider.of<SetDateBloc>(context).add(AddToDateEvent(
          //     date: gregorianDate,
          //     month: gregorianMonth));
          // BlocProvider.of<SetDateBloc>(context)
          //     .add(ReadDateEvent());
          // BlocProvider.of<SetDateBloc>(context)
          //     .add(ReadMonthEvent());
          BlocProvider.of<SetDateBloc>(context)
              .add(CalculatePendarNumberOfIssueAndSumEvent(date: gregorianDate));
          BlocProvider.of<SetDateBloc>(context)
              .add(ReadAllIssuePerDateEvent(date: gregorianDate));
          BlocProvider.of<NumberOfIssuesPendarBloc>(context)
              .add(GetNumberOfIssuesPendarEvent(date: gregorianDate));
          BlocProvider.of<NumberOfIssuesFanarBloc>(context)
              .add(GetNumberOfIssuesFanarEvent(date: gregorianDate));
        },
        child: SizedBox(
          width: width / 20,
          height: height / 40,
          child: Image.asset(
              key: keyBottomNavigation2,
              // key: keyButton1,
              "assets/main_page_first_container_logo/left_arrow.png"),
        ),
      ),
    );
  }

  Expanded rightArrow(BuildContext context, double width, double height) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          date =
          "${DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.parse(date))).add(const Duration(days: 1))}";

          DateTime g = DateTime.parse(date);
          Jalali j = Jalali(g.year, g.month, g.day);
          Gregorian j2g1 = j.toGregorian();
          String gregorianDate = "${j2g1.year}/${j2g1.month}/${j2g1.day}";

          // String gregorianMonth = "${j2g1.year}/${j2g1.month}";
          //
          // BlocProvider.of<SetDateBloc>(context)
          //     .add(WriteDateEvent(date: gregorianDate, month: gregorianMonth));
          // BlocProvider.of<SetDateBloc>(context).add(AddToDateEvent(
          //     date: gregorianDate,
          //     month: gregorianMonth));
          // BlocProvider.of<SetDateBloc>(context)
          //     .add(ReadDateEvent());
          // BlocProvider.of<SetDateBloc>(context)
          //     .add(ReadMonthEvent());
          BlocProvider.of<SetDateBloc>(context)
              .add(CalculatePendarNumberOfIssueAndSumEvent(date: gregorianDate));
          BlocProvider.of<SetDateBloc>(context)
              .add(ReadAllIssuePerDateEvent(date: gregorianDate));
          BlocProvider.of<NumberOfIssuesPendarBloc>(context)
              .add(GetNumberOfIssuesPendarEvent(date: gregorianDate));
          BlocProvider.of<NumberOfIssuesFanarBloc>(context)
              .add(GetNumberOfIssuesFanarEvent(date: gregorianDate));
        },
        child: SizedBox(
          width: width / 20,
          height: height / 40,
          child: Image.asset(
            key: keyBottomNavigation4,
            "assets/main_page_first_container_logo/right_arrow.png",
          ),
        ),
      ),
    );
  }
}