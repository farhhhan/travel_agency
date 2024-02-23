
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_agency/agency/agency_Navigator.dart';
import 'package:travel_agency/agency/Repositrys/auth.dart';

class FireStoreUser{
   FirebaseAuthentServices _authServices = FirebaseAuthentServices();
  void registerUser({required BuildContext context,required  String email,required String username,required String password,required String imageurls}) async {
   final db = FirebaseFirestore.instance;
    User? user = await _authServices.signUpWithEmailandPassword(
        email: email, password: password);
    if (user != null) {
      print('User Succesfully Created');
      final data = <String, String>{
        "Name": username,
        "Email": email,
        'profile':imageurls,
        'uid':FirebaseAuth.instance.currentUser!.uid
      };

          db.collection("agency").doc(FirebaseAuth.instance.currentUser!.uid).
          set(data);
         
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AgencyNavigator()));
    } else {
      print('Some thing error occures');
    }
  }
}