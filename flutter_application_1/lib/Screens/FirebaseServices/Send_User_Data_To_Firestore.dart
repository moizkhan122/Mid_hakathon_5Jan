import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Screens/FirebaseServices/SplashServices.dart';

class SendUserDataFireStore{
  sendUserDataToDBFireStore(email,date,_gender,pass)async{
    
    CollectionReference ref = FirebaseFirestore.instance.collection("user_data_form");
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    return ref.doc(id).set({
      "email" : email,
      "Date_of_Birth" : date,
      "Gender" : _gender,
      "password" : pass,
    });
  }
}