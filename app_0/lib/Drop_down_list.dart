import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var deflt ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: 
        Container(
          alignment: Alignment.topCenter,
          width: double.infinity,
          // child: DropdownButtonFormField
          child: DropdownButton(
            dropdownColor: Color.fromARGB(255, 227, 232, 234),
            icon:Icon(Icons.flag),alignment: Alignment.center,
            hint: Container(width:160,child: Text('Select.',style: TextStyle(fontWeight:FontWeight.bold, fontSize: 17, ),textAlign: TextAlign.center,)),
            items: ['Morocco','USA','KSA','Turky'].map((e) => DropdownMenuItem(child: Text('$e'), value: e.toString())).toList(),
            onChanged: (val){
              setState(() {
                deflt = val.toString();
                print(deflt);
              });
            },
            value: deflt,
          ),
        )
    );
  }
}