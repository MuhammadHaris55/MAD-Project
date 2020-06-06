import 'package:flutter/material.dart';
import 'package:login_signup/loginpage.dart';
import 'package:login_signup/profile.dart';

import 'loginbutton.dart';


class mainpage extends StatefulWidget {
  @override
  _mainpageState createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CookieButton(text: "SignIn",onPressed: Navigatetosignin),
          _LineDivider(),
          CookieButton(text: "Signup",onPressed: Navigatetosignup),
          _LineDivider(),
          CookieButton(text: "google signin",onPressed: Navigatetogooglesignin),
          //UserProfile()

        ],
      ),
    );
  }

  void Navigatetosignin(){

    Navigator.push(context, MaterialPageRoute(builder: (context)=> loginpage()));
  }
  void Navigatetosignup(){

    Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage()));
  }
  void Navigatetogooglesignin(){

    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginButton()));
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
/*class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuildedr(
        stream: authService.user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MaterialButton(
              onPressed: () => authService.signout(),
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Signout'),
            );
          } else {
            return MaterialButton(
              onPressed: () => authService.googleSignIn(),
              color: Colors.white,
              textColor: Colors.black,
              child: Text('Login with Google'),
            );
          }
        });
  }
}*/
/*class UserProfile extends StatefulWidget {
  @override
  UserProfileState createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  Map<String, dynamic> _profile;
  bool _loading = false;

  @override
  initState() {
    super.initState();

    // Subscriptions are created here
    authService.profile.listen((state) => setState(() => _profile = state));

    authService.loading.listen((state) => setState(() => _loading = state));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(padding: EdgeInsets.all(20), child: Text(_profile.toString())),
      Text(_loading.toString())
    ]);
  }
}*/



