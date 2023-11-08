import 'package:flutter/material.dart';

class ErrorNotification extends StatelessWidget {
  const ErrorNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 300),
      child: Center(
          child: Text('Your app don\'t have internet',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                  fontSize: 19))),
    );
  }
}
