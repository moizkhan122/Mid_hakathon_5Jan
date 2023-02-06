import 'package:flutter/material.dart';

import '../utills/utils/Colors.dart';

class ProductTile extends StatelessWidget {
  var bgColor;
  final String productImage;
  var productTitle;
  var price;
  
  ProductTile({this.bgColor,this.productTitle, required this.productImage,this.price});
  @override
  Widget build(BuildContext context) {
    print(productImage);
    return Container(
      width: 320,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(20),
                ),
            ),
          ),
          Positioned(child: Text("Air Purified", style: TextStyle(
            fontSize: 20,
            color: AppColors.Icon_color,
          ),),
          top: 60,
          left: 20,
          ),
          Positioned(child: Text(productTitle, style: TextStyle(
            fontSize: 40,
            color: AppColors.Icon_color,
          ),),
          top: 80,
          left: 20,
          ),
          Positioned(child: Text(price, style: TextStyle(
            fontSize: 25,
            color: AppColors.Icon_color,
          ),),
          top: 160,
          left: 20,
          ),
          Positioned(
            bottom: 50,
            right: -50,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(productImage))
              ),
            )),
            Positioned(
              top: 160,
              left: 120,
              child: Icon(Icons.favorite)),
              Positioned(
                top: 160,
                left: 180,
                child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/cart_Icon.png"))
              ),
            ))
        ],
      ),
    );
  }
}




