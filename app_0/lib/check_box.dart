import 'package:flutter/material.dart';
class Check_box extends StatefulWidget {
  const Check_box({Key? key}) : super(key: key);

  @override
  State<Check_box> createState() => _Check_boxState();
}

class _Check_boxState extends State<Check_box> {
  bool female = false, male = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container(
        height: 100,
        width: 300,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        child: Row(children: [
          Text('Gender'),
          // VerticalDivider(color: Colors.white,thickness: 4,),
          Spacer(),
          Text('Female'),
          Checkbox(
            activeColor: Colors.black, //bg check color.
            checkColor: Colors.white, // check color.
            value: female, 
            onChanged: (val){
              setState(() {
                female = val!;
              });
              }),
              Text('Male'),
              Checkbox(
                value: male, 
                onChanged: (val){
                  setState(() {
                    male = val!;
                  });
                })
        ],),
      ),
    );
  }
}
