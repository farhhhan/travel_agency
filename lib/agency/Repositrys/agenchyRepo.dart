import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_agency/agency/Model/agencyModel.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
class Agencyrepositry {
  User? user = FirebaseAuth.instance.currentUser;

  Future<List<AgencyModel>> get() async {
    List<AgencyModel> agencyList = [];
    try {
      final datas = await FirebaseFirestore.instance
          .collection('agency')
          .where('uid', isEqualTo: user!.uid).get();
      datas.docs.forEach((element) { 
       return agencyList.add(AgencyModel.fromJson(element.data()));
      });
      return agencyList;
    } catch (e) {
      print(e.toString());
      return agencyList;
    }
  }
  
 Future<void> updateAgency(AgencyModel agencyModel) async {
  try {
    if (agencyModel.profile != null) {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref('/foldername' + '1224');
      final uploadTask = ref.putFile(File(agencyModel.profile));
      await uploadTask;

      final newUrl = await ref.getDownloadURL();
      agencyModel.profile = newUrl ?? agencyModel.profile;
    }

    await FirebaseFirestore.instance
        .collection('agency')
        .doc(agencyModel.uid)
        .update(agencyModel.toJson());
  } catch (e) {
    // Handle errors appropriately
    print('Error updating agency: $e');
    throw e; // Rethrow the error to propagate it upwards
  }
}

}
