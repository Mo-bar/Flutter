import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  ScrollController sc = new ScrollController();

  @override
  void initState(){
    sc.addListener((){
      print('Current Scroll value : ${sc.offset}');
      print('Min Sroll value: ${sc.position.minScrollExtent}');
      print('Max Scroll value: ${sc.position.maxScrollExtent}');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: ListView(
        controller: sc,
        children: [
          ElevatedButton(
            child: Text('Jump to bottom.'),
            onPressed: (){
              sc.jumpTo(sc.position.maxScrollExtent);
            },
          ),
          ...List.generate(20, (index)=> 
            Container(
              margin: EdgeInsets.all(10),
              child: Text('Container ${index+1}'),
              color: index.isEven ? Colors.greenAccent : Colors.redAccent,
              width: double.infinity,
              height: 100,

            )
          ),
          ElevatedButton(onPressed: (){
            sc.animateTo(sc.position.minScrollExtent, duration: Duration(seconds: 1), curve: Curves.easeIn);
          }, child: Text('AnimateTo top.'))
        ],
      )
    );
  }
}