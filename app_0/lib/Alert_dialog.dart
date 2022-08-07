import 'package:flutter/material.dart';
class alert_dialog extends StatefulWidget {
  const alert_dialog({Key? key}) : super(key: key);

  @override
  State<alert_dialog> createState() => _alert_dialogState();
}

class _alert_dialogState extends State<alert_dialog> {
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