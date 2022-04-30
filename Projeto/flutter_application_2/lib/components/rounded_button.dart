// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function()? press;
  final Color color, textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = Colors.white,
    this.textColor = const Color.fromRGBO(18, 53, 143, 1),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(10),
      width: 200,
      height: 48,

      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),

        child: FlatButton(
          // padding: const EdgeInsets.symmetric(vertical: 10),
          color: color,
          onPressed: press,          
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              ),
          ),
        ),
      ),
    );
    
  }
}
