import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/cupertino.dart';

class MyAucPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()=> new _GotoMyAuc();
}

//we use underscore before a class name to make it private

class _GotoMyAuc extends State<MyAucPage>
{
  @override
  Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(title: new Text('My Auctions'),
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
                              Icon(Icons.view_agenda,size: 32,),
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
                              IconButton(
                                icon: Icon(Icons.info),
                                tooltip: 'View Item',
                                onPressed: () {Navigator.of(context).pushNamed("/prodinfo");},
                                focusColor: Colors.blueGrey[200],
                              ),
                              IconButton(
                                icon: Icon(Icons.edit),
                                tooltip: 'Edit Item',
                                onPressed: null,
                              ),IconButton(
                                icon: Icon(Icons.delete),
                                tooltip: 'Delete Item',
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
