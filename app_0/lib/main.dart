import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}
class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Columns_(), 
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
      body:  Container
      (
        //color:Colors.lightBlue, 
        width: double.infinity,
        margin: EdgeInsets.all(10),
                //EdgeInsets.only(right:10),
                //EdgeInsets.inly(right:10,buttom:13,left:10 ,top:13),
                //EdgeInsets.symetric(vertical:20,horizontal:12),
        padding:EdgeInsets.all(40),
        height: double.infinity,
        decoration:BoxDecoration(
            color:Colors.lightBlue,
            border:Border.all(color:Colors.black,width:2),
            // border: Border(left: BorderSide(color: Colors.red, width:2), Border(right:BorderSide(color:Colors.green, width:2)))
            // ignore: prefer_const_constructors
            image: DecorationImage(
              fit: BoxFit.cover,
              repeat: ImageRepeat.repeatX, // repeatY , noRepeat
              image: const NetworkImage('https://pbs.twimg.com/media/D9n35y6WkAIaciR?format=jpg&name=large')),
        ),

        child: const Text('Hello from LoginPage.', 
          style:TextStyle(
            fontSize:30,
            color:Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
            letterSpacing:5.0,
            wordSpacing: 2,
            decoration:TextDecoration.lineThrough,//overline || underline || 
            //backgroundColor:Colors.lightBlue,
          )
        ),
      ),
    );
  }
}
class Cards extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: const Card(
        color: Colors.lightBlue,
        elevation: 50, // shadow
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(20),
        //   side: BorderSide(color: Colors.black, width: 4
        //   )
        // ),
        child: Text('HI FROM CARDS.', style: TextStyle(fontSize: 40))
      
      )
    );
  }
}
class Columns_ extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: Container(
        width: double.infinity,
        color: Colors.lightBlueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
          //spaceAround, spaceBetween, start, end
          crossAxisAlignment: CrossAxisAlignment.center,
          //start center end.
          children: [
          const Text('Widget 1'),
          const Text('Widget 2'),
          const Text('Widget 3'),
          const Text('Widget 4')
        ],
        ),
      ),
    );
  }
}