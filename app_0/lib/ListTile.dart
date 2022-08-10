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
      body: ListTile(
        title: Text('S20 Ultra'),
        subtitle: Text('Samsung'),
        leading: Icon(Icons.phone_iphone),
        trailing: Text('999 \$'),
        isThreeLine:true,
        onTap: (){},
      ),
    );
  }
}