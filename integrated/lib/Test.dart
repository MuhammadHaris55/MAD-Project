import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_signup/add_auction.dart';
import 'package:login_signup/products.dart';
import 'package:login_signup/searchitems.dart';
import 'package:login_signup/task.dart';
import 'package:provider/provider.dart';
import 'package:login_signup/Notifier.dart';
import 'bidding.dart';
import 'feedback_user.dart';

class TEST extends StatefulWidget {
  final String value;
  TEST({Key key,this.value}): super (key: key);
  @override
  _TESTState createState() => _TESTState();
}

class _TESTState extends State<TEST> {

  final formkey = new GlobalKey<FormState>();



  String _searchkey;

  void initState() {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context, listen: false);
    getTasks(foodNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    return Scaffold(
      appBar: new AppBar(
          centerTitle: true,
          title: new Text('Dashboard')
      ),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.blue[800]
                ),
                child: Container(
                  child:Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        elevation: 10,
                        child: Padding( padding: EdgeInsets.all(8.0),
                          child:Image.asset('assets/logo.png',width: 70,height: 70,),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Username', style: TextStyle(fontSize: 20, color: Colors.white)),
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                  padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
                  child: Container(
                      decoration: BoxDecoration( border: Border(bottom: BorderSide(color: Colors.blueGrey))),
                      child: InkWell(
                          splashColor: Colors.lightBlueAccent,
                          onTap: () =>{        Navigator.of(context).pushNamed("/notificationpage")},
                          child: Container(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.notifications),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Notifications",style: TextStyle(
                                            fontSize: 16.0
                                        ),),
                                      )
                                    ],
                                  ),
                                  Icon(Icons.arrow_right)
                                ],
                              )
                          )
                      )
                  )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
                child: Container(
                  decoration: BoxDecoration( border: Border(bottom: BorderSide(color: Colors.blueGrey))),
                  child: InkWell(
                      splashColor: Colors.lightBlueAccent,
                      onTap: () =>{Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> add_auc(value: widget.value)))},
                      child: Container(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(FontAwesomeIcons.plus),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Add Auctions",style: TextStyle(
                                        fontSize: 16.0
                                    ),),
                                  )
                                ],
                              ),
                              Icon(Icons.arrow_right)
                            ],
                          )
                      )
                  )
                  )
                ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
                  child: Container(
                      decoration: BoxDecoration( border: Border(bottom: BorderSide(color: Colors.blueGrey))),
                      child: InkWell(
                          splashColor: Colors.lightBlueAccent,
                          onTap: () =>{Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> biddingPage()))
                          },
                          child: Container(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.plusCircle),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Start Bidding",style: TextStyle(
                                            fontSize: 16.0
                                        ),),
                                      )
                                    ],
                                  ),
                                  Icon(Icons.arrow_right)
                                ],
                              )
                          )
                      )
                  )
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
                  child: Container(
                      decoration: BoxDecoration( border: Border(bottom: BorderSide(color: Colors.blueGrey))),
                      child: InkWell(
                          splashColor: Colors.lightBlueAccent,
                          onTap: () =>{Navigator.of(context).pushNamed("/myauc")},
                          child: Container(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.gavel),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("My Auctions",style: TextStyle(
                                            fontSize: 16.0
                                        ),),
                                      )
                                    ],
                                  ),
                                  Icon(Icons.arrow_right)
                                ],
                              )
                          )
                      )
                  )
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
                  child: Container(
                      decoration: BoxDecoration( border: Border(bottom: BorderSide(color: Colors.blueGrey))),
                      child: InkWell(
                          splashColor: Colors.lightBlueAccent,
                          onTap: () =>{
                          Navigator.of(context).pushNamed("/payment")},
                          child: Container(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.payment),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Make Payment",style: TextStyle(
                                            fontSize: 16.0
                                        ),),
                                      )
                                    ],
                                  ),
                                  Icon(Icons.arrow_right)
                                ],
                              )
                          )
                      )
                  )
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
                  child: Container(
                      decoration: BoxDecoration( border: Border(bottom: BorderSide(color: Colors.blueGrey))),
                      child: InkWell(
                          splashColor: Colors.lightBlueAccent,
                          onTap: () =>{
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> UserFeedback()))    },
                          child: Container(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.feedback),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Rate User",style: TextStyle(
                                            fontSize: 16.0
                                        ),),
                                      )
                                    ],
                                  ),
                                  Icon(Icons.arrow_right)
                                ],
                              )
                          )
                      )
                  )
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
                  child: Container(
                      decoration: BoxDecoration( border: Border(bottom: BorderSide(color: Colors.blueGrey))),
                      child: InkWell(
                          splashColor: Colors.lightBlueAccent,
                          onTap: () =>{Navigator.of(context).pushNamed("/login")},
                          child: Container(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.lock),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Log Out",style: TextStyle(
                                            fontSize: 16.0
                                        ),),
                                      )
                                    ],
                                  ),
                                  Icon(Icons.arrow_right)
                                ],
                              )
                          )
                      )
                  )
              ),//CustomListTile(FontAwesomeIcons.plus,'Add Auctions',()=>[]),
              //CustomListTile(FontAwesomeIcons.plusCircle,'Start Bidding',()=>[]),
              //CustomListTile(FontAwesomeIcons.gavel,'My Auctions',()=>[]),
              //CustomListTile(FontAwesomeIcons.dollarSign,'My Bids',()=>[]),
              //CustomListTile(Icons.payment,'Make Payment',()=>[]),
              //CustomListTile(Icons.lock,'Log Out',()=>[]),
            ],
          )
      ),
      resizeToAvoidBottomPadding: false,

      body: new CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
                [
                  new Container(
                      padding: EdgeInsets.all(16.0),
                      child: new Form(
                        key: formkey,
                        child:new Padding(
                          padding: EdgeInsets.only(top: 2.0),
                          child: TextFormField(
                            decoration: new InputDecoration(labelText: 'Search',
                              icon: Icon(Icons.search,color: Colors.black,),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            validator: (value) => value.isEmpty ? 'Enter a search word...': null,
                            onSaved: (value) => _searchkey = value,
                          ),),
                      )
                  )
                ]
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
                [
                  HeaderWidget("Categories"),
                ]
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            delegate: SliverChildListDelegate(
              [
                  new myCard(icona: FontAwesomeIcons.car, texts:'Vehicles',icolor:Colors.black54),
                  new myCard(icona: Icons.phone_android, texts:'Mobiles',icolor:Colors.black54),
                  new myCard(icona: Icons.home, texts:'Property',icolor:Colors.black54),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
                [
                  HeaderWidget("Products"),
                ]
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ListTile(
                  title: Text(foodNotifier.taskList[index].Productname),
                  subtitle: Text(foodNotifier.taskList[index].category),

                  onTap: () {
                    foodNotifier.currenttask = foodNotifier.taskList[index];
                    String id= foodNotifier.currenttask.iddd;
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                      return ProductPage(value: id);
                    }));
                  },
                );
              },
              childCount: foodNotifier.taskList.length,
            ),
          )
    ],
      ),
    );
  }
}
getTasks(FoodNotifier foodNotifier) async {
  QuerySnapshot snapshot = await Firestore.instance.collection('Add_Auction').getDocuments();

  List<Task> _taskList = [];

  snapshot.documents.forEach((document) {
    Task task = Task.fromMap(document.data);
    _taskList.add(task);
  });

  foodNotifier.taskList = _taskList;
}
class HeaderWidget extends StatelessWidget {
  final String text;

  HeaderWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text(text,style: TextStyle(color: Colors.black,fontSize: 20),),

    );
  }
}
class myCard extends StatelessWidget{
  myCard({this.icona,this.texts,this.icolor});
  final IconData icona;
  final String texts;
  final Color icolor;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: new Card
          (
          elevation: 5,
          color: Colors.grey[200],
          child: new Column(
            children: <Widget>[
              new IconButton(
                icon: Icon(icona),
                iconSize: 60,
                color: icolor,
                onPressed: () {
                  switch (texts) {
                    case 'Vehicles':
                      break;
                    case 'Mobile Phones':
                      break;
                    case 'Property':
                      break;
                    default:
                  }
                },
              ),
              new Text(
                  texts,
                  style: new TextStyle(fontSize: 20.0,color: Colors.black26)
              )
            ],
          ),
        )
    );
  }
}


/*
class CustomListTile {
  IconData icon;
  String text;
  Function onTap;
  CustomListTile(this.icon,this.text,this.onTap);
  @override
  Widget build(BuildContext context){
    //TO do implement build
    return
    return Padding(
        padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.blueGrey))
          ),
          child: InkWell(
              splashColor: Colors.lightBlueAccent,
              onTap: () {
                switch (text) {
                  case 'Profile':
                    Navigator.of(context).pushNamed("/profile");
                    break;
                  case 'Add Auctions':
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> add_auc(value: )));

                    break;
                  case 'Start Bidding':

                    break;
                  case 'Notifications':
                    Navigator.of(context).pushNamed("/notificationpage");
                    break;
                  case 'My Auctions':
                    Navigator.of(context).pushNamed("/myauc");
                    break;
                  case 'Make Payment':
                    Navigator.of(context).pushNamed("/payment");
                    break;
                  case 'My Bids':
                    Navigator.of(context).pushNamed("/mybid");
                    break;
                  case 'Log Out':
                    Navigator.of(context).pushNamed("/login");
                    break;
                  default:
                }

              },
              child: Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(icon),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(text,style: TextStyle(
                                fontSize: 16.0
                            ),),
                          )
                        ],
                      ),
                      Icon(Icons.arrow_right)
                    ],
                  )
              )
          ),
        )
    );
  }
}
*/
