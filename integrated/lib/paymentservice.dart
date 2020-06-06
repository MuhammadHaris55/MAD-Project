import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PaymentService{
  addCard(token){
    FirebaseAuth.instance.currentUser().then((user){
      Firestore.instance
          .collection('cards')
          .document(user.uid)
          .collection('tokens')
          .add({'tokenID':token}).then((val){
            print('saved');
      });
    });
  }
}