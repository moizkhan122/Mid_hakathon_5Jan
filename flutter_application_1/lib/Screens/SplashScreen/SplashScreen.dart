import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/FirebaseServices/SplashServices.dart';
import 'package:flutter_application_1/Screens/loginPage/LoginPage.dart';
import 'package:flutter_application_1/utills/Colors.dart';
import 'package:flutter_application_1/widgets/ContainerButton.dart';
import 'package:flutter_application_1/widgets/container.dart';
import 'package:flutter_application_1/widgets/text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
    SplashServices splashServices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.islogin(context);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                container(
                  height: MediaQuery.of(context).size.height*0.6, 
                  width: double.maxFinite,
                  color: AppColors.GreenColor, 
                  radius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                  child: Stack(
                    children: [
                    Image.asset("assets/Vector.png"),
                    Positioned(
                      top: 140,
                      left: 55,
                      child: Image.asset("assets/Logo.png")),
                      Positioned(
                        top: 380,
                        left: 80,
                        child: textWidget(text: "PLANTIFY",size: 45,color: AppColors.whiteColor,))
                  ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textWidget(text: "GET READY",size: 35,color: AppColors.GreenColor,),
                    textWidget(text: "BE HYGENIC",size: 35,color: AppColors.GreenColor,),
                    SizedBox(height: 10,),
                    textWidget(text: "BE HYGENIC GET READY v GET READY GET READY v v vGET READY GET READY GET READY",size: 17,color: AppColors.GreenColor,),
                    SizedBox(height: 55,),
                    ContainerButton(text: "Go",
                     onpress: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                     },
                      radius: BorderRadius.circular(25),
                      color: AppColors.GreenColor,
                      )
                      ],
                    ),
                  ),
              ]),
          ),
    );
  }
}