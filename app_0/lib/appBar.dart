import 'package:flutter/material.dart';

class app_bar extends StatefulWidget {
  const app_bar({Key? key}) : super(key: key);

  @override
  State<app_bar> createState() => _app_barState();
}

class _app_barState extends State<app_bar> {
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
