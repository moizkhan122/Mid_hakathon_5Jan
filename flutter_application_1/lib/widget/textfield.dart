import 'package:flutter/material.dart';

import '../utills/utils/Colors.dart';
class text_field extends StatelessWidget {
  var left_icon= null;
  var right_icon=null;
  var Icon_color=null;
  String place_holder = "";
  String imagepath = "";
  text_field({this.left_icon,this.imagepath="",this.Icon_color, this.place_holder=""});

  @override
  Widget build(BuildContext context) {
    String image = this.imagepath;
    print(image);
    return TextField(
                
                decoration: InputDecoration(
                  prefixIcon: Icon(left_icon,color: Icon_color,),
                  suffix: Image.asset(image),
                  fillColor: Colors.white,
                  hintText: place_holder,
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