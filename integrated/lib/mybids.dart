import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyBidsPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()=> new _GotoMyBids();
     
}

//we use underscore before a class name to make it private

class _GotoMyBids extends State<MyBidsPage>
{
  @override
  Widget build(BuildContext context) {
     return new Scaffold(
      appBar: new AppBar(title: new Text('My Bids'),
      backgroundColor: Colors.blue,
      ),      
      body: ListView(
         padding: const EdgeInsets.all(1),
                children: <Widget>[
                   Padding(
            padding: EdgeInsets.all(2.0),
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
                        
                  child: Column(
                  children : <Widget>[
                  new Container(
                          margin: EdgeInsets.all(2.0),
                          padding: EdgeInsets.fromLTRB(4.0,0.0,0.0,10.0),
                          decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(25.0),
                          ),
                        child: Row(
                        children : <Widget>[
                        Icon(Icons.person,size: 32,),
                        Text("Product Name", style: TextStyle(fontSize: 20, color: Colors.grey)),
                        
                        ],
                        )
                        ),

                        new Container(
                          margin: EdgeInsets.all(2.0),
                          padding: EdgeInsets.fromLTRB(4.0,0.0,0.0,10.0),
                          decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(25.0),
                          ),
                        child: Row(
                        children : <Widget>[
                        Icon(FontAwesomeIcons.dollarSign,size: 32,),
                        Text("Placed Bid", style: TextStyle(fontSize: 20, color: Colors.grey)),
                        
                        ],
                        )
                        ),

                  new Container(
                          margin: EdgeInsets.all(2.0),
                          padding: EdgeInsets.fromLTRB(4.0,0.0,0.0,10.0),
                          decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(25.0),
                          ),
                        child: Row(
                        children : <Widget>[
                        IconButton(
                          icon: Icon(Icons.refresh),
                          tooltip: 'Update Bid',
                          onPressed: null,
                        ),
                        IconButton(
                          icon: Icon(Icons.info),
                          tooltip: 'View Product Info',
                          onPressed: () {Navigator.of(context).pushNamed("/prodinfo");},
                        ),IconButton(
                          icon: Icon(Icons.remove),
                          tooltip: 'Remove Bid',
                          onPressed: null,
                        ),
                      
                      ],
                     )
                    ),
                  ],
                ),
              ),
             ],
            ),
            ),
          ),
        ],
      ),
     );
  }
}
