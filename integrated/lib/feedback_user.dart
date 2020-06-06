import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'Test.dart';

class UserFeedback extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()=> new _GotoUser_Feedback();
     
}

//we use underscore before a class name to make it private

class _GotoUser_Feedback extends State<UserFeedback>
{
var rating = 0.0;
var rate;

final formkey = new GlobalKey<FormState>();

void validateandsafe(){
 final form = formkey.currentState;
 if(form.validate())
 {
   form.save();
 }
}
getrating(rate)
{
  this.rate=rate;
}
justDATA(){
  DocumentReference ds= Firestore.instance.collection('User Rating').document();

  Map<String,dynamic> UserRating={
    "Rating": rate,
    //"Id" : EmailAuthProvider,
  };
  ds.setData(UserRating).whenComplete((){
    print("done");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> TEST()));

  });
}

  @override
  Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(title: new Text('Rate the User'),
       backgroundColor: Colors.blue,
       ),
       
       body:new Container(
         padding: EdgeInsets.all(16.0),
         child: new Form(
           key: formkey,
           child: new Column(
             
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
               
              Container(
                padding: EdgeInsets.only(top: 25.0),
                alignment: Alignment.center,
                child: SmoothStarRating(
                rating: rating,
                size: 45,
                starCount: 5,
                color: Colors.yellow,
                borderColor: Colors.lightGreen,
                spacing: 2.0,
                onRatingChanged: (value) {
                setState(() {
                rating = value;
                getrating(value);
                });
                },
                )
                ),
               Padding(
                 padding: EdgeInsets.only(top: 22.0),
                 child:
                 new FlatButton.icon(
                   label: Text('Feedback', style: new TextStyle(
                       fontSize: 25.0, color: Colors.white)),
                   icon: Icon(Icons.add, size: 32,),
                   color: Colors.blue,
                   textColor: Colors.white,
                   disabledColor: Colors.grey,
                   disabledTextColor: Colors.black,
                   padding: EdgeInsets.all(8.0),
                   shape: new RoundedRectangleBorder(
                       borderRadius: new BorderRadius.circular(30.0)),
                   splashColor: Colors.blueAccent,
                   onPressed:
                   justDATA,
                 ),),

            ],
           ),
           )
       ),
       );
  }
}
