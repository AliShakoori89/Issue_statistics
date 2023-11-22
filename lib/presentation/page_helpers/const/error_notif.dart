import 'package:flutter/material.dart';

class ErrorNotification extends StatelessWidget {
  const ErrorNotification({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      child: Center(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text('لطفا از اتصال به اینترنت اطمینان حاصل نمایید!',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: 19)),
          )),
    );;
  }
}
