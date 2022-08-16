import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  Future getPosition() async{
    bool services;
    services = await Geolocator.isLocationServiceEnabled();
    if(!services){
      AwesomeDialog(
        context: context,
        title: 'Services.',
        body: Text('Services not Enabled.')
        )..show();
    }else{
            AwesomeDialog(
        context: context,
        title: 'Services.',
        body: Text('Services is Enabled.')
        )..show();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posintion test'),
      ),
      body: Center(
        child: ElevatedButton.icon(onPressed: ()=> getPosition(), icon: Icon(Icons.location_city_outlined), label: Text('Position')),
      )
    );
  }
}