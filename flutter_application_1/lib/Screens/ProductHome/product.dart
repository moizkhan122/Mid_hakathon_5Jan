import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/CheckOut/Checkout.dart';
import 'package:flutter_application_1/Screens/Drawer/Drawer.dart';
import 'package:flutter_application_1/Screens/Favourite/Favourite.dart';
import 'package:flutter_application_1/Screens/FirebaseServices/SplashServices.dart';
import 'package:flutter_application_1/utills/const.dart';
import 'package:flutter_application_1/widget/text.dart';
class product extends StatefulWidget {
   product({super.key, required this.ProductInfoo});
   var ProductInfoo;

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
   
   Future AddToCart()async{
    final FirebaseAuth auth = FirebaseAuth.instance;
    var currentUser = auth.currentUser;
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection('users_cart_item');

    return _collectionRef.doc(currentUser!.email).collection('items').doc().set({
      'name' :widget.ProductInfoo['pName'],
      'price' :widget.ProductInfoo['Price'],
      'image' :widget.ProductInfoo['image'],
    }).then((value){
    SplashServices().ToastMessge("Added to cart");
    }).onError((error, stackTrace){
      SplashServices().ToastMessge(error);
    });
   }

   Future AddToFavourite()async{
    final FirebaseAuth auth = FirebaseAuth.instance;
    var currentUser = auth.currentUser;
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection('users_Fav_item');

    return _collectionRef.doc(currentUser!.email).collection('Fav_items').doc().set({
      'name' :widget.ProductInfoo['pName'],
      'price' :widget.ProductInfoo['Price'],
      'image' :widget.ProductInfoo['image'],
    }).then((value){
    SplashServices().ToastMessge("Added to Fav");
    }).onError((error, stackTrace){
      SplashServices().ToastMessge(error);
    });
   }

  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: l_green,
        leading: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },child: Image.asset("assets/img/logo.png")),
        title: Text("Plantify"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Favourite(),));
          }, 
          icon: Icon(Icons.favorite,size: 35,color: Colors.red,)),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => drawer(),));
            },
            child: Image.asset("assets/img/Menu_icn.png"))
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(         
               children: [
                Image.asset("assets/img/stack_img.png",scale: 0.2,),
                Positioned(
                  top: 50,
                  left: 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 300,
                         
                            child: Row(
                              children: [
                                Text("Air Purifier",style: TextStyle(fontWeight: FontWeight.bold),),
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset("assets/img/paw.png")
                              ],
                            ),
                          ),
                          Container(
                            width: 50,
                            child: Row(
                              children: [
                                Icon(Icons.star,color: d_green,),
                                Text("4.8",style: TextStyle(color: d_green),)
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
      
                              
                            ),
                          ),
                        ],
                      ),
                      Text(widget.ProductInfoo['pName'],style: TextStyle(fontSize: 20),),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Peperomia",style: TextStyle(fontSize: 35),),
                    
                     SizedBox(
                        height: 10,
                      ),
                      Text("Rs : "+(widget.ProductInfoo['Price']).toString(),style: TextStyle(fontSize: 15)),
                      
                     SizedBox(
                        height: 5,
                      ),
                      Text("\$350",style: TextStyle(fontWeight: FontWeight.bold)),
                      
                     SizedBox(
                        height: 10,
                      ),
                      Text("Size"),
                      
                     SizedBox(
                        height: 10,
                      ),
                      Text("5??? h",style: TextStyle(fontWeight: FontWeight.bold)),
                      
                     SizedBox(
                        height: 10,
                      ),
      
                    ],
                    
                  )),
                Positioned(
                  bottom: 20,
                  right: 27,
                  child: InkWell(
                onTap: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOut(),));
                },child: Container(
                  height:150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(image: NetworkImage(widget.ProductInfoo['image']),fit: BoxFit.cover)),
                  
                ))),
                  Positioned(
                    left: 40,
                    bottom: 0,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                           AddToCart();
                          },
                          child: Image.asset("assets/img/cart.png")),
                        
                          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users_Fav_item').doc(FirebaseAuth.instance.currentUser!.email).collection('items').where('name',isEqualTo: widget.ProductInfoo['name']).snapshots(),
            builder: (BuildContext context,AsyncSnapshot snapshot) {
              if(snapshot.data == null){
                return textWidget(text: " ");
              }
              return InkWell(
                          onTap: ()=> snapshot.data.docs.length == 0 ? AddToFavourite() : SplashServices().ToastMessge("Already Added"),
                          child:snapshot.data.docs.length == 0 ? 
                          Icon(Icons.favorite_outline_outlined,color: Colors.black,): 
                          Icon(Icons.favorite,color: Colors.red,));
            },
           ),
          
                      ],
                    )
                    ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Overview",style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                               ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/img/product_img1.png"),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("250ml",style: TextStyle(color: d_green),),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Water",style: TextStyle(color: Colors.grey),),
      
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        // height: 50,
                        // decoration: BoxDecoration(
                        //   color: Colors.amber,
                        // ),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/img/product_img2.png"),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("35-40%",style: TextStyle(color: d_green),),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Light",style: TextStyle(color: Colors.grey),),
      
                              ],
                            ),
                          ],
                        ),
                      ),
      
      
                      Container(
                        width: 100,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/img/product_img3.png"),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("250gm",style: TextStyle(color: d_green),),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Fertilizer",style: TextStyle(color: Colors.grey),),
      
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                    SizedBox(
                  height: 20,
                    ),
                  Text("Plant Bio",style: TextStyle(fontWeight: FontWeight.bold),),
                  
                    SizedBox(
                  height: 15,
                    ),
                  Text("No green thumb required to keep our artificial watermelon peperomia plant looking lively and lush anywhere you place it."),
                  SizedBox(
                    height: 15,
                  ),
                
                ],
              ),
            ),

             Padding(
               padding: const EdgeInsets.only(left: 20),
               child: Column(
                
                 children: [
                   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // width: 100,
                            // height: 80,
                            // decoration: BoxDecoration(
                            //   color: Colors.amber
                            // ),
                            child: Image.asset("assets/img/product_img4.png"),
                          ),

                          
                          Container(
                            // width: 100,
                            // height: 70,
                          
                            child: Image.asset("assets/img/product_img5.png"),
                          ),

                          
                          Container(
                            // width: 100,
                            height: 100,
                         
                                 child: Image.asset("assets/img/product_img6.png"),
                          ),
                          
                        ],
                       ),
                 ],
               ),
             ),
                 SizedBox(
                  height: 15,
                 ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Similar Plants",style: TextStyle(fontWeight: FontWeight.bold),),
                ),

                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/img/product_img7.png"),

                          Image.asset("assets/img/product_img8.png")
                      ],
                    ),
                    
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    color: yellow,    
                  ),
                 child: FractionallySizedBox(
                  heightFactor: 0.7,
                  widthFactor: 0.8,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("That very plant?",style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Just Scan and the AI "),
                            Text("will know exactly"),

                            SizedBox(
                              height: 20,
                            ),
                            Image.asset("assets/img/product_img9.png"),

                          ],
                        ),
                      
                            Image.asset("assets/img/product_img10.png"),  
                      ],

                    ),
                  ),
                 ),
                ),
          ],
        ),
      
      ),
      bottomNavigationBar: BottomAppBar(
        color: d_green,
        child: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOut(),)),
                      child: Icon(Icons.shopping_cart,size: 25,color: Colors.white,)),
                  ],
                ),
              ),
              Text("\$1090")
            ],
          ),
        ),
      ),
    );
  }
}