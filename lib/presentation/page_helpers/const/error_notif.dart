import 'package:flutter/material.dart';

class ErrorNotification extends StatelessWidget {
  const ErrorNotification({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      child: Center(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text('لطفا از اتصال به اینترنت اطمینان حاصل نمایید!',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15)),
          )),
    );;
  }
}
