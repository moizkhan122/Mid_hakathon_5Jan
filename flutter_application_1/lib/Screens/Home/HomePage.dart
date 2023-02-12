import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Screens/FirebaseServices/SplashServices.dart';
import 'package:flutter_application_1/Screens/ProductHome/product.dart';
import 'package:flutter_application_1/Screens/loginPage/LoginPage.dart';
import 'package:flutter_application_1/widget/text.dart';
import 'package:flutter_application_1/widgets/container.dart';

import '../../utills/utils/Colors.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
    
  ///////////////////////////////////////
    final searchcontr = TextEditingController();
    final auth =  FirebaseAuth.instance;
  List productsx = []; 
  @override
  void initState() {
    fatchProducts();
    super.initState();
  }
    final fireStore = FirebaseFirestore.instance;
    fatchProducts()async{
      QuerySnapshot qn =await fireStore.collection('products').get();

      setState(() {
        for(int i = 0; i < qn.docs.length ; i++){
          productsx.add({
            'pid' : qn.docs[i]['pid'],
            'pName' : qn.docs[i]['pName'],
            'IsFavourite' : qn.docs[i]['IsFavourite'],
            'Price' : qn.docs[i]['Price'],
            'image' : qn.docs[i]['image'], 
          });
        }
      });
    }
  
  List<Map> FavPro = [];
   ///////////////////////////////////////
   ///
  Widget build(BuildContext context) {
    TextEditingController controller1 = new TextEditingController();
    double topPadding = 20.0;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left:10),
          child: Image.asset("assets/images/Logo_1.png", scale: 0.1,),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("PLANTIFY", style: TextStyle(
          color: Colors.black,
          fontSize: 30.0
        ),),
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
            }).onError((error, stackTrace){
              SplashServices().ToastMessge(error);
            });
          }, icon: Icon(Icons.logout,size: 25,color: Colors.black,), color: Colors.black, iconSize: 30,),
          IconButton( onPressed: () {
               // List<Map> tempP = [];
                
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             (favproduct: tempP)));
              },
           icon: Icon(Icons.favorite,size: 25,color: Colors.red,)),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset("assets/images/Banner.png"),
            ),
            Padding(
               padding: EdgeInsets.only(top: topPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Container(
              width: 250,
             //color: Colors.green,
              height: 50,
              //decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: 
                  TextFormField(
                    controller: searchcontr,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search,color: Colors.grey,),
                      hintText: "search Product"),
                      onChanged: (value) {
                        setState(() {
                          
                        });
                      },
                  )
           
           ),
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               border: Border.all(
                color: AppColors.Icon_color,
               )
              ),
              child: Center(child: Image.asset("assets/images/filter.png", fit: BoxFit.cover,)),
          )
                ],
              ),
            ),
            SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      textWidget(text: "Top Pick",size: 18,color: Colors.green,),
                      SizedBox(height: 5,),
                      container(
                        height: 3, 
                        width: 70, 
                        radius: BorderRadius.circular(24),color: Colors.green,)
                    ],
                  ),
                  SizedBox(width: 10,),
                  textWidget(text: "In door",size: 18,color: Colors.black,),
                  SizedBox(width: 10,),
                  textWidget(text: "Out Door",size: 18,color: Colors.black,),
                  SizedBox(width: 10,),
                  textWidget(text: "Seed",size: 18,color: Colors.black,),
                  SizedBox(width: 10,),
                  textWidget(text: "Plants",size: 18,color: Colors.black,),
                ],
              ),
            ),
            SizedBox(height: 10,),


              Container(
                height: 270,
                width: double.infinity,
                child: Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: productsx.length,
                    itemBuilder: (context, index) {
                      final pName  = productsx[index]['pName'].toString();
                    // if(pro.connectionState == ConnectionState.waiting){
                      //   return CircularProgressIndicator();
                      // }
                      // if(snapshot.hasError){
                      //   return Text("Some Error");
                      // }
                    if(searchcontr.text.isEmpty){
                      return  Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(
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
                color: Colors.greenAccent.withOpacity(0.4),
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
          Positioned(child: Text(productsx[index]['pName'].toString(), style: TextStyle(
            fontSize: 23,
            color: AppColors.Icon_color,
          ),),
          top: 80,
          left: 20,
          ),
          Positioned(child: Text(productsx[index]['Price'].toString(), style: TextStyle(
            fontSize: 25,
            color: AppColors.Icon_color,
          ),),
          top: 160,
          left: 20,
          ),
          Positioned(
            bottom: 30,
            right: -50,
            child: InkWell(
              onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => product(
                       ProductInfoo: productsx[index],
                    ),));
                  },
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(productsx[index]['image']),fit: BoxFit.cover)
                ),
              ),
            )),
            Positioned(
              top: 160,
              left: 120,
              child: InkWell(
              //  onTap: () {
              //       if (!snapshot.data!.docs[index]['IsFavourite']) {
              //         // favouriteproduct.add(products[index]);
              //         setState(() {
              //           productss[index]['IsFavourite'] = true;
              //           productss.forEach((element) {
              //   if (element['IsFavourite'] == true) {
              //     return FavPro.add(element);
              //   }
              //   print(FavPro);
              //   });
              //         });
              //       } else {
              //         FavPro.remove(productss[index]);
              //         setState(() {
              //           productss[index]['IsFavourite'] = false;
              //         });
              //       }
              //     },
                child: Icon(Icons.favorite,
                    color: productsx[index]['IsFavourite'] == true
                        ? Colors.red
                        : Colors.black,))),
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
    ),
                );
                    }else if(pName.toLowerCase().contains(searchcontr.text.toLowerCase().toString())){
                      return  Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(
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
                color: Colors.greenAccent.withOpacity(0.4),
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
          Positioned(child: Text(productsx[index]['pName'].toString(), style: TextStyle(
            fontSize: 23,
            color: AppColors.Icon_color,
          ),),
          top: 80,
          left: 20,
          ),
          Positioned(child: Text(productsx[index]['Price'].toString(), style: TextStyle(
            fontSize: 25,
            color: AppColors.Icon_color,
          ),),
          top: 160,
          left: 20,
          ),
          Positioned(
            bottom: 30,
            right: -50,
            child: InkWell(
              onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => product(
                       ProductInfoo: productsx[index],
                    ),));
                  },
              child: Container(
                height: 60,
                width: 60,
                color: Colors.blue,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(productsx[index]['image']),fit: BoxFit.cover)
                ),
              ),
            )),
            // ignore: prefer_const_constructors
            Positioned(
              top: 160,
              left: 120,
              child: InkWell(
              //  onTap: () {
              //       if (!snapshot.data!.docs[index]['IsFavourite']) {
              //         // favouriteproduct.add(products[index]);
              //         setState(() {
              //           productss[index]['IsFavourite'] = true;
              //           productss.forEach((element) {
              //   if (element['IsFavourite'] == true) {
              //     return FavPro.add(element);
              //   }
              //   print(FavPro);
              //   });
              //         });
              //       } else {
              //         FavPro.remove(productss[index]);
              //         setState(() {
              //           productss[index]['IsFavourite'] = false;
              //         });
              //       }
              //     },
                child: Icon(Icons.favorite,
                    color:Colors.black,))),
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
    ),
                );
                    }
                    else{
                      return Container();
                    }
                },))
                   
              ),

              Padding(
                padding: EdgeInsets.only(top: topPadding + 20),
                child: Image.asset("assets/images/line.png"),
              ),
              Padding(
                padding: EdgeInsets.only(top: topPadding),
                child: Text("Plant a Life", style: TextStyle(
                  color: AppColors.Icon_color,
                  fontSize: 36,
                ),),
              ),
              Padding(
                padding: EdgeInsets.only(top: topPadding-15),
                child: Text("Live Amongst Living", style: TextStyle(
                  color: AppColors.Icon_color,
                  fontSize: 28,
                ),),
              ),
              Padding(
                padding: EdgeInsets.only(top: topPadding-15),
                child: Text("Spread the joy", style: TextStyle(
                  color: AppColors.Icon_color,
                  fontSize: 24,
                ),),
              ),
          ],
        ),
      ), 
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
           boxShadow: [
      BoxShadow(
        color: Colors.black,
        offset: Offset(0, 20),
        blurRadius: 20,
        spreadRadius: 1,
      ),
    ],
    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight:  Radius.circular(20))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                   Padding(
                     padding: const EdgeInsets.only(left: 0),
                     child: IconButton(onPressed: (){}, icon: Icon(Icons.home_rounded), color: Colors.black, iconSize: 30,),
                   ),
                   Padding(
                      padding: const EdgeInsets.only(left: 30),
                     child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined), color: Colors.black, iconSize: 30,),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 30),
                     child: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_bag_outlined), color: Colors.black, iconSize: 30,),
                   ),
                   Padding(
                      padding: const EdgeInsets.only(left: 30),
                     child: IconButton(onPressed: (){}, icon: Icon(Icons.person_outline), color: Colors.black, iconSize: 30,),
                   )
          ],
                ),
            ],
          ), 
        )
      ),
    );
  }
}