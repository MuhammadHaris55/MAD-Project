import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:login_signup/Notifier.dart';
import 'package:provider/provider.dart';
import 'package:login_signup/add_auction.dart';
import 'Test.dart';
import 'feedback_product.dart';


class finalize extends StatefulWidget
{
  final String value,value1,value2,value3,value4,value5,value6,value7,value8,DateTime;
  finalize({Key key,this.value,this.value1,this.value2,this.value3,this.value4,this.value5,this.value6,this.value7,this.value8,this.DateTime}): super (key: key);
  @override
  State<StatefulWidget> createState()=> new _Gotofinalize();
}

//we use underscore before a class name to make it private

class _Gotofinalize extends State<finalize> {
  //statelessweidget means no changes going to be favoured

  justDATA(){

    DocumentReference ds= Firestore.instance.collection('Add_Auction').document("${widget.value5}");
    //DocumentReference ds= Firestore.instance.collection('User Auctions').document("${widget.value}").collection('AUCTIONS').document();

    Map<String,dynamic> UserRating={
      "productname": "${widget.value1}",
      "Description" :  "${widget.value2}",
      "Baseprice": "${widget.value3}",
      "Condition": "${widget.value4}",
      "Id": "${widget.value5}",
      "searchkey" : "${widget.value6}",
      "BID" : "${widget.value}",
      "Category" : "${widget.value7}",
      //"Date" : "${widget.DateTime}"

    };
    ds.setData(UserRating).whenComplete((){
      print("bid placed");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> TEST()));
    });
  }






  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context, listen: false);
    final charge= add_auc();


    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text('Product Info'),
      ),
      body: SingleChildScrollView(
        child: new Container(

            padding: EdgeInsets.all(16.0),
            child: new Form(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.fromLTRB(10.0,12.0,0.0,10.0),
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(25.0),
                        border: new Border.all(
                          width: 1.0,
                          color: Colors.blueGrey,
                        ),
                      ),
                      child: Row(
                          children : <Widget>[
                            Text(foodNotifier.currenttask.Productname, style: TextStyle(fontSize: 20, color: Colors.grey)),
                            //foodNotifier.currenttask.Productname=name1
                          ]
                      )
                  ),

                  new Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.fromLTRB(10.0,12.0,0.0,10.0),
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(25.0),
                        border: new Border.all(
                          width: 1.0,
                          color: Colors.blueGrey,
                        ),
                      ),
                      child: Row(
                          children : <Widget>[
                            Text(foodNotifier.currenttask.category, style: TextStyle(fontSize: 20, color: Colors.grey)),
                            //foodNotifier.currenttask.category=name2
                          ]
                      )
                  ),

                  new Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.fromLTRB(10.0,12.0,0.0,10.0),
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(25.0),
                        border: new Border.all(
                          width: 1.0,
                          color: Colors.blueGrey,
                        ),
                      ),
                      child: Row(
                          children : <Widget>[
                            Text(foodNotifier.currenttask.condition, style: TextStyle(fontSize: 20, color: Colors.grey)),
                            //foodNotifier.currenttask.condition=name3
                            //Text("${widget.value})", style: TextStyle(fontSize: 20, color: Colors.grey)),
                          ]
                      )
                  ),

                  new Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.fromLTRB(10.0,12.0,0.0,10.0),
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(25.0),
                        border: new Border.all(
                          width: 1.0,
                          color: Colors.blueGrey,
                        ),
                      ),
                      child: Row(
                          children : <Widget>[
                            Text(foodNotifier.currenttask.Description, style: TextStyle(fontSize: 20, color: Colors.grey)),
                            // foodNotifier.currenttask.Description=name4
                          ]
                      )
                  ),

                  new Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.fromLTRB(10.0,12.0,0.0,10.0),
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(25.0),
                        border: new Border.all(
                          width: 1.0,
                          color: Colors.blueGrey,
                        ),
                      ),
                      child: Row(
                          children : <Widget>[
                            Text("Images", style: TextStyle(fontSize: 20, color: Colors.grey)),
                          ]
                      )
                  ),

                  new Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.fromLTRB(10.0,12.0,0.0,10.0),
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(25.0),
                        border: new Border.all(
                          width: 1.0,
                          color: Colors.blueGrey,
                        ),
                      ),
                      child: Row(
                          children : <Widget>[
                            Text("${widget.value}", style: TextStyle(fontSize: 20, color: Colors.grey)),

                          ]
                      )
                  ),


                  FlatButton.icon(
                    label: Text('Done', style: new TextStyle(
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
                    onPressed: justDATA,
                  ),
                  FlatButton.icon(
                    label: Text('Review Product', style: new TextStyle(
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
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ProductFeedback()));

                    },
                  ),

                ],
              ),
            )
        ),
      ),
    );
  }

}