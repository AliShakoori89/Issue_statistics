import 'package:flutter/material.dart';

class HomePageHeader extends StatelessWidget {

  final double width;
  final double height;

  const HomePageHeader({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: 10,
          right: 10
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'تعداد گواهی صادر شده',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: width / 22),
          ),
          Text("نام مرکز صدور",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: width / 22)),
        ],
      ),
    );
  }
}
