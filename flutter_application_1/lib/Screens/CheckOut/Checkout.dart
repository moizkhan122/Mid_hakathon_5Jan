import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Drawer/Drawer.dart';
import 'package:flutter_application_1/Screens/OrderRecieve/OrderRecieve.dart';
import 'package:flutter_application_1/utills/Colors.dart';
import 'package:flutter_application_1/widgets/text.dart';


// ignore: must_be_immutable
class CheckOut extends StatefulWidget {
   CheckOut({super.key, required this.cartProducts,});

  // List<Map> products = [
  //   {"Pid": "1","image" : "assets/p1.png","Pname" : "WaterMelon Peproni","Price" : "Rs 350","IsFavourite" : false},
  //   {"Pid": "1","image" : "assets/p2.png","Pname" : "WaterMelon Shapater","Price" : "Rs 450","IsFavourite" : false},
  //   {"Pid": "1","image" : "assets/p3.png","Pname" : "Castus","Price" : "Rs 550","IsFavourite" : false},
  // ];
      final List<Map> cartProducts;

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
      int count = 0;
      double totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
               backgroundColor: AppColors.whiteColor,
              elevation: 0,
              leading: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Image.asset("assets/top.png")),
              title: textWidget(text: "PLANTIFY",size: 25,color: AppColors.blackColor,),
              actions: [
                Icon(Icons.search,size: 33,color: AppColors.blackColor,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => drawer(),));
                  },
                  child: Image.asset("assets/Menu.png")),
              ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            
                      textWidget(text: "YOUR BLOG",size: 30,color: AppColors.GreenColor,),
                    
                    
                      Container(
                        height: MediaQuery.of(context).size.height*0.4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        //color: AppColors.PurpleColor
                      ),
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 10
                        ),
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: widget.cartProducts.length,
                        itemBuilder: (context, index) {
                        return Container(
                        height: 100, 
                        width: double.infinity, 
                        
                        //color: AppColors.greyColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(height:90,
                            margin: EdgeInsets.symmetric(horizontal: 0),
                            width: 90,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(widget.cartProducts[index]['image']),fit: BoxFit.cover),
                              //color: AppColors.GreenColor
                              ),
                            ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textWidget(text:widget.cartProducts[index]['Pname'],size: 16,color: AppColors.blackColor,),
                                SizedBox(height: 10,),
                                Row(children: [
                                  Container(height: 25,
                                   width: 30, 
                                   decoration: BoxDecoration(
                                    //color: AppColors.PurpleColor,
                                    border: Border.all(color: AppColors.blackColor),
                                    borderRadius: BorderRadius.circular(10),),
                                   child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        count--;
                                        totalPrice -= widget.cartProducts[index]['Price'];
                                      });
                                    },
                                    child: Icon(Icons.remove)),
                                   ),
                                   textWidget(text: count.toString(),size: 23,color: AppColors.blackColor,),
                                   Container(height: 25,
                                   width: 30, 
                                   decoration: BoxDecoration(
                                    //color: AppColors.PurpleColor,
                                    border: Border.all(color: AppColors.blackColor),
                                    borderRadius: BorderRadius.circular(10),),
                                   child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        count++;
                                        totalPrice += widget.cartProducts[index]['Price'];
                                        print(totalPrice.toString());
                                      });
                                    },
                                    child: Icon(Icons.add)),
                                   ),
                                   SizedBox(width: 10,),
                                   InkWell(
                                    onTap: (){
                                      
                                    },
                                    child: Icon(Icons.delete))
                                ],)
                                ],),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10,),
                                    Icon(Icons.bookmark_border_sharp,color: AppColors.GreenColor,size: 30,),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10,),
                                  textWidget(text: widget.cartProducts[index]['Price'],size: 15,color: AppColors.blackColor,)
                                  ],
                                )
                          ]),
                        );
                      },),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: AppColors.GreenColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(30),
                              ),
                              child: Icon(Icons.car_crash_outlined,size: 30,color: AppColors.GreenColor,),
                            ),
                            SizedBox(width: 15,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    textWidget(text: "Delievery",size: 17,color: AppColors.blackColor,),
                                    SizedBox(width: 10,),
                                    Container(height: 10,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: AppColors.GreenColor,
                                      borderRadius: BorderRadius.circular(12)
                                    ),
                                    child: FractionallySizedBox(
                                    widthFactor: 0.5,
                                    heightFactor: 0.5,
                                    child: Container(
                                      //color: AppColors.RedColor,
                                    ),
                                  ),
                                    )
                                  ],),
                                  textWidget(text: "Order Above 1200 to get",size: 17,color: AppColors.blackColor,),
                                  Row(
                                    children: [
                                      textWidget(text: "Free delievery ",size: 17,color: AppColors.blackColor,),
                                      textWidget(text: "1200 to get",size: 17,color: AppColors.GreenColor,),
                                    ],
                                    
                                  ),
                              ],),


















                              SizedBox(width: 30,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  textWidget(text: totalPrice.toString(),size: 20,color: AppColors.blackColor,),
                                SizedBox(height: 30,),
                                ],
                              )
                        ],),
                    SizedBox(height: 13,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: AppColors.GreenColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(30),
                              ),
                              child: Icon(Icons.car_crash_outlined,size: 30,color: AppColors.GreenColor,),
                            ),
                            textWidget(text: "Apply Coupon",size: 20,fontWeight: FontWeight.bold,color: AppColors.blackColor,),
                            textWidget(text: "______________",size: 23,color: AppColors.GreenColor,fontWeight: FontWeight.bold,)
                      ],),
                      SizedBox(height: 10,),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                            textWidget(text: "Total",size: 30,fontWeight: FontWeight.bold,color: AppColors.blackColor,),
                            textWidget(text: totalPrice.toString(),size: 25,color: AppColors.blackColor,fontWeight: FontWeight.bold,)
                      ],),
                       SizedBox(height: 10,),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                            textWidget(text: "Saved for Later",size: 25,color: AppColors.GreenColor,),
                            textWidget(text: "6 Item",size: 20,color: AppColors.GreenColor,)
                      ],),
                        SizedBox(height: 10,),
                        Container(
                        height: 100, 
                        width: double.infinity, 
                        
                        //color: AppColors.greyColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(height:90,
                            margin: EdgeInsets.symmetric(horizontal: 0),
                            width: 90,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/p4.png"),fit: BoxFit.cover),
                              //color: AppColors.GreenColor
                              ),
                            ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textWidget(text:"large Scale Zakena",size: 16,color: AppColors.blackColor,),
                                SizedBox(height: 10,),
                                Row(children: [
                                  Container(height: 25,
                                   width: 30, 
                                   decoration: BoxDecoration(
                                    //color: AppColors.PurpleColor,
                                    border: Border.all(color: AppColors.blackColor),
                                    borderRadius: BorderRadius.circular(10),),
                                   child: Icon(Icons.remove),
                                   ),
                                   textWidget(text: " 1 ",size: 23,color: AppColors.blackColor,),
                                   Container(height: 25,
                                   width: 30, 
                                   decoration: BoxDecoration(
                                    //color: AppColors.PurpleColor,
                                    border: Border.all(color: AppColors.blackColor),
                                    borderRadius: BorderRadius.circular(10),),
                                   child: Icon(Icons.add),
                                   ),
                                   SizedBox(width: 10,),
                                   Icon(Icons.delete)
                                ],)
                                ],),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10,),
                                    Icon(Icons.bookmark_border_sharp,color: AppColors.GreenColor,size: 30,),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10,),
                                  textWidget(text: "Rs 600",size: 15,color: AppColors.blackColor,)
                                  ],
                                )
                          ]),
                        ),
                     
                    ],
                  ),
                  
                ]),
            ),
          ),
          bottomNavigationBar: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        InkWell(
                          onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => OrderRecieved(),)),
                          child: textWidget(text: "CheckOut",size: 20,color: AppColors.whiteColor,fontWeight: FontWeight.bold,)),
                        textWidget(text: widget.cartProducts[0]['Price'],size: 20,color: AppColors.whiteColor,fontWeight: FontWeight.bold,),
                      ]),
                    ),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.GreenColor,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))),
                      ),
    );
  }
}