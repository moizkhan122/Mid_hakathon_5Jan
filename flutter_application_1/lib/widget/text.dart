import 'package:flutter/material.dart';
import 'package:flutter_application_1/utills/Colors.dart';

class textWidget extends StatelessWidget {
  const textWidget({
    Key? key, required this.text,  this.size = 30,  this.color = Colors.black,  this.fontWeight:FontWeight.normal,
  }) : super(key: key);
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    ),
    );
  }
}