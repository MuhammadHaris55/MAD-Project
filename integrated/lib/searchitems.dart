/*
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_signup/products.dart';
import 'package:login_signup/task.dart';
import 'package:login_signup/Notifier.dart';
import 'package:login_signup/Searchqueries.dart';
import 'package:provider/provider.dart';



class Searchservice extends StatefulWidget {
  String value,value1;

  Searchservice({this.value,this.value1});
  @override
  _SearchserviceState createState() => _SearchserviceState();
}

class _SearchserviceState extends State<Searchservice> {

  bool reviewflag;
  var results;

  String get value1 => null;

  void initState() {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(
        context, listen: false);
    getTasks(foodNotifier);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.bars),
          onPressed: () {},
        ),
        title: Container(
          alignment: Alignment.center,
          child: Text("Tech POst", style: TextStyle()),
        ),
        actions: <Widget>[IconButton(
          icon: Icon(
            FontAwesomeIcons.newspaper,
            size: 20.0,
            color: Colors.white,
          ),
          onPressed: null,
        ),
        ],
      ),

      body:
      new
      ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(foodNotifier.taskList[index].value),
            subtitle: Text(foodNotifier.taskList[index].value1),
            onTap: () {
              foodNotifier.currenttask = foodNotifier.taskList[index];
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return ProductPage();
                  }));
            },
          );
        },
        itemCount: foodNotifier.taskList.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.black,
          );
        },
      ),

    );
  }


}









getTasks(FoodNotifier foodNotifier) async {
  QuerySnapshot snapshot = await Firestore.instance.collection('Add_Auction').getDocuments();

  List<Task> _taskList = [];

  snapshot.documents.forEach((document) {
    Task task = Task.fromMap(document.data);
    _taskList.add(task);
  });

  foodNotifier.taskList = _taskList;
}
*/


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_signup/products.dart';
import 'package:login_signup/task.dart';
import 'package:provider/provider.dart';
import 'package:login_signup/Notifier.dart';
import 'package:login_signup/loginpage.dart';

import 'Searchqueries.dart';


class service extends StatefulWidget {
  final String value;
  service({Key key,this.value}): super(key:key);
  @override
  _serviceState createState() => _serviceState();
}

class _serviceState extends State<service> {

  bool reviewflag;
  var results;


  @override
  void initState() {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context, listen: false);
    getTasks(foodNotifier);
    getqeryresult().gettheanswer(widget.value).then((
        QuerySnapshot docs) {
      if (docs.documents.isNotEmpty) {
        reviewflag = true;
        results = docs.documents[0].data;
      }
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.bars),
          onPressed: (){},
        ),
        title: Container(
          alignment: Alignment.center,
          child: Text("Filter results", style: TextStyle()),
        ),
        actions: <Widget>[IconButton(
          icon: Icon(
            FontAwesomeIcons.newspaper,
            size: 20.0,
            color: Colors.white,
          ),
          onPressed: null,
        ),
        ],
      ),

      body:
      new
      ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(results['productname']),
            //subtitle: Text(foodNotifier.taskList[index].category),
            onTap: () {
              foodNotifier.currenttask = foodNotifier.taskList[index];
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                return ProductPage();
              }));
            },
          );
        },
        itemCount: foodNotifier.taskList.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.black,
          );
        },
      ),



    );;
  }
}

getTasks(FoodNotifier foodNotifier) async {
  QuerySnapshot snapshot = await Firestore.instance.collection('Add_Auction').getDocuments();

  List<Task> _taskList = [];

  snapshot.documents.forEach((document) {
    Task task = Task.fromMap(document.data);
    _taskList.add(task);
  });

  foodNotifier.taskList = _taskList;
}

