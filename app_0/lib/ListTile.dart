import 'package:flutter/material.dart';

class list_tile extends StatefulWidget {
  const list_tile({Key? key}) : super(key: key);

  @override
  State<list_tile> createState() => _list_tileState();
}

class _list_tileState extends State<list_tile> {
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