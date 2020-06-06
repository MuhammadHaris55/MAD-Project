import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/painting.dart';
import 'customtiles.dart';

class DashboardPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()=> new _GotoDashboard();

}

//we use underscore before a class name to make it private

class _GotoDashboard extends State<DashboardPage>
{
  final formkey = new GlobalKey<FormState>();
  final dio = new Dio(); // for http requests
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
              /*CustomListTile(Icons.person,'Profile',()=>[]),
              CustomListTile(Icons.notifications,'Notifications',()=>[]),
              CustomListTile(FontAwesomeIcons.plus,'Add Auctions',()=>[]),
              CustomListTile(FontAwesomeIcons.plusCircle,'Start Bidding',()=>[]),
              CustomListTile(FontAwesomeIcons.gavel,'My Auctions',()=>[]),
              CustomListTile(FontAwesomeIcons.dollarSign,'My Bids',()=>[]),
              CustomListTile(Icons.lock,'Log Out',()=>[]),*/
            ],
          )
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: CustomScrollView(
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
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: new FittedBox(
                        child: Material(
                            color: Colors.white,
                            elevation: 8.0,
                            borderRadius: BorderRadius.circular(24.0),
                            shadowColor: Color(0x802196F3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: myDetailsContainer1(),
                                  ),
                                ),

                                Container(
                                  width: 250,
                                  height: 200,
                                  child: ClipRRect(
                                    borderRadius: new BorderRadius.circular(24.0),
                                    child: Image(
                                      fit: BoxFit.contain,
                                      alignment: Alignment.topRight,
                                      image: NetworkImage(
                                          "https://images.unsplash.com/photo-1495147466023-ac5c588e2e94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
                                    ),
                                  ),),
                              ],)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: new FittedBox(
                        child: Material(
                            color: Colors.white,
                            elevation: 8.0,
                            borderRadius: BorderRadius.circular(24.0),
                            shadowColor: Color(0x802196F3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: myDetailsContainer1(),
                                  ),
                                ),

                                Container(
                                  width: 250,
                                  height: 180,
                                  child: ClipRRect(
                                    borderRadius: new BorderRadius.circular(24.0),
                                    child: Image(
                                      fit: BoxFit.contain,
                                      alignment: Alignment.topRight,
                                      image: NetworkImage(
                                          "https://images.unsplash.com/photo-1545396872-a6682fc218ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
                                    ),
                                  ),),
                              ],)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: new FittedBox(
                        child: Material(
                            color: Colors.white,
                            elevation: 8.0,
                            borderRadius: BorderRadius.circular(24.0),
                            shadowColor: Color(0x802196F3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: myDetailsContainer1(),
                                  ),
                                ),

                                Container(
                                  width: 250,
                                  height: 180,
                                  child: ClipRRect(
                                    borderRadius: new BorderRadius.circular(24.0),
                                    child: Image(
                                      fit: BoxFit.contain,
                                      alignment: Alignment.topRight,
                                      image: NetworkImage(
                                          "https://images.unsplash.com/photo-1525640932057-b18561aca9b5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
                                    ),
                                  ),),
                              ],)
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  Widget myDetailsContainer1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Text("Product Name",
            style: TextStyle(color: Color(0xffe6020a), fontSize: 24.0,fontWeight: FontWeight.bold),)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(child: Text("4.3",
                    style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
                  Container(child: Icon(
                    FontAwesomeIcons.solidStar, color: Colors.amber,
                    size: 15.0,),),
                  Container(child: Icon(
                    FontAwesomeIcons.solidStar, color: Colors.amber,
                    size: 15.0,),),
                  Container(child: Icon(
                    FontAwesomeIcons.solidStar, color: Colors.amber,
                    size: 15.0,),),
                  Container(child: Icon(
                    FontAwesomeIcons.solidStar, color: Colors.amber,
                    size: 15.0,),),
                  Container(child: Icon(
                    FontAwesomeIcons.solidStarHalf, color: Colors.amber,
                    size: 15.0,),),
                  Container(child: Text("Base Price \u00B7 value",
                    style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
                ],)),
        ),
        Container(child: Text("Highest Bid \u00B7 value",
          style: TextStyle(color: Colors.black54, fontSize: 18.0,fontWeight: FontWeight.bold),)),
      ],
    );
  }
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