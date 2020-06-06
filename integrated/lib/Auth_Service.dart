import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_signup/Test.dart';
import 'package:rxdart/rxdart.dart';


class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final Firestore db= Firestore.instance;

  Observable<Map<String,dynamic>> profile;
  Observable<FirebaseUser> user;
  PublishSubject loading = PublishSubject();

  AuthService(){
   user = Observable(_auth.onAuthStateChanged);
   profile = user.switchMap((FirebaseUser u)
   {
   if(u!=null)
     {
       return db.collection('users').document(u.uid).snapshots().map((snap)=>snap.data);
     }else
       {
         return Observable.just({});
       }
   });

  }

  Future<FirebaseUser> googleSignIn() async {
    // Start
    loading.add(true);

    // Step 1
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    // Step 2
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //FirebaseUser user = await _auth.signInWithGoogle(
        //accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    // Step 3


    final FirebaseUser user = (await _auth.signInWithCredential(credential)) as FirebaseUser;
    updateUserdata(user);
    print("signed in " + user.displayName);
    // Done
    loading.add(false);
    return user;
  }

  void updateUserdata(user) async{
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> TEST(value: googleAuth.idToken )));
    DocumentReference ref = db.collection('Registration').document(user.uid);

    return ref.setData({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoUrl,
      'displayName': user.displayName,
      'lastSeen': DateTime.now()
    }, merge: true);

  }

  void signout()
  {
    _auth.signOut();
  }


}
final AuthService authService = AuthService();

