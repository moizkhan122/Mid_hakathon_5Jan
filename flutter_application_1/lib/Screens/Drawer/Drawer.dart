import 'package:flutter/material.dart';
import 'package:flutter_application_1/utills/Colors.dart';
import 'package:flutter_application_1/widgets/text.dart';

class drawer extends StatelessWidget {
  const drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
            child: Container(color: AppColors.GreenColor,
            child : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: ListView(
                children:[
               Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: textWidget(text: "x",color: AppColors.whiteColor,))),
               //define listile for number of icond below header
               SizedBox(height: 30,),
               ListTile(
                 leading: Icon(Icons.shop,color: AppColors.whiteColor,size: 30,),
                 title: textWidget(text: "Shop",size: 25,color: AppColors.whiteColor,fontWeight: FontWeight.bold,)
               ),
               SizedBox(height: 20,),
                ListTile(
                 leading: Icon(Icons.play_lesson_outlined,color: AppColors.whiteColor,size: 30,),
                 title: textWidget(text: "Plant Care",size: 25,color: AppColors.whiteColor,fontWeight: FontWeight.bold,)
               ),
               SizedBox(height: 20,),
               ListTile(
                 leading: Icon(Icons.comment,color: AppColors.whiteColor,size: 30,),
                 title: textWidget(text: "Comunity",size: 25,color: AppColors.whiteColor,fontWeight: FontWeight.bold,),
               ),
               SizedBox(height: 20,),
               ListTile(
                 leading: Icon(Icons.account_balance,color: AppColors.whiteColor,size: 30,),
                 title: textWidget(text: "My Account",size: 25,color: AppColors.whiteColor,fontWeight: FontWeight.bold,),
               ),
               SizedBox(height: 20,),
                     //its use for underline btw these items

                 ListTile(
                 leading: Icon(Icons.upload,color: AppColors.whiteColor,size: 30,),
                 title: textWidget(text: "Trcak Order",size: 25,color: AppColors.whiteColor,fontWeight: FontWeight.bold,),
               ),
               SizedBox(height: 40,),
               textWidget(text: "          Get The Dirt",size: 27,color: AppColors.whiteColor,),
               SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical:25),
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    side: const BorderSide(
                      width: 1.2,

                      color: Colors.white,
                    )),
                child: const Text(' Elevated Button')),
                SizedBox(height: 15,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textWidget(text: "Faq",size: 25,color: AppColors.whiteColor,fontWeight: FontWeight.bold,),
                    SizedBox(height: 10,),
                    textWidget(text: "About",size: 25,color: AppColors.whiteColor,fontWeight: FontWeight.bold,),
                SizedBox(height: 10,),
                textWidget(text: "Contact Us",size: 25,color: AppColors.whiteColor,fontWeight: FontWeight.bold,),
                  ],
                ),
                
              ],),
            ),
            ),
          );
  }
}