
import 'package:cloud_firestore/cloud_firestore.dart';
class Task{
  String iddd;
  String Productname;
  String condition;
  String Baseprice;
  Timestamp date;
  String category;
  String Description;
  String bid;
  String searchkey;
  String Ratig;
  String Review;




  //Task(this.name,this.condition,this.name2,this.date,this.category,this.name3);
  //Task.map(dynamic obj){
    //this.name=obj['Productname'];
    //this.condition=obj['Condition'];
   // this.name2=obj['Baseprice'];
   // this.date=obj['Date'];
   // this.category=obj['Category'];
   // this.name3=obj['Description'];
  //}

//  String get Productname => name;
  //String get Condition => condition;
  //String get Baseprice => name2;
  //String get Date=> date;
  //String get Category => category;
 // String get Description => name3;

//  Map<String,dynamic> toMap()
  //{
    //var map=new Map<String,dynamic>();
    //map['Product Name']= name;
   // map['Product Condition']= condition;
  //  map['Base price']= name2;
  //  map['Date']= date;
   // map['Category']= category;
   // map['Description']= name3;

 Task.fromMap(Map<String, dynamic> data){
  iddd= data['Id'];
  Productname= data['productname'];
  Description= data['Description'];
  date= data['Date'];
  condition= data['Condition'];
  category= data['Category'];
  Baseprice= data['Baseprice'];
  bid= data['BID'];
  searchkey= data['searchkey'];
  Ratig= data['Rating'];
  Review= data['Review'];
  }

  /*  Map<String, dynamic> toJson() => {

      'Id': iddd,
  'productname': Productname,
   'Description': Description,
  'Date': date,
  'Condition' : condition,
  'Category' : category,
  'Baseprice' : Baseprice,
  'BID' : bid,
   };*/


  }


