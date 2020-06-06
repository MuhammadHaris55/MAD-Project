import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'customtiles.dart';

class WelcomeScreen extends StatefulWidget 
{
  @override
  State<StatefulWidget> createState()=> new _GotoWelcomeScreen();
}

//we use underscore before a class name to make it private

class _GotoWelcomeScreen extends State<WelcomeScreen>
{
final formkey = new GlobalKey<FormState>();

void validateandsafe(){
 final form = formkey.currentState;
 if(form.validate())
 {
   form.save();
   print('Form is valid Search : $_searchkey ');
 } else{
   print('Form is in-valid search : $_searchkey ');
 }
}

String _searchkey;

  @override
  Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(title: new Text('   iBID', textAlign: TextAlign.center,),
       backgroundColor: Colors.blue,
       ),
       
       body: SingleChildScrollView(
        child: new Container(
         padding: EdgeInsets.all(16.0),
         child: new Form(
           key: formkey,
           child: new Column(  
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: <Widget>[
               
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child:Image.asset('assets/logo3.png',width: 240,height: 240),
              ),
                
                Padding(
                padding: EdgeInsets.only(top: 25.0),
                child:new RaisedButton(
                child: new Text('Login',style: new TextStyle(fontSize: 20.0)),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () {Navigator.of(context).pushNamed("/login");},
              ),
              ),
                
                Padding(
                padding: EdgeInsets.only(top: 25.0),
                child:new RaisedButton(
                child: new Text('Sign Up',style: new TextStyle(fontSize: 20.0)),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () {Navigator.of(context).pushNamed("/signup");},
              ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 25.0),
                child:new RaisedButton(
                child: new Text('DashBoard',style: new TextStyle(fontSize: 20.0)),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () {Navigator.of(context).pushNamed("/dashboard");},
              ),
              ),
            
            Padding(
                padding: EdgeInsets.only(top: 25.0),
                child:new RaisedButton(
                child: new Text('Product Feedback',style: new TextStyle(fontSize: 20.0)),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () {Navigator.of(context).pushNamed("/feedback_product");},
                ),
                ),

              Padding(
                padding: EdgeInsets.only(top: 25.0),
                child:new RaisedButton(
                child: new Text('User Rating',style: new TextStyle(fontSize: 20.0)),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () {Navigator.of(context).pushNamed("/feedback_user");},
                ),
                ),

            ],
           ),
           )
       ),
       ),
       );
  }
}
