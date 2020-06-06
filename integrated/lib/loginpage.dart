import 'package:flutter/material.dart';
import 'package:login_signup/Test.dart';
import 'add_auction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_signup/add_auction.dart';
class loginpage extends StatefulWidget {
  @override
  loginpageState createState() => loginpageState();
}

class loginpageState extends State<loginpage> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final Emailcontroller =  TextEditingController();


  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          centerTitle: true,
        ),
        body: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (input){
                  if(input.isEmpty){
                    return 'Provide an email';
                  }
                },
                controller: Emailcontroller,

                decoration: InputDecoration(
                    labelText: 'Email'
                ),
                onSaved: (input)=> _email = input,
              ),
              TextFormField(
                validator: (input){
                  if(input.length<6){
                    return 'longer password please';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Password'
                ),
                onSaved: (input)=> _password = input,
                obscureText: true,
              ),
              _LineDivider(),
              CookieButton(text: "SignIn",onPressed: signin),

            ],
          ),
        )

    );

  }

  void signin() async{
    if(_formkey.currentState.validate()){
      _formkey.currentState.save();
      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> TEST(value: Emailcontroller.text)));

      }catch(e)
      {
        print(e.message);
      }
    }
  }
}
class CookieButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  CookieButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) => Container(
      height: 64,
      width: MediaQuery.of(context).size.width * .4,
      child: RaisedButton(
          elevation: 5,
          child: FittedBox(
              child: Text(text,
                  style: TextStyle(color: Colors.white, fontSize: 18))),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          color: Colors.blue,
          onPressed: onPressed));
}
class _LineDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: Divider(
        height: 3,
        color: Colors.grey,
      ));
}