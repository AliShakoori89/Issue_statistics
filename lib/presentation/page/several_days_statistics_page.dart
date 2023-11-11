import 'package:flutter/material.dart';

import '../page_helpers/homepage_header.dart';

class SeveralDaysStatisticsPage extends StatelessWidget {
  const SeveralDaysStatisticsPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // SeveralDaysStatisticsPage(),
        HomePageHeader(width: width, height: height),
        const Divider(color: Colors.black87),
        SizedBox(
          height: height / 50,
        ),
      ],
    );
  }
}
