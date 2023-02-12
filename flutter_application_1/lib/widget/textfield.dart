import 'package:flutter/material.dart';

import '../utills/utils/Colors.dart';
class text_field extends StatefulWidget {
  var left_icon= null;
  var Icon_color=null;
  String place_holder = "";
  String imagepath = "";
  final controler;
  text_field({this.left_icon,this.imagepath="",this.Icon_color, this.place_holder="", this.controler});

  @override
  State<text_field> createState() => _text_fieldState();
}

class _text_fieldState extends State<text_field> {
  var right_icon=null;

  @override
  Widget build(BuildContext context) {
    String image = this.widget.imagepath;
    print(image);
    return TextFormField(
                controller: widget.controler,
                decoration: InputDecoration(
                 // onChanged
                  prefixIcon: Icon(widget.left_icon,color: widget.Icon_color,),
                  suffix: Image.asset(image),
                  fillColor: Colors.white,
                  hintText: widget.place_holder,
                  filled: true,
                 border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.Icon_color,
                    width: 10
                    ),
                    borderRadius: BorderRadius.circular(20),
                 ),
                ),                  
              );
    
  }
}