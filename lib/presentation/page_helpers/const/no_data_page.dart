import 'package:flutter/material.dart';
import 'package:issue_statistics/presentation/page_helpers/const/error_notif.dart';

class NoDataPage extends StatelessWidget {
  const NoDataPage({super.key});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Image.asset(
          "assets/gif/statisticGif.gif",
          scale: 0.5,
          height: height / 2,
          width: width,
        ),
        const ErrorNotification()
      ],
    );
  }
}
