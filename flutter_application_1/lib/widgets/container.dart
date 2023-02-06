import 'package:flutter/material.dart';
import 'package:flutter_application_1/utills/Colors.dart';

class container extends StatelessWidget {
  const container({
    Key? key, this.color = Colors.white,
     required this.height, required this.width,
    required this.radius,
    this.edgeInsets = const EdgeInsets.symmetric(horizontal: 10),
   this.child = const SizedBox(),
  }) : super(key: key);
  
  final Widget child;
  final double height;
  final double width;
    final Color color;
    final EdgeInsets edgeInsets;
    final BorderRadius radius;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: edgeInsets,
      padding: edgeInsets,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: radius),
        child: child,
    );
  }
}