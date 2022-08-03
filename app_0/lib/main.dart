import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}
class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: center_(),
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
//cards 
class Cards extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: const Card(
        color: Colors.lightBlue,
        elevation: 50,
        // shadow
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

// rows props.
class Rows extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container(
        height: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround, // spaceBetween, start end
          crossAxisAlignment: CrossAxisAlignment.center, // start, center, end
          children: [
          Text('Widget 0'),
          Text('widget 1'),
          Container(
            color: Colors.lightBlue, child: Text('Container'),
          ),
          Card(
            child: Text('card'),
            ),
        ],)
      ),
    );

  }
}

//Stacks props.
class Stacks extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold
    (
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container
      (
          width:400,
          height: 400,
          //child: Stack
          child: IndexedStack  
          //overflow: Overflow.visible,
          (
            index:1,
            alignment: Alignment.bottomRight,
            children : 
            [
              Container
              (
                width: 400,
                height: 400,
                color: Colors.blue,
                child: Text('Container '),
              ),
              Container
              (
                width: 300,
                height: 300,
                // margin: EdgeInsets.all(20),
                color: Color.fromARGB(255, 152, 26, 26),
                child: Text('Container '),
              ),
              Container
              (
                width: 200,
                height: 200,
                // margin: EdgeInsets.all(40),
                color: Color.fromARGB(255, 33, 243, 100),
                child: Text('Container '),
              ),
              Positioned(
                top:300,
                height:200,
                //bottom: 30,
                right:40,
                left:20,
                child: Container(
                  color: Colors.amberAccent,
                  child: Text('Positioned.'),
                ),
                
              ),

            ],
          ),
      ), 
    );
  }
}

//Expanded props.
class Exp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold
    (
      appBar: AppBar(),
      drawer: Drawer(),
      body: Column
      (
        children: 
        [
          Expanded
          (
            flex:2,
            child: Container(child: Text('One.'), color: Color.fromARGB(255, 52, 74, 26))
          ),
          Divider(color: Colors.white, thickness:2), 
          Expanded
          (
            flex: 1,
            child: Container( child: Text('Two.'), color: Colors.lightGreen)
          ),
          Divider(color:Colors.white, thickness:2),
          Expanded
          (
            flex: 1,
            child: Container(child: Text('Three.'), color: Colors.amber)
          ),
        ],
      ),
    );
  }
}
//Icons.
class Icons_ extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold
    (
      appBar: AppBar(),
      drawer: Drawer(),
      body: Row
      (
        children:
        [

          Expanded
          (
            child: Icon(Icons.room, size:20, ),
          ),
          VerticalDivider(color: Colors.lightBlue, thickness:2),
          Expanded
          (
            child: Icon(Icons.settings, size:20)
          ),
          VerticalDivider(color: Colors.lightBlue, thickness:2),
          Expanded
          (
            child: Icon(Icons.youtube_searched_for, color: Colors.red)
          )
        ],
      ),
    );
  }
}

//Training.
class Page_0 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold
    (
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container
      (
        height:double.infinity,
        width: double.infinity, 
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
            Container
            (
              alignment: Alignment.center,
              width:double.infinity,
              margin: EdgeInsets.all(20),
              child: Text('Title', style:TextStyle(fontWeight: FontWeight.bold,color:Colors.white )),
              decoration:BoxDecoration(color: Colors.lightBlue, border:Border.all(color: Colors.black) ),

            ),
            Container
            (
              width:double.infinity,
              margin: EdgeInsets.all(20),

              child: 
                Text('djscjsbcsjdkcskdcb jsdcbj jsdcb ksjdbcjk ksjdcbjk ksjdcbjd djcbj', textAlign: TextAlign.center,),

            ),
            Container
            (
              decoration:BoxDecoration(border:Border.all(color: Colors.black,width: 1)),
              margin: EdgeInsets.all(10),
              padding:EdgeInsets.all(10),
              child: Column
              (
                children: 
                [
                  Row
                  (                        
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: 
                    [
                      Row(

                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star),
                          Icon(Icons.star),
                        ],
                      ),
                      Text('17 reviews.', textAlign: TextAlign.start,)
                    ],
                  ),
                  Container(
                    margin:EdgeInsets.only(top:15),
                    child: Row(  
                      children: [
                      Expanded( child: Column(children: [ Icon(Icons.restaurant,color: Colors.green),Text('Feed'),Text('2-4')],)),
                      Expanded( child: Column(children: [ Icon(Icons.category,color: Colors.green),Text('Feed'),Text('2-4')],)),
                      Expanded( child: Column(children: [ Icon(Icons.emoji_food_beverage,color: Colors.green),Text('Feed'),Text('2-4')],)),
                    ],),
                  ),
                ],
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
//Wrap
class Wrap_ extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Wrap(
        direction: Axis.horizontal,
        children: [
          Container(
            margin: EdgeInsets.all(12),
            color:Colors.red,
            width:90,
            height:100
          ),          
          Container(
            margin: EdgeInsets.all(12),
            color:Colors.red,
            width:90,
            height:100
          ),          
          Container(
            margin: EdgeInsets.all(12),
            color:Colors.red,
            width:90,
            height:100
          ),          
          Container(
            margin: EdgeInsets.all(12),
            color:Colors.red,
            width:90,
            height:100
          ),
            Container(
            margin: EdgeInsets.all(12),
            color:Colors.red,
            width:90,
            height:100
          )
        ],
      )
    );
  }
}
class Single_Child_scroll_view extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: SingleChildScrollView(
        scrollDirection:Axis.vertical,
        child: Column(

        children: [
          Container(
            margin: EdgeInsets.all(12),
            color:Colors.red,
            width:90,
            height:100
          ),          
          Container(
            margin: EdgeInsets.all(12),
            color:Colors.red,
            width:90,
            height:100
          ),          
          Container(
            margin: EdgeInsets.all(12),
            color:Colors.red,
            width:90,
            height:100
          ),          
          Container(
            margin: EdgeInsets.all(12),
            color:Colors.red,
            width:90,
            height:100
          ),
            Container(
            margin: EdgeInsets.all(12),
            color:Colors.red,
            width:90,
            height:100
          ),          
          Container(
            margin: EdgeInsets.all(12),
            color:Colors.red,
            width:90,
            height:100
          ),          
          Container(
            margin: EdgeInsets.all(12),
            color:Colors.red,
            width:90,
            height:100
          ),
            Container(
            margin: EdgeInsets.all(12),
            color:Colors.red,
            width:90,
            height:100
          )
        ],
        ),
      )
    );
  }
}
class center_ extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container(child: Center(child: Text('Container.' ,style: TextStyle(fontSize: 16))),color: Colors.red,width: 100, height: 120)
    );
  }
}