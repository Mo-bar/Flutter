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
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 5,crossAxisSpacing: 3),
          children: List.generate(40, (index) => Container(width: 200,child: Text('Container: $index'),color: Colors.amberAccent,)),
        )
      ),
    );
  }
}