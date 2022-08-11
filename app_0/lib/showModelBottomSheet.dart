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
      appBar: AppBar(
        title: Text('showModelBottomSheet'),
      ),
      drawer: Drawer(),
      body: Center(
        child: ElevatedButton(
          child: Text('showModalBottomSheet.'),
          onPressed: (){
            showModalBottomSheet(context: context, builder: (context){
              return Container(alignment: Alignment.center,child: Text('Alert'),);
            });
          },
        ),
      )
    );
  }
}