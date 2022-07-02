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
      body:  Container(
        color:Colors.lightBlue,
        width: double.infinity,
        margin: EdgeInsets.all(10),
                //EdgeInsets.only(right:10),
                //EdgeInsets.inly(right:10,buttom:13,left:10 ,top:13),
                //EdgeInsets.symetric(vertical:20,horizontal:12),
        padding:EdgeInsets.all(20),
        height: 100,
        child: const Text('Hello from LoginPage.', 
          style:TextStyle(
            fontSize:30,
            color:Color.fromARGB(255, 27, 87, 135),
            fontWeight: FontWeight.bold,
            letterSpacing:5.0,
            wordSpacing: 2,
            decoration:TextDecoration.lineThrough,//overline || underline || 
            //backgroundColor:Colors.lightBlue,
          )
        )
      ),
    );
  }
}