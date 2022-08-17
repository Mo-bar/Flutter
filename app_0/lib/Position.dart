import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    getPosition();
    super.initState();
  }
  Position cp = new Position(longitude: 0, latitude: 0, timestamp: null, accuracy: 0.0, altitude: 0, heading: 0, speed: 0, speedAccuracy: 0);
  Future getPosition() async{
    bool services; 
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    if(!services){
      AwesomeDialog(
        context: context,
        title: 'Services.',
        body: Text('Services not Enabled.')
        )..show();
    }
    per = await Geolocator.checkPermission();
    if(per == LocationPermission.denied){
      per = await Geolocator.requestPermission();
      if(per == LocationPermission.always){
        return getLatandLong();
      }
      }
  }
  
  getLatandLong() async {
    return await Geolocator.getCurrentPosition().then((value) => value);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posintion test'),
      ),
      body: Center(
        child: ElevatedButton.icon(onPressed: () async{
          cp = await getLatandLong();
          print('Latitute'+cp.latitude.toString());
          print('Longtitute:'+cp.longitude.toString());
        }, icon: Icon(Icons.location_city_outlined), label: Text('Position')),
      )
    );
  }
}