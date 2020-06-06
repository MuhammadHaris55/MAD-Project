    
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dio/dio.dart';
import 'package:login_signup/Notifier.dart';
import 'package:login_signup/products.dart';
import 'package:login_signup/widgets/proceedpay.dart';
import 'package:provider/provider.dart';

import 'Test.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final dio = new Dio();
  void initState() {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context, listen: false);
    getTasks(foodNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    return new Scaffold(
       appBar: new AppBar(title: new Text('Notifications'),
       backgroundColor: Colors.blue,
       ),      
       body: CustomScrollView(
         slivers: <Widget>[
           SliverList(
             delegate: SliverChildBuilderDelegate(
                   (BuildContext context, int index) {
                 return ListTile(
                   leading: Icon(
                     Icons.notifications
                   ),
                   title: Text("Press to see details"),
                   subtitle: Text(foodNotifier.taskList[index].Productname),
                   onTap: () {
                     foodNotifier.currenttask = foodNotifier.taskList[index];
                     String id= foodNotifier.currenttask.iddd;
                     Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                       return Proceedpayment(value: id);
                     }));
                   },
                 );
               },
               childCount: foodNotifier.taskList.length,
             ),
           )
           /*Padding(

             padding: EdgeInsets.all(2.0),
             child: new Form(
               child: new Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: <Widget>[
                   new Container(
                     margin: EdgeInsets.all(10.0),
                     padding: EdgeInsets.fromLTRB(8.0,12.0,0.0,10.0),
                     decoration: new BoxDecoration(
                       borderRadius: new BorderRadius.circular(25.0),
                       border: new Border.all(
                         width: 1.0,
                         color: Colors.blueGrey,
                       ),
                     ),
                     child: Column(
                       children : <Widget>[





                         new Container(


                           margin: EdgeInsets.all(10.0),
                           padding: EdgeInsets.fromLTRB(8.0,6.0,0.0,0.0),
                           decoration: new BoxDecoration(
                             borderRadius: new BorderRadius.circular(25.0),
                           ),
                           child: Row(
                             children : <Widget>[
                               Icon(Icons.notifications,size: 32,),
                               Text(foodNotifier.taskList[], style: TextStyle(fontSize: 20, color: Colors.black)),

                             ],
                           ),
                         ),

                         new Container(
                           margin: EdgeInsets.all(0.0),
                           padding: EdgeInsets.fromLTRB(25.0,0.0,0.0,0.0),
                           decoration: new BoxDecoration(
                             borderRadius: new BorderRadius.circular(12.0),
                           ),
                           child: Row(
                             children : <Widget>[
                               Padding(
                                 padding: EdgeInsets.only(top: 10.0),
                                 child: new FlatButton.icon(
                                   label: Text('View Product',style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                                   icon: Icon(Icons.info,size: 12,),
                                   color: Colors.lightBlue,
                                   textColor: Colors.white,
                                   disabledColor: Colors.grey,
                                   disabledTextColor: Colors.black,
                                   padding: EdgeInsets.all(8.0),
                                   shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                   splashColor: Colors.blueAccent,
                                   onPressed: () {
                                     //loadAssets();
                                   },
                                 ),
                               ),

                               *//*Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: new FlatButton.icon(
                      label: Text('View Bidder Details',style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                      icon: Icon(Icons.person_pin,size: 12,),
                      color: Colors.lightBlue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                        //loadAssets();
                      },
                    ),
                    ),*//*

                             ],
                           ),
                         ),

                         *//*   new Container(
                          margin: EdgeInsets.all(0.0),
                          padding: EdgeInsets.fromLTRB(50.0,0.0,0.0,0.0),
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(12.0),
                        ),
                        child: Row(
                            children : <Widget>[

                      Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: new FlatButton.icon(
                      label: Text('Proceed with Payment',style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                      icon: Icon(Icons.payment,size: 12,),
                      color: Colors.lightBlue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                        //loadAssets();
                      },
                    ),
                    ),

                            ],
                        ),
                    ), *//*

                       ],
                     ),
                   ),
                 ],
               ),
             ),
           ),*/
         ],
       ),
     );

  }
}
