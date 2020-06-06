import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:login_signup/Test.dart';
import 'package:intl/intl.dart';
import 'dart:core';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';



class add_auc extends StatefulWidget
{
  final String value;
  add_auc({Key key,this.value}) : super(key:key);
  @override
  State<StatefulWidget> createState()=> new Gotoadd_auc();
     
}

//we use underscore before a class name to make it private

class Gotoadd_auc extends State<add_auc> {

  final db = Firestore.instance;
  final formkey = new GlobalKey<FormState>();
  final _firebaseauth = FirebaseAuth.instance;



  //void validateandsafe() {
    //final form = formkey.currentState;
    //if (form.validate()) {
      //form.save();
      //print(
        //  'Form is valid Product Name : $_prodname, Category : $_category, Description : $_description ');
    //} else {
      //print(
        //  'Form is in-valid Product Name : $_prodname, Category : $_category, Description : $_description ');
    //}
  //}

  final format = DateFormat("yyyy-MM-dd HH:mm");
  DateTime _value;
  //String _prodname;
   int id;
  //String _price;
  String _category;
  var rating = 0.0;
  var rate,review;

  //String _description;
  String _condition;

  var name,name2,name3,name4;

  getProductname(name)
  {
    this.name= name;
  }
  getcondition(_condition)
  {
    this._condition=_condition;
  }

  getvalue(_value)
  {
    this._value= _value;
  }

  getprice(name2)
  {
    this.name2=name2;
  }

  getCategory(_category)
  {
    this._category=_category;
  }

  getdescription(name3)
  {
    this.name3=name3;
  }
  getBID(name4)
  {
    this.name4=name4;
  }
  getrating(rate)
  {
    this.rate=rate;
  }
  getreviews(review)
  {
    this.review=review;
  }


  var now = DateTime.now();




