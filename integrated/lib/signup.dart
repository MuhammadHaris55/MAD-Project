import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_signup/loginpage.dart';
class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
              RaisedButton(
                onPressed: signup,
                child: Text('Sign up'),
              )
            ],
          ),
        )
    );
  }

  void signup() async{
    if(_formkey.currentState.validate()){
      _formkey.currentState.save();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> loginpage()));
      }catch(e)
    {
      print(e.message);
    }
    }
  }


}
