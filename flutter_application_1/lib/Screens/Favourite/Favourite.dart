import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/FirebaseServices/SplashServices.dart';
import 'package:flutter_application_1/widget/circleAvatar.dart';
import 'package:flutter_application_1/widget/text.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users_Fav_item').doc(FirebaseAuth.instance.currentUser!.email).collection('Fav_items').snapshots(),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
            if(snapshot.hasError){
              SplashServices().ToastMessge('Some Error');
            }
             return ListView.builder(
                        // padding: EdgeInsets.symmetric(vertical: 10
                        // ),
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
                          return Card(
                            color: Colors.grey.withOpacity(0.3),
                            margin: EdgeInsets.symmetric(vertical: 5),
                            child: ListTile(
                              title: documentSnapshot['name'],
                              trailing: textWidget(text: (documentSnapshot['price']).toString()),
                              leading: circleAvator(
                                radius: 70, 
                                image: documentSnapshot['image']),
                            ),
                          );
              },);
          },
          )),
    );
  }
}