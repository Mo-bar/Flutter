import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool not = false, not2= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body:Column(
        children: [
          Container(
            padding: EdgeInsets.only(top:15),
            child: Text('Switch',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17))
            ),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text('Notifications'),
              Switch(
              value : not, 
              activeColor: Colors.white,
              activeTrackColor: Colors.greenAccent,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.redAccent,
              onChanged: (val){
                setState(() {
                  not = val;
                });
              }),
            ],
          ),
          Divider(color: Color.fromARGB(255, 122, 121, 162),thickness:4),
          Text('SwitchListTile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
          SwitchListTile(
            title: Text('Activate notifications.'),
            subtitle: Text('Tap to activate.'),
            secondary: Icon(Icons.notifications_active),
            isThreeLine:true,
            controlAffinity: ListTileControlAffinity.trailing,
            value: not2, 
            onChanged: (val){
            setState(() {
              not2 = val;
            });
          })
        ],
      )
    );
  }
}