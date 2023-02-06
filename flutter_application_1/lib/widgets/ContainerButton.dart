import 'package:flutter/material.dart';
import 'package:flutter_application_1/utills/Colors.dart';

class ContainerButton extends StatelessWidget {
  const ContainerButton({
    Key? key, required this.text, required this.onpress, this.color = Colors.lime,this.txtcolor = Colors.white, required this.radius, this.size = 18,
  }) : super(key: key);
  final String text;
  final VoidCallback onpress;
  final Color color;
  final Color txtcolor;
  final BorderRadius radius;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: radius),
          child: Center(child: Text(text,style: TextStyle(fontSize:size,fontWeight: FontWeight.bold,color: txtcolor),)),
      ),
    );
  }
}

