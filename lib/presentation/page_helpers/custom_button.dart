import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String buttonName;

  const CustomButton({super.key, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){

        },
        child: Text(buttonName));
  }
}
