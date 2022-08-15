import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  Future getData() async{
    print('Start Function.');
    await Future.delayed(Duration(seconds: 5), (){
      print('run time function');
    }
    );
    print('End function');
  }
  @override
  void initState(){
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}