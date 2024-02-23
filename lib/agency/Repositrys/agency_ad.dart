import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_agency/agency/Model/advatisment.dart';

class AdvRepo{
  
  Future<List<Ad>> get() async {
    List<Ad> advList = [];
    try {
      final datas = await FirebaseFirestore.instance
          .collection('ad_agency').get();
      datas.docs.forEach((element) { 
       return advList.add(Ad.fromJson(element.data()));
      });
      return advList;
    } catch (e) {
      print(e.toString());
      return advList;
    }
  }
}