import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}
class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Login(), 
    );
  }
}
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Text('Hello from HomePage.')
    );
  }
}//UI: user interface.
class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Text('Hello from LoginPage.', 
      style:TextStyle(
        fontSize:30,
        color:Color.fromARGB(255, 27, 87, 135),
        fontWeight: FontWeight.bold,
      )
      ),
    );
  }
}