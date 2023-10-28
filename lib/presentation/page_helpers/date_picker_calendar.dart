import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../bloc/set_date_bloc/bloc.dart';
import '../bloc/set_date_bloc/event.dart';
import '../bloc/set_date_bloc/state.dart';


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
        },
        child: Container(
          height: height / 20,
          margin: EdgeInsets.only(
            right: width / 8,
            left: width / 8,
          ),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400]!.withOpacity(0.5),
                )
          ],
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                color: Colors.black,
                Icons.calendar_today,
                size: width / 25,
              ),
              SizedBox(
                width: width / 20,
              ),
              Text(
                  key: keyBottomNavigation3,
                  DateFormat('yyyy-MM-dd')
                      .format(DateTime.parse(date))
                      .toPersianDigit(),
                  style: TextStyle(
                    color: Colors.black,
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

          BlocProvider.of<SetDateBloc>(context)
              .add(WriteDateEvent(date: date, month: month));
          BlocProvider.of<SetDateBloc>(context).add(AddToDateEvent(
              date: DateFormat('yyyy-MM-dd')
                  .format(DateTime.parse(date))
                  .toString(),
              month: DateFormat('yyyy-MM')
                  .format(DateTime.parse(date))
                  .toString()));
          BlocProvider.of<SetDateBloc>(context)
              .add(ReadDateEvent());
          BlocProvider.of<SetDateBloc>(context)
              .add(ReadMonthEvent());
        },
        child: SizedBox(
          width: width / 20,
          height: height / 40,
          child: Icon(Icons.arrow_back_ios),
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

          BlocProvider.of<SetDateBloc>(context)
              .add(WriteDateEvent(date: date, month: month));
          BlocProvider.of<SetDateBloc>(context).add(AddToDateEvent(
              date: DateFormat('yyyy-MM-dd')
                  .format(DateTime.parse(date))
                  .toString(),
              month: DateFormat('yyyy-MM')
                  .format(DateTime.parse(date))
                  .toString()));
          BlocProvider.of<SetDateBloc>(context)
              .add(ReadDateEvent());
          BlocProvider.of<SetDateBloc>(context)
              .add(ReadMonthEvent());
        },
        child: SizedBox(
          width: width / 20,
          height: height / 40,
          child: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}