import 'package:login_signup/Auth_Service.dart';
import 'package:flutter/material.dart';

class help extends InheritedWidget {
  final AuthService auth;

  help({Key key, Widget child, this.auth}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static help of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(help) as help);
}