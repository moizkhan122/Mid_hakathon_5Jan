import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/FirebaseServices/AuthCondition.dart';
import 'package:flutter_application_1/Screens/loginPage/LoginPage.dart';
import 'package:flutter_application_1/utills/Colors.dart';
import 'package:flutter_application_1/widgets/ContainerButton.dart';
import 'package:flutter_application_1/widgets/text.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

       final TextEditingController Password = TextEditingController();
   final TextEditingController email = TextEditingController();

  //Object Creation of Firebase
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void dispose(){
    // TODO: implement dispose
    super.dispose();
    //its means that is screen not avaible to remove it from memoery
    Password.dispose();
    email.dispose();
  }
  bool isSellected = true;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Align(
              alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                    },
                    child: Image.asset("assets/Group36.png"))),
                  SizedBox(height: 13,),
                  Row(
                    children: [
                      Image.asset("assets/top.png",),
                      SizedBox(width: 25,),
                      textWidget(text: "PLANITFY",size: 30,color: AppColors.blackColor,)
                    ],
                  ),
                  SizedBox(height: 20,),
                  textWidget(text: "SIGNUP ",size: 30,color: AppColors.GreenColor,) ,
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
                      textWidget(text: "Already Have an Account?",size: 18,color: AppColors.blackColor,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                        },
                        child: textWidget(text: " SignIn",size: 18,color: AppColors.GreenColor,)),
                    ],
                  ),
                  SizedBox(height: 35,),
                  ContainerButton(
                    text: "SignUp", 
                    onpress: (){
                      if (formkey.currentState!.validate()) {
                      firebaseAuth.createUserWithEmailAndPassword(
                        email: email.text.toString(), 
                        password: Password.text.toString());
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