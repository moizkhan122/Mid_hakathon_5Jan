
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Home/HomePage.dart';
import 'package:flutter_application_1/Screens/loginPage/LoginPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SplashServices{
  
  void islogin(BuildContext context){

    final auth  = FirebaseAuth.instance;

    final user = auth.currentUser;
    
    if(user != null){
      Timer(const Duration(seconds: 5),
        () => Navigator.push(context, MaterialPageRoute(builder: ((context) => HomePage()))));
    }else{
      Timer(const Duration(seconds: 5),
        () => Navigator.push(context, MaterialPageRoute(builder: ((context) => LoginPage()))));
    }

    
  }

  void ToastMessge(messge){
    Fluttertoast.showToast(
        msg: messge,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}