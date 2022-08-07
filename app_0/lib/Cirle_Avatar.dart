import 'package:flutter/material.dart';

class circle_avatar extends StatefulWidget {
  const circle_avatar({Key? key}) : super(key: key);

  @override
  State<circle_avatar> createState() => _circle_avatarState();
}

class _circle_avatarState extends State<circle_avatar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container(
        alignment: Alignment.topRight,
        child: CircleAvatar(
          backgroundColor: Colors.greenAccent,
          child: Text('MB'),

        ),
        )
    );
  }
}