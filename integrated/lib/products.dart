import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:login_signup/FinalizeAuction.dart';
import 'package:login_signup/Notifier.dart';
import 'package:provider/provider.dart';
import 'package:login_signup/add_auction.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';




class ProductPage extends StatefulWidget
{
  final String value;
  ProductPage({Key key,this.value}): super (key: key);
  @override
  State<StatefulWidget> createState()=> new _GotoProducts();
}

//we use underscore before a class name to make it private

class _GotoProducts extends State<ProductPage> {
  //statelessweidget means no changes going to be favoured


var bb,name1,name2,name3,name4,name5;

  yourbid(bb)
  {
     this.bb=bb;
  }





  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context, listen: false);
    final charge= add_auc();
    TextEditingController ProductConroller= TextEditingController();
    TextEditingController ProductConroller1= TextEditingController();
    TextEditingController ProductConroller2= TextEditingController();
    TextEditingController ProductConroller3= TextEditingController();
    TextEditingController ProductConroller4= TextEditingController();
    TextEditingController ProductConroller5= TextEditingController();

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
                            Text(foodNotifier.currenttask.Productname, style: TextStyle(fontSize: 20, color: Colors.grey),),
              //foodNotifier.currenttask.Productname= ProductConroller as String;

                          ],

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
                            Text(foodNotifier.currenttask.bid, style: TextStyle(fontSize: 20, color: Colors.grey)),

                          ]
                      )
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 25.0),
                    child: TextField(
                      onChanged: (String name4) {
                        yourbid(name4);
                      },
                      decoration: new InputDecoration(
                        labelText: 'Your BID',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 12),
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

                  FlatButton.icon(
                    label: Text('Place bid', style: new TextStyle(
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
                    onPressed:(){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> finalize(
                          value: bb,
                           value1: foodNotifier.currenttask.Productname,
                        value2: foodNotifier.currenttask.Description,
                        value3: foodNotifier.currenttask.Baseprice,
                        value4: foodNotifier.currenttask.condition,
                          value5: foodNotifier.currenttask.iddd,
                        value6: foodNotifier.currenttask.searchkey,
                        value7: foodNotifier.currenttask.category,
                        //value8 : (foodNotifier.currenttask.date) as DateTime,

                      )));
                    },
                  ),

                ],
              ),
            )
        ),
      ),
    );
  }
/*
justDATA(){

  DocumentReference ds= Firestore.instance.collection('Add_Auction').document("${widget.value}");
  //DocumentReference ds= Firestore.instance.collection('User Auctions').document("${widget.value}").collection('AUCTIONS').document();

  Map<String,dynamic> UserRating={

      "productname": name1,
      "Category": name2,
      "Condition": name3,
  "Description": name4,
  "BID" : bb,
    "Id": ds.documentID,
      "searchkey": name1[0],


    };
    ds.setData(UserRating).whenComplete((){
      print("bid placed");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> TEST()));
    });
  }
*/

}


/*
class ProductPage extends StatefulWidget
{
  final String value;
  ProductPage({Key key,this.value}): super (key: key);
  @override
  State<StatefulWidget> createState()=> new _GotoProducts();
}

//we use underscore before a class name to make it private

class _GotoProducts extends State<ProductPage> {
  var used,used1;

  //statelessweidget means no changes going to be favoured
  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context, listen: false);

    getbid(used)
    {
      this.used=used;

    }


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
                            Text(foodNotifier.currenttask.Baseprice, style: TextStyle(fontSize: 20, color: Colors.grey)),
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
                            Text("Your Bid", style: TextStyle(fontSize: 20, color: Colors.grey)),
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
                    child:
                    TextField(
                      onChanged: (String name2){
                        getbid(name2);
                      },
                      decoration: new InputDecoration(
                        labelText: 'Place your bid',
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
                  FlatButton.icon(
                    label: Text('Place bid', style: new TextStyle(
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
                    onPressed:justDATA,
                  ),

                ],
              ),
            )
        ),
      ),
    );

  }
  justDATA(){

    DocumentReference ds= Firestore.instance.collection('Add_Auction').document("${widget.value}");
    //DocumentReference ds= Firestore.instance.collection('User Auctions').document("${widget.value}").collection('AUCTIONS').document();

    Map<String,dynamic> UserRating={
      */
/*"productname": ,
      "Condition": _condition,
      "Baseprice": name2,
      "Date": _value,
      "Category": _category,
      "Description": name3,
      "Id": ds.documentID,
      "searchkey": name[0],*//*

      "Baseprice": used,

    };
    ds.setData(UserRating).whenComplete((){
      print("bid placed");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> TEST()));
    });
  }




}






*/






/*
class ProductPage extends StatefulWidget
{
  final String value;
  ProductPage({Key key,this.value}): super (key: key);
  @override
  State<StatefulWidget> createState()=> new _GotoProducts();
}

//we use underscore before a class name to make it private

class _GotoProducts extends State<ProductPage> {
  var used,bidid;
  getbid(used)
  {
    this.used=used;
    //print(bidid);
  }

  //statelessweidget means no changes going to be favoured
  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context, listen: false);
    //foodNotifier.currenttask.iddd=bidid;
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
                            ]
                          )
                      ),
             */
/* new Container(
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
                         Text(foodNotifier.currenttask.iddd, style: TextStyle(fontSize: 20, color: Colors.grey)),
                       ]
                   )
               ),*//*

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
                              //("${widget.value})", style: TextStyle(fontSize: 20, color: Colors.grey)),
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
                              Text(foodNotifier.currenttask.bid, style: TextStyle(fontSize: 20, color: Colors.grey)),
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
                          child:
                          TextField(
                                  onChanged: (String name2){
                                    getbid(name2);
                                  },
                                  decoration: new InputDecoration(
                                    labelText: 'Place your bid',
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

               FlatButton.icon(
                 label: Text('Place bid', style: new TextStyle(
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
                 onPressed:(){},
               ),
           ],
          ),
        )
       ),
       ),
       );
  }


  justDATA(){

    DocumentReference ds= Firestore.instance.collection('Add_Auction').document("${widget.value}");
    //DocumentReference ds= Firestore.instance.collection('User Auctions').document("${widget.value}").collection('AUCTIONS').document();

    Map<String,dynamic> UserRating={
      "BID": used,
      //"Id" : EmailAuthProvider,
    };
    ds.setData(UserRating).whenComplete((){
      print("bid placed");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> TEST()));
    });
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
}
*/
