import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String buttonName;

  const CustomButton({Key? key, required this.buttonName}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){

        },
        child: Text(buttonName));
  }
}
