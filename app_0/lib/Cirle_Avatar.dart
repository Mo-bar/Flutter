import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
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