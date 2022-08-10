import 'package:flutter/material.dart';
import 'package:app_0/Switch.dart';

class Test_State extends StatefulWidget {
  const Test_State({Key? key}) : super(key: key);

  @override
  State<Test_State> createState() => _Test_StateState();
}

class _Test_StateState extends State<Test_State> {
  var selectedItem = 0;
  List<Widget> pages = [
    Center(child: Text('Widget <One>', style: TextStyle(fontWeight: FontWeight.bold),),),
    switch_()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        Text('BottomNavigationBar')
      ),
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.black26,
        selectedItemColor: Colors.black87,
        selectedFontSize: 17,
        unselectedItemColor: Colors.black45,
        currentIndex:selectedItem,
        onTap: (index){
          setState(() {
            selectedItem = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Widget 1',
            icon: Icon(Icons.account_circle)
          ),
          BottomNavigationBarItem(
            label: 'Widget 2',
            icon: Icon(Icons.access_time)
          )
        ],
      ),
      body: pages.elementAt(selectedItem)
    );
  }
}