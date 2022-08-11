import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  double sliderVal =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      drawer: Drawer(),
      body: Column(children: [
        Container(
          margin: EdgeInsets.only(top:20,left: 20),
          alignment: Alignment.topLeft,
          child: Text('Flutter Couse : [${sliderVal.floor()}/120]',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)  // toInt() : floor()
          ),
        Slider(
          min:0,
          max:120,
          inactiveColor: Colors.black12,
          activeColor: Colors.greenAccent,
          value: sliderVal, 
          onChanged: (val){
            setState(() {
              sliderVal = val;
            });
          }
          )
      ],)
    );
  }
}