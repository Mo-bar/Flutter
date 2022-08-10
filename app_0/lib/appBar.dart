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
      appBar:AppBar(
        title: Text('Home'),
        leading:Icon(Icons.home),
        backgroundColor: Color.fromARGB(116, 0, 0, 0),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.exit_to_app))
        ],
        elevation: 0,
        shadowColor: Colors.red,
        centerTitle: true,
      )
    );
  }
}
