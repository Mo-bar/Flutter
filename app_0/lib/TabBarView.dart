import 'package:flutter/material.dart';
class tabbar_view extends StatefulWidget {
  const tabbar_view({Key? key}) : super(key: key);

  @override
  State<tabbar_view> createState() => _tabbar_viewState();
}

class _tabbar_viewState extends State<tabbar_view> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // number of widget
      initialIndex: 4,
      child: 
      Scaffold(
        appBar: AppBar(
          title: Text('TabBar'),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            labelColor: Colors.white, // color of the tab
            labelStyle: TextStyle(letterSpacing: 2),
          

            tabs: [
              Tab(child: Text('Widget 1'),icon: Icon(Icons.pages)),
              Tab(child: Text('widget 2'),icon: Icon(Icons.pages)),
              Tab(child: Text('Widget 3'),icon: Icon(Icons.pages)),
              Tab(child: Text('Widget 4'),icon: Icon(Icons.pages)),
              Tab(child: Text('Widget 5'),icon: Icon(Icons.pages)),
            ],
          )
        ),
        drawer: Drawer(),
        body: TabBarView(
          children: [
            Container(
              width:double.infinity,
              child: Text('Container One.'),
              color: Colors.redAccent,
            ),
            Container(
              width:double.infinity,
              child: Text('Container Two.'),
              color: Colors.blueAccent,
            ),
            Container(
              width:double.infinity,
              child: Text('Container Three.'),
              color: Colors.greenAccent,
            ),
            Container(
              width:double.infinity,
              child: Text('Container Foor.'),
              color: Color.fromARGB(255, 60, 73, 67),
            ),
            Container(
              width:double.infinity,
              child: Text('Container Five.'),
              color: Color.fromARGB(255, 167, 179, 59),
            ),
          ],
        ) 
      )
      );
  }
}