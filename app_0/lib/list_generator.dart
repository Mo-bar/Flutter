import 'package:flutter/material.dart';
class list_generate extends StatefulWidget {
  const list_generate({Key? key}) : super(key: key);

  @override
  State<list_generate> createState() => _list_generateState();
}

class _list_generateState extends State<list_generate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 5,crossAxisSpacing: 3),
          children: List.generate(40, (index) => Container(child: Text('Container: $index'),color: Colors.amberAccent,)),
        )
      ),
    );
  }
}