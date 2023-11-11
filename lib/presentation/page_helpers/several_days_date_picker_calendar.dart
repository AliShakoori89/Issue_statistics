import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:issue_statistics/presentation/bloc/set_date_bloc/bloc.dart';
import 'package:issue_statistics/presentation/bloc/set_date_bloc/event.dart';
import 'package:issue_statistics/presentation/bloc/set_date_bloc/state.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';


class DailyDatePickerCalendar extends StatefulWidget {
  const DailyDatePickerCalendar({Key? key}) : super(key: key);

  @override
  State<DailyDatePickerCalendar> createState() => DailyDatePickerCalendarState();
}

class DailyDatePickerCalendarState extends State<DailyDatePickerCalendar> {

  String label = '';
  JalaliRange? picked ;
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
    BlocProvider.of<SetDateBloc>(context).add(ReadNumberOfIssuePerDateEvent(date: selectedDate));
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
        picked = await showPersianDateRangePicker(
          context: context,
          initialDateRange: JalaliRange(
            start: Jalali(1400, 1, 2),
            end: Jalali(1400, 1, 10),
          ),
          firstDate: Jalali(1385, 8),
          lastDate: Jalali(1450, 9),
        );

        setState(() {
          label =
          "${picked?.start.toJalaliDateTime() ?? ""} ${picked?.end.toJalaliDateTime() ?? ""}";
        });


        // BlocProvider.of<SetDateBloc>(context)
        //     .add(WriteDateEvent(date: gregorianDate, month: gregorianMonth));
        // BlocProvider.of<SetDateBloc>(context).add(AddToDateEvent(
        //     date: gregorianDate,
        //     month: gregorianMonth));
        // BlocProvider.of<SetDateBloc>(context)
        //     .add(ReadDateEvent());

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