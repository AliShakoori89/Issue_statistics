import 'package:flutter/material.dart';

import '../page_helpers/date_picker_calendar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: height / 100,),
            DatePickerCalendar()
          ],
        ),
      ),
    );
  }
}
