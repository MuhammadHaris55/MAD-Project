import 'package:flutter/material.dart';
import 'package:login_signup/welcome.dart';
import 'package:login_signup/add_auction.dart';
import 'package:login_signup/bidding.dart';
import 'package:login_signup/feedback_product.dart';
import 'package:login_signup/feedback_user.dart';
import 'package:login_signup/mybids.dart';
import 'package:login_signup/notificationpage.dart';
import 'package:login_signup/products.dart';
import 'package:login_signup/profile.dart';
import 'package:login_signup/Test.dart';
import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'signup.dart';
import 'package:login_signup/Notifier.dart';
import 'dashboard.dart';
import 'myauction.dart';
import 'package:provider/provider.dart';
import 'payment.dart';
import 'feedback_user.dart';
//void main() => runApp(MyApp());
void main() => runApp(MultiProvider(
  providers: [

    ChangeNotifierProvider(
      builder: (context) => FoodNotifier(),
    ),
  ],
  child: MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iBID',
      home: mainpage(),

      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        //'/':(context) => new mainpage(),
        "/payment": (BuildContext context) => HomeScreen(),
        "/test": (BuildContext context) => DashboardPage(),
        "/products": (BuildContext context) => ProductPage(),
        "/userfeedback": (BuildContext context) => ProductPage(),
        "/profile":(BuildContext context)=> ProfilePage(),
        "/myauc":(BuildContext context)=> MyAucPage(),
        "/mybid":(BuildContext context)=> MyBidsPage(),
        "/prodinfo":(BuildContext context)=> ProductPage(),
        "/feedback_product":(BuildContext context)=> ProductFeedback(),
        "/feedback_user":(BuildContext context)=> UserFeedback(),
        "/notificationpage":(BuildContext context)=> NotificationPage(),
      },
    );
  }
}

