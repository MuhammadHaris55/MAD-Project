import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'customtiles.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart'; 

class ProductFeedback extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()=> new _GotoProduct_Feedback();
     
}

//we use underscore before a class name to make it private

class _GotoProduct_Feedback extends State<ProductFeedback> {
  var rating = 0.0;
  var rate,review;
  final formkey = new GlobalKey<FormState>();

  void validateandsafe() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
    }
  }

  getrating(rate)
  {
    this.rate=rate;
  }
  getreviews(review)
  {
    this.review=review;
  }

  justDATA(){
  DocumentReference ds= Firestore.instance.collection('Rating').document();

  Map<String,dynamic> Rating={
    "Rating": rate,
    "Reviews": review,
    //"Id" : EmailAuthProvider,
  };
  ds.setData(Rating).whenComplete((){
    print("Submitted");
  });
}


  @override
  Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(title: new Text('Product Feedback'),
       backgroundColor: Colors.blue,
       ),
       
       body:new Container(
         padding: EdgeInsets.all(16.0),
         child: new Form(
           key: formkey,
           child: new Column(
             
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
               
              Padding(
                padding: EdgeInsets.only(top: 25.0),
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
                      padding: EdgeInsets.only(top: 25.0),
                      child: TextField(
                        onChanged: (String value2){
                          getreviews(value2);
                        },
                      decoration: new InputDecoration(labelText: 'Reviews (Minimum 20 words)',
                      contentPadding: const EdgeInsets.symmetric(vertical: 40, horizontal: 12),
                      icon: Icon(Icons.rate_review),
                          enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                    ),
                   ),
                   ),

               Padding(
                 padding: EdgeInsets.only(top: 22.0),
                 child:
                 new FlatButton.icon(
                   label: Text('Submit', style: new TextStyle(
                       fontSize: 25.0, color: Colors.white)),
                   icon: Icon(Icons.save, size: 32,),
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
