import 'package:cloud_firestore/cloud_firestore.dart';

class getqeryresult{
  gettheanswer(String productname){
    return Firestore.instance
        .collection('Add_Auction')
        .where('productname', isEqualTo: productname)
        .getDocuments();
  }
}