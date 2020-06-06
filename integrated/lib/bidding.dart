import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_signup/Searchqueries.dart';
import 'package:login_signup/searchitems.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_signup/Notifier.dart';
import 'package:login_signup/task.dart';
import 'package:login_signup/products.dart';


class biddingPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()=> new _GotoBidding();

}

//we use underscore before a class name to make it private

class _GotoBidding extends State<biddingPage> {
  final formkey = new GlobalKey<FormState>();

  void validateandsafe() {
    final form = formkey.currentState;
  }

 /* @override
  void initState() {
    super.initState();

    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(
        context, listen: false);
    getTasks(foodNotifier);
    getqeryresult().gettheanswer(productname, category).then((
        QuerySnapshot docs) {
      if (docs.documents.isNotEmpty) {
        reviewflag = true;
        results = docs.documents[0].data;
      }
    });
  }*/
  var name2;

  getprod(name2)
  {
    this.name2=name2;
  }

  String productname;
  String category;
  bool reviewflag;
  var results;

  var _textcontroller= new TextEditingController();
  @override
  Widget build(BuildContext context) {
//    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    return new Scaffold(
      appBar: new AppBar(title: new Text('i-BID'),
        backgroundColor: Colors.blue,
      ),
      body:Container(

          child: new Form(
            key: formkey,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: new TextField(
                    decoration: new InputDecoration(
                      labelText: 'Productname',
                      icon: Icon(Icons.input),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    controller: _textcontroller,

                   // onChanged: (String name2){
                     // getprod(name2);
                    //},
                    /*onChanged: (input),
                    validator: (value1) => value1.isEmpty ? 'No search keyword entered': null,
                    onSaved: (value1) => productname = value1,*/

                  ),),

                Padding(
                  padding: EdgeInsets.only(top: 22.0),
                  child:
                  new FlatButton.icon(
                    label: Text('Search Fields', style: new TextStyle(
                        fontSize: 25.0, color: Colors.white)),
                    icon: Icon(Icons.search, size: 32,),
                    color: Colors.blue,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    splashColor: Colors.blueAccent,
                    onPressed:(){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> service(
                        value: _textcontroller.text,
                      )));


                    },
                  ),),





              ],


            ),
          )
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





