import 'package:flutter/material.dart';
import 'package:app_0/Switch.dart' as Switch_;

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var selectedItem = 0;
  List<Widget> pages = [
    Center(child: Text('Widget <One>', style: TextStyle(fontWeight: FontWeight.bold),),),
    Switch_.Test()
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