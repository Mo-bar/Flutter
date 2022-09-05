import 'package:bsites/view/screen/appBar/favorite.dart';
import 'package:flutter/material.dart';
import 'package:bsites/data/datasource/sq_lite.dart';
import 'package:bsites/view/screen/appBar/drawer/account.dart';
import 'package:bsites/view/screen/add_gig.dart';
import 'package:bsites/view/screen/auth/log_in.dart';
import 'dart:async';
import 'appBar/contact.dart';
import 'appBar/drawer/listing.dart';
import 'appBar/gigs/Website.dart';
import 'appBar/gigs/logo.dart';
import 'appBar/gigs/mobile.dart';
import 'appBar/gigs/mockup.dart';
class Home extends StatefulWidget {  
  final String email ; 
  const Home({Key? key,required this.email,}) : super(key: key, );
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List<Map> user = [];
  GlobalKey<FormState> homeKey = GlobalKey();
  GlobalKey<ScaffoldState> scafHome = GlobalKey<ScaffoldState>();
  TextEditingController email = TextEditingController();
  SqlDb sql = SqlDb();
  int indexCountry = -1, oldIndex = -1 ;
  Future<List> loadData()async { 
    List<Map> helper = [];
    helper.addAll( await sql.getdata('SELECT U.*, C.flag FROM User U, Country C WHERE U.email = "${email.text}" AND U.countryName = C.name '));
    return helper;
  }
  @override
  initState() {
    email.text = widget.email;
    loadData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  String prob = '';
  const List<Tab> tabs = <Tab>[
  Tab(text: 'Logos'),
  Tab(text: 'Web-site'),
  Tab(text: 'Mobile-app'),
  Tab(text: 'Mock-up'),
];
  TextStyle? head1 = Theme.of(context).textTheme.headline1;
    return DefaultTabController(
    length: tabs.length,
    initialIndex: 0,
    key: homeKey,
    child :
      Scaffold(
        key: scafHome,
        appBar: AppBar( //*Appbar
          backgroundColor:  Colors.blueAccent,
          shadowColor: Colors.blueAccent,
          elevation: 8,
          title: const Text('Home', style : TextStyle(fontWeight: FontWeight.bold,fontSize: 26, color: Color.fromARGB(255, 224, 224, 224), ),),
          actions: <Widget>[
              IconButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: ((context) =>  Favorite(
                    email: email.text,
                  ))));
                }, 
                icon: const Icon(Icons.favorite, color: Colors.red,)
              ),
              IconButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: ((context) =>  const Login())));
              }, 
              icon: const Icon(Icons.logout_outlined, color: Colors.red))
            ],
          bottom: const TabBar(
            indicatorColor:  Color.fromARGB(255, 255, 255, 255),
            labelColor: Color.fromARGB(255, 255, 255, 255),
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 4,
            tabs: tabs,
            ),
        ),
        floatingActionButton: FloatingActionButton
        ( //* floating button
          backgroundColor: Colors.greenAccent,
          onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Addproduct(
            email: email.text,
          )));},
          child: const Icon(Icons.add,size:22)
        ),
        drawer: FutureBuilder(
          future: loadData(),
          builder: (context,AsyncSnapshot snapshot) 
          {
            if(snapshot.connectionState == ConnectionState.none || snapshot.hasError )
            {
              prob = 'No connection';
            }else
            {
              if(snapshot.hasData == false){prob = 'No Data';}
              else
              {
              return Drawer(
              child: ListView
              (
                children: 
                <Widget>[
                  Container(
                    color: Colors.blueAccent,
                    child: Column
                    (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                          margin: const EdgeInsets.only(top: 30,left: 20),
                          child:   CircleAvatar(
                            backgroundColor: Colors.amber,
                            child: Text( snapshot.hasData ? "${snapshot.data[0]['fname'].substring(0,1).toUpperCase()}${snapshot.data[0]['lname'].substring(0,1).toUpperCase()}" : 'UR', 
                            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold,color: Colors.white),)
                          )
                        ),
                        ListTile(
                          title: Row(children: <Widget>[
                            const Icon(Icons.person_outline,color:Colors.white,size: 25,),
                            const SizedBox(width: 6,),Text( snapshot.hasData ? "${snapshot.data[0]['fname'].substring(0,3)}_${snapshot.data[0]['lname'].toUpperCase()}" : 'null', style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 18,)),
                            ]),
                          subtitle: Row(children: <Widget>[const Icon(Icons.email_outlined,size:25,color: Colors.white,),const SizedBox(width: 6,),Text(email.text, style: const TextStyle(color: Colors.white, fontSize: 18, decoration: TextDecoration.underline),),]),
                          trailing: Text( snapshot.hasData ? "${snapshot.data[0]['flag']}" : 'flag',style: const TextStyle(fontSize: 26),),
                        ),
                        
                      ],
                    ),
                  ),
                  const Divider(color: Colors.black, thickness: 3,height: 3,),
                  ListTile(//*Account button_____________________________
                    title:  Text('Account',style: head1),
                    leading: const Icon(Icons.accessibility),
                    contentPadding: const EdgeInsets.only(top: 8, left: 20),
                    onTap: () {
                      if(snapshot.hasData)
                      {
                        setState(() {
                        Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Account(
                        email: email.text,
                        fname: "${snapshot.data[0]['fname']}",
                        lname: "${snapshot.data[0]['lname']}",
                        country: "${snapshot.data[0]['countryName']}",
                        passwd: "${snapshot.data[0]['passwd']}",
                        ))));
                        });
                      }
                      
                    },
                  ),
                  const Divider(color: Colors.black, thickness: 1,height: 1, indent: 12, endIndent: 12,),
                  ListTile(//*******My listing
                    title:  Text('My listing', style: head1),
                    leading: const Icon(Icons.list_alt_outlined),
                    contentPadding: const EdgeInsets.only(top: 8, left: 20),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Listing(email: email.text,))));
                    },
                  ),
                  const Divider(color: Colors.black, thickness: 1,height: 1,indent: 12, endIndent: 12),
                  ListTile(//*******Contact
                    contentPadding: const EdgeInsets.only(top: 8, left: 20),
                    title:  Text('Contact', style: head1),
                    leading: const Icon(Icons.contact_page_outlined),
                    onTap: () {
                      if(mounted){
                        Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const Contact())));
                      }
                    },
                  ),
                  const Divider(color: Colors.black, thickness: 1,height: 1,indent: 12, endIndent: 12),
                  ListTile(//*******Log out
                    title:  Text('Log out', style: head1),
                    leading: const Icon(Icons.logout_outlined, color:Colors.red),
                    contentPadding: const EdgeInsets.only(top: 8, left: 20),
                    onTap: () {
                      if(mounted){
                        Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const Login())));
                      }
                    },
                  ),
                  const Divider(color: Colors.black, thickness: 1,height: 1,indent: 12, endIndent: 12),
                ]
              ),
            );
              }
            }
          return   SizedBox(height: 700,child:  Center(child: Text(prob,style: const TextStyle(fontSize: 25,color: Colors.orangeAccent),)));
          }
        ),
        body:  TabBarView(
          children: <Widget>[
            Logos(email: email.text),
            Website(email: email.text),
            Mobile(email: email.text),
            Mockup(email: email.text)
          ],
        )
      ),
    );
  }
}

