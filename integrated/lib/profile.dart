import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_signup/widgets/buy_sheet.dart';
import 'package:login_signup/widgets/order_sheet.dart';

import 'loginpage.dart';

class ProfilePage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()=> new _GotoProfile();
     
}

//we use underscore before a class name to make it private

class _GotoProfile extends State<ProfilePage>
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
var name,mail,contact,password,address;

getusername(name)
{
  this.name= name;
}
getuseremail(mail)
{
  this.mail= mail;
}
getcontact(contact)
{
  this.contact= contact;
}
getpass(password)
{
  this.password= password;
}
getaddress(address)
{
  this.address= address;
}
  @override
  Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(title: new Text('Regsister '),
       backgroundColor: Colors.blue,
       ),
       resizeToAvoidBottomPadding: false,
       body: SingleChildScrollView(
           child: new Container(
               padding: EdgeInsets.all(16.0),
               child: new Form(
                 key: formkey,
                 child: new Column(
                   crossAxisAlignment: CrossAxisAlignment.stretch,
                   children: <Widget>[
                     Padding(
                       padding: EdgeInsets.only(top: 25.0),
                       child: TextField(
                         onChanged: (String name){
                           getusername(name);
                         },
                         decoration: new InputDecoration(
                           labelText: 'Full Name',
                           icon: Icon(Icons.view_module),
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



                         //   validator: (input) =>
                         // input.isEmpty
                         //      ? 'Product Name can not be empty'
                         //    : null,
                         //onSaved: (input) => getProductname(_prodname),

                         // onChanged: (String _prodname){
                         // getProductname(_prodname);
                         //},
                       ),
                     ),

                     Padding(
                       padding: EdgeInsets.only(top: 25.0),
                       child: TextField(
                         onChanged: (String name){
                           getpass(name);
                         },
                         decoration: new InputDecoration(
                           labelText: 'Password',
                           icon: Icon(Icons.code),
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



                         //   validator: (input) =>
                         // input.isEmpty
                         //      ? 'Product Name can not be empty'
                         //    : null,
                         //onSaved: (input) => getProductname(_prodname),

                         // onChanged: (String _prodname){
                         // getProductname(_prodname);
                         //},
                       ),
                     ),



                     Padding(
                       padding: EdgeInsets.only(top: 25.0),
                       child: TextField(
                         onChanged: (String name2){
                           getuseremail(name2);
                         },

                         decoration: new InputDecoration(
                           labelText: 'Email address',
                           icon: Icon(Icons.email),
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
                         //    ? 'Base price can not be empty'
                         //  : null,

                         //onSaved: (value) => getprice(_price),
                       ),
                     ),


                     Padding(
                       padding: EdgeInsets.only(top: 25.0),
                       child: TextField(
                         onChanged: (String name3){
                           getcontact(name3);
                         },
                         decoration: new InputDecoration(
                           labelText: 'Contact',
                           contentPadding: const EdgeInsets.symmetric(
                               vertical: 40, horizontal: 12),
                           icon: Icon(Icons.contact_phone),
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

                     Padding(
                       padding: EdgeInsets.only(top: 25.0),
                       child: TextField(
                         onChanged: (String name){
                           getusername(name);
                         },
                         decoration: new InputDecoration(
                           labelText: 'Home Address',
                           icon: Icon(Icons.home),
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



                         //   validator: (input) =>
                         // input.isEmpty
                         //      ? 'Product Name can not be empty'
                         //    : null,
                         //onSaved: (input) => getProductname(_prodname),

                         // onChanged: (String _prodname){
                         // getProductname(_prodname);
                         //},
                       ),
                     ),

                     Padding(
                       padding: EdgeInsets.only(top: 22.0),
                       child:
                       new FlatButton.icon(
                         label: Text('Register', style: new TextStyle(
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
                         onPressed:
                         crateDATA,
                       ),),
                   ],
                 ),
               )
           )
       )
       );
  }

crateDATA() async {
  DocumentReference ds= Firestore.instance.collection('Registration').document();

  Map<String,dynamic> Registration={
    "Full name": name,
    "email": mail,
    "password": password,
    "address": contact,
    "Contact": address,
    "Id" : ds.documentID,
  };
  ds.setData(Registration).whenComplete((){
    print("Complete");
    signup();
  });
}

void signup() async{
  if(formkey.currentState.validate()){
    formkey.currentState.save();
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: mail, password: password);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> loginpage()));
    }catch(e)
    {
      print(e.message);
    }
  }
}

}


