import 'package:bsites/data/datasource/sqlflite.dart';
import 'package:bsites/view/screen/account.dart';
import 'package:bsites/view/screen/addproduct.dart';
import 'package:flutter/material.dart';
import 'package:bsites/view/screen/product.dart';
import 'package:bsites/view/screen/auth/login.dart';
import 'dart:async';
class Home extends StatefulWidget {  
  final email_; 

  final dialCode_;

  Home({Key? key,this.email_,this.dialCode_}) : super(key: key, ) {}
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List<Map> user = [];
  GlobalKey<FormState> homeKey = GlobalKey();
  TextEditingController email = TextEditingController();
  SqlDb sql = SqlDb();
  int indexCountry = -1, oldIndex = -1 ;
  String fname ='' ,lname ='', flag = '', dialCode ='', username ='', userimg ='';
  Future<List> loadData()async { 
    List<Map> helper = [];
    helper.addAll( await sql.getdata('SELECT U.*, C.dial_code, C.flag FROM User U, Country C WHERE U.email = "${email.text}" AND U.dial_code = C.dial_code '));
    return helper;
  }
  @override
  initState() {
    super.initState();
    email.text = widget.email_;
    loadData();
  }

  @override
  Widget build(BuildContext context) {
  const List<Tab> tabs = <Tab>[
  Tab(text: 'Logos'),
  Tab(text: 'Web site'),
  Tab(text: 'Mobile app'),
  Tab(text: 'T-Shirt'),
];
  TextStyle? head1 = Theme.of(context).textTheme.headline1;
    return DefaultTabController(
    length: tabs.length,
    initialIndex: 0,
    key: homeKey,
    child : FutureBuilder
    (
      future: loadData(),
      builder: (context,AsyncSnapshot snapshot) => 
      Scaffold(
        appBar: AppBar( //*Appbar
          backgroundColor: const Color.fromARGB(255, 122, 164, 247),
          elevation: 8,
          title: Container(),
          actions: [
              IconButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const Login())));
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
        floatingActionButton: FloatingActionButton( //* floating button
          backgroundColor: Colors.greenAccent,
          onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Addproduct()));},
          child: const Icon(Icons.add,size:22)
        ),
        drawer: Drawer(
          child: Column
          (children: 
            <Widget>[
              Container(
                color: Colors.blue,
                child: Column(
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
                      subtitle: Row(children: <Widget>[const Icon(Icons.email_outlined,size:25,color: Colors.white,),const SizedBox(width: 6,),Text('${email.text}', style: const TextStyle(color: Colors.white, fontSize: 18, decoration: TextDecoration.underline),),]),
                      trailing: Text( snapshot.hasData ? "${snapshot.data[0]['flag']}" : 'null',style: const TextStyle(fontSize: 26),),
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
                  Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Account(
                    email: email.text,
                  ))));
                },
              ),
              const Divider(color: Colors.black, thickness: 1,height: 1, indent: 12, endIndent: 12,),
              ListTile(
                title:  Text('My listing', style: head1),
                leading: const Icon(Icons.list_alt_outlined),
                contentPadding: const EdgeInsets.only(top: 8, left: 20),
                onTap: () {
                  
                },
              ),
              const Divider(color: Colors.black, thickness: 1,height: 1,indent: 12, endIndent: 12),
              ListTile(
                contentPadding: const EdgeInsets.only(top: 8, left: 20),
                title:  Text('Contact', style: head1),
                leading: const Icon(Icons.contact_page_outlined),
                onTap: () {
                  
                },
              ),
              const Divider(color: Colors.black, thickness: 1,height: 1,indent: 12, endIndent: 12),
              ListTile(
                title:  Text('Log out', style: head1),
                leading: const Icon(Icons.logout_outlined, color:Colors.red),
                contentPadding: const EdgeInsets.only(top: 8, left: 20),
                onTap: () {
                  
                },
              ),
              const Divider(color: Colors.black, thickness: 1,height: 1,indent: 12, endIndent: 12),
            ]
          ),
        ),
        body: const TabBarView(
          children: [
            Product(),
            Product(),
            Product(),
            Product()
          ],
        )
      ),
    )
    );
  }

}

