import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Home/HomePage.dart';
import 'package:flutter_application_1/Screens/ProductHome/product.dart';
import 'package:flutter_application_1/Screens/signPage/SignPage.dart';
import 'package:flutter_application_1/utills/Colors.dart';
import 'package:flutter_application_1/widgets/ContainerButton.dart';
import 'package:flutter_application_1/widgets/text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

    TextEditingController Password = TextEditingController();
 TextEditingController email = TextEditingController();
  bool isSellected = true;

  final auth = FirebaseAuth.instance;
  islogin(){
    auth.signInWithEmailAndPassword(
      email: email.text.toString(), 
      password: Password.text.toString()
      ).then((value){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
      }).onError((error, stackTrace){
        print(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Align(
              alignment: Alignment.topLeft,
                  child: Image.asset("assets/Group36.png")),
                  SizedBox(height: 13,),
                  Row(
                    children: [
                      Image.asset("assets/top.png",),
                      SizedBox(width: 25,),
                      textWidget(text: "PLANITFY",size: 30,color: AppColors.blackColor,)
                    ],
                  ),
                  SizedBox(height: 20,),
                  textWidget(text: "LOGIN ",size: 30,color: AppColors.GreenColor,) ,
                  SizedBox(height: 10,),
                  textWidget(text: "LOGIN LOGIN LOGIN LOGIN LOGIN LOGIN V LOGIN LOGIN LOGIN ",size: 18,color: AppColors.GreenColor,)
              ,                   
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textWidget(text: "Email",size: 25,color: AppColors.GreenColor,),
                        SizedBox(height: 15,),
                        TextFormField(
                          controller: email,
                           
                         validator: (value) {
                            if(value!.isEmpty){
                              return "Enter Email";
                            }
                           if(!value.contains("@")){
                            return "Add @";
                           }
                           else{
                            return null;
                           }
                        }, 
                          decoration: InputDecoration(
                            border : OutlineInputBorder(),
                            hintText: "Enter Email",),
                        ),
                        SizedBox(height: 15,),
                        textWidget(text: "password",size: 25,color: AppColors.GreenColor,),
                        SizedBox(height: 15,),
                        TextFormField(
                          controller: Password,
                         validator: (value) {
                            if(value!.isEmpty){
                              return "Enter Password";
                            }
                           if(value.length<5){
                            return "length should be above 5";
                           }
                           else{
                            return null;
                           }
                        },
                            obscureText: isSellected,
                          decoration: InputDecoration(
                             suffixIcon: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    isSellected = !isSellected;
                                  });
                                },
                                child: Icon(isSellected ? Icons.visibility_off : Icons.visibility,color: AppColors.blackColor,)),
                            border : OutlineInputBorder(),
                            hintText: "Enter password",),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textWidget(text: "Don't Have an Account?",size: 18,color: AppColors.blackColor,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                        },
                        child: textWidget(text: " SignUp",size: 18,color: AppColors.GreenColor,)),
                    ],
                  ),
                  SizedBox(height: 25,),
                  ContainerButton(
                    text: "LOGIN", 
                    onpress: (){
                      if (formkey.currentState!.validate()) {
                        islogin();
                    }
                      
                    }, 
                    radius: BorderRadius.circular(15),
                    
                    color: AppColors.GreenColor,),
              ]),
          ),
        ),
      ),
    );
  }
}