  crateDATA() {

    DocumentReference ds= Firestore.instance.collection('Add_Auction').document();
    Map<String, dynamic> Auction = {
      "productname": name,
      "Condition": _condition,
      "Baseprice": name2,
      "Date": _value,
      "Category": _category,
      "Description": name3,
      "Id": ds.documentID,
      "searchkey": name[0],
      "BID": name4,
      "Rating": rate,
      "Review": review

    };
    ds.setData(Auction).whenComplete(() {
      print("Auction Added");
      Check();
    });
  }
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';
  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 6,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarTitle: "Select Images",
          allViewTitle: "All Photos",
          useDetailsView: false,
          //selectCircleStrokeColor: "#000000",
        ),
      );

      for (var r in resultList) {
        var t = await r.filePath;
        print(t);
      }
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  Check(){
       DocumentReference ds = Firestore.instance.collection('User_Auctions')
           .document("${widget.value}").collection('AUCTIONS')
           .document();

      Map<String,dynamic> Auction={
        "productname": name,
        "Condition": _condition,
        "Baseprice": name2,
        "Date": _value,
        "Category": _category,
        "Description": name3,
        "Id" : ds.documentID,
        "searchkey" : name[0],
      };
      ds.setData(Auction).whenComplete((){
        print("Another table created");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> TEST()));
      });
  }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: new AppBar(title: new Text('Add Auction'),),
          resizeToAvoidBottomPadding: false,
          body: SingleChildScrollView(
              child: new Container(
                  padding: EdgeInsets.all(16.0),
                  child: new Form(
                    key: formkey,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 25.0),
                          child: TextField(
                            onChanged: (String name) {
                              getProductname(name);

                            },
                            decoration: new InputDecoration(
                              labelText: 'Product Name',
                              icon: Icon(Icons.view_module),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    20.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(

                                borderRadius: BorderRadius.all(Radius.circular(
                                    20.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 25.0),
                          child: new DropdownButtonFormField<String>(
                            value: _condition,
                            items: [
                              "1",
                              "2",
                              "3",
                              "4",
                              "5",
                              "6",
                              "7",
                              "8",
                              "9",
                              "10"
                            ]
                                .map((label) =>
                                DropdownMenuItem(
                                  child: Text(label),
                                  value: label,
                                ))
                                .toList(),
                            onChanged: (value) {
                              setState(() => _condition = value);
                            },

                            decoration: new InputDecoration(
                              labelText: 'Condition',
                              icon: Icon(Icons.menu),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    20.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    20.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            validator: (value) =>
                            value.isEmpty
                                ? 'Condition can not be empty'
                                : null,
                            onSaved: (value) => getcondition(_condition),


                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 25.0),
                          child: TextField(
                            onChanged: (String name2) {
                              getprice(name2);
                            },

                            decoration: new InputDecoration(
                              labelText: 'Base Price',
                              icon: Icon(Icons.payment),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    20.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(

                                borderRadius: BorderRadius.all(Radius.circular(
                                    20.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),

                        /*Padding(
                          padding: EdgeInsets.only(top: 25.0),
                          child: DateTimeField(
                            decoration: new InputDecoration(
                              labelText: 'Choose Auction Starting Time and Date',
                              icon: Icon(Icons.timelapse),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    20.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    20.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            initialValue: _value,
                            format: format,
                            onShowPicker: (context, currentValue) async {
                              await showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) {
                                    return CupertinoDatePicker(
                                      onDateTimeChanged: (DateTime date) {
                                        _value = date;
                                      },
                                    );
                                  });
                              setState(() {});
                              return _value;
                            },
                            onSaved: (value) => getvalue(_value),
                          ),
                        ),*/

                        Padding(
                          padding: EdgeInsets.only(top: 25.0,left: 10.0,right: 10.0),
                          child:
                          new FlatButton.icon(
                            label: Text("Add Images", style: new TextStyle(
                                fontSize: 22.0, color: Colors.white)),
                            icon: Icon(Icons.add_a_photo, size: 32,),
                            color: Colors.blue,
                            textColor: Colors.white,
                            disabledColor: Colors.grey,
                            disabledTextColor: Colors.black,
                            padding: EdgeInsets.all(8.0),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            splashColor: Colors.blueAccent,
                            onPressed: loadAssets,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 25.0,left: 10.0,right: 10.0),
                            child: buildGridView()
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 25.0),
                          child: new DropdownButtonFormField<String>(
                            value: _category,
                            items: ["Vehicles", "Property", "Mobile Phones"]
                                .map((label) =>
                                DropdownMenuItem(
                                  child: Text(label),
                                  value: label,
                                ))
                                .toList(),

                            onChanged: (value) {
                              setState(() => _category = value);
                            },

                            decoration: new InputDecoration(
                              labelText: 'Category',
                              icon: Icon(Icons.category),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    20.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    20.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            validator: (value) =>
                            value.isEmpty
                                ? 'Category can not be empty'
                                : null,
                            onSaved: (value) => _category = value,
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 25.0),
                          child: TextField(
                            onChanged: (String name3) {
                              getdescription(name3);
                            },
                            decoration: new InputDecoration(
                              labelText: 'Description (Minimum 20 words)',
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 40, horizontal: 12),
                              icon: Icon(Icons.description),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    20.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    20.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25.0),
                          child: TextField(
                            onChanged: (String name4) {
                              getBID(name4);
                            },
                            decoration: new InputDecoration(
                              labelText: 'BID',
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 40, horizontal: 12),
                              icon: Icon(Icons.description),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    20.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    20.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            //  validator: (value) =>
                            //value.isEmpty
                            //  ? 'Description can not be empty'
                            // : null,
                            //onSaved: (value) => getdescription(_description),
                          ),
                        ),

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
                            label: Text('Add Auction', style: new TextStyle(
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
                            crateDATA,
                          ),),
                      ],
                    ),
                  )
              )
          )
      );
    }

    //void createdata() async {
    //if (formkey.currentState.validate()) {
    //formkey.currentState.save();
    //DocumentReference ref = await db.collection('AddAuction').add(
    // {'Productname': '$_prodname'});
    //Firestore.instance.collection('AddAuction').add({'Condition': '$_condition'});
    //Firestore.instance.collection('AddAuction').add({'Base Price': '$_price'});
    //Firestore.instance.collection('AddAuction').add({'Date and time': '$_value'});
    //Firestore.instance.collection('AddAuction').add({'Category': '$_category'});
    //Firestore.instance.collection('AddAuction').add({'Description': '$_description'});
    // ref.collection('AddAuction').add({'Base Price': '$_price'});
    //db.collection('AddAuction').add({'Date and time': '$_value'});
    //db.collection('AddAuction').add({'Category': '$_category'});
    //db.collection('AddAuction').add({'Category': '$_category'});
    //db.collection('AddAuction').add({'Description': '$_description'});
    //setState(() => id = ref.documentID);
    //print(ref.documentID);

    // Firestore.instance.collection('AddAuction').add({'Category': '$_category'});

    //}
    // }

  }
