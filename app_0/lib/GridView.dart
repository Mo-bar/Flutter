import 'package:flutter/material.dart';
// gridview has same props with listView.
class grid_view extends StatefulWidget {
  const grid_view({Key? key}) : super(key: key);

  @override
  State<grid_view> createState() => _grid_viewState();
}

class _grid_viewState extends State<grid_view> {
    List Mobile = [
    {
      'company' : 'samsung',
      'mobile' : 'S10'
    },
    {
      'company' : 'Apple',
      'mobile' : 'iPhone'
    },
    {
      'company' : 'Xiami',
      'mobile' : 'Readme'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      ///________GridView.builder
      // body: Container(
      //   child: GridView.builder(
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2, crossAxisSpacing: 3,mainAxisSpacing: 4,childAspectRatio: 1.7,
      //     ),
      //     itemCount: Mobile.length,
      //     itemBuilder: (context, i){
      //       return ListTile(   
      //         tileColor: Colors.greenAccent,               
      //           title: Text(Mobile[i]['mobile']),
      //           subtitle: Text(Mobile[i]['company']),
      //           leading: Icon(Icons.phone_android),
      //       );
      //     },
      //   ),
      // ),
      //___________GridView______________________________________
      // body:Container(
      //   child: GridView(
      //     padding: EdgeInsets.only(top:10),
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 3,
      //       mainAxisSpacing: 5,
      //       crossAxisSpacing: 5,
      //       childAspectRatio: 1.5,
      //       ),
      //       children: [
      //         Container(
      //           color: Colors.redAccent,
      //           height: 200,
      //           child: null,
      //         ),
      //         Container(
      //           color: Color.fromARGB(255, 177, 183, 68),
      //           height: 200,
      //           child: null,
      //         ),
      //         Container(
      //           color: Color.fromARGB(255, 61, 52, 149),
      //           height: 200,
      //           child: null,
      //         ),
      //         Container(
      //           color: Color.fromARGB(255, 88, 88, 88),
      //           height: 200,
      //           child: null,
      //         ),
      //       ],
      //   ),

      // )
      //____________GridView.count
      body: Container(
        padding:EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount:3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          // children: [
          //   Container(child: Icon(Icons.person_add),color: Colors.lightGreenAccent,),
          //   Container(child: Icon(Icons.person_add),color: Colors.lightGreenAccent,),
          //   Container(child: Icon(Icons.person_add),color: Colors.lightGreenAccent,),
          //   Container(child: Icon(Icons.person_add),color: Colors.lightGreenAccent,),
          //   Container(child: Icon(Icons.person_add),color: Colors.lightGreenAccent,),
          //   Container(child: Icon(Icons.person_add),color: Colors.lightGreenAccent,),
          // ],
          children: List.generate(6, (index) => Container(child: Icon(Icons.person_add),color: Color.fromARGB(255, 255, 208, 89),),),
        ),
      )
    );
  }
}