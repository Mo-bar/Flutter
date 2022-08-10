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
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(context: context, builder: (builder)  {
              return AlertDialog(
                actions: [
                  IconButton(onPressed: () => print('OK'), icon: Icon(Icons.done)),Spacer(),
                  IconButton(onPressed: () => print('Cancel'), icon: Icon(Icons.cancel))
                ],
                actionsAlignment: MainAxisAlignment.spaceAround,
                actionsPadding: EdgeInsets.all(2),
                title: Text('Alert title.'),
                content: Text('Alert content.'),
                titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                contentTextStyle: TextStyle(color: Colors.redAccent),
              );
            });
            
          }, 
          child: Icon(Icons.message, color: Colors.white,),
        )
      )
    );
  }
}