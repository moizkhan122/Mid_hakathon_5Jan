import 'package:flutter/material.dart';
import 'package:flutter_application_1/utills/Colors.dart';
import 'package:flutter_application_1/widgets/ContainerButton.dart';
import 'package:flutter_application_1/widgets/text.dart';


class OrderRecieved extends StatelessWidget {
  const OrderRecieved({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading:InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Image.asset("assets/Group36.png")), ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical:100),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: textWidget(text: "Order",size: 30,fontWeight: FontWeight.bold,color: AppColors.GreenColor,)),
                Align(
                alignment: Alignment.center,
                child: textWidget(text: "Recieved",size: 30,fontWeight: FontWeight.bold,color: AppColors.GreenColor,)),
                SizedBox(height: 15,),
                Align(
                alignment: Alignment.center,
                child: textWidget(text: "Order Id #43300000",size:20,color: AppColors.blackColor,)),
                SizedBox(height: 20,),
                Align(
                alignment: Alignment.center,
                child: Image.asset("assets/shap.png",height: 170,width: 170,)),
                SizedBox(height: 35,),
                ContainerButton(
                  color: AppColors.GreenColor,
                  text: "Recieved", onpress: (){}, radius: BorderRadius.circular(15))
            ]),
        ),
      ),
    );
  }
}