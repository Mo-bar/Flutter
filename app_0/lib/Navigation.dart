import 'package:flutter/material.dart';
import 'package:app_0/list_generator.dart' as list_generator;

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation page.'),
        
      ),
      drawer: Drawer(),
      body:ListView(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder:(context){
                  return list_generator.Test();
                }));
              },
              child: Text('ListGenerator page'),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('get_dropdownlist'); // can not to back to curent page
              },
              child:Text('DropDownList page.')
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: ElevatedButton(
              onPressed: (() {
                Navigator.of(context).pushNamed('get_ListTile');
              }
            ),
            child: Text('ListTile page')
          )),
          Container(
            alignment: Alignment.topCenter,
            child: ElevatedButton(
              onPressed: (() {
                Navigator.of(context).pushNamed('get_GridView');
              }),
              child: Text('GridView'),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: ElevatedButton(onPressed: (() {
              Navigator.of(context).pushNamed('get_ListView');
            }),
            child:Text('ListView')
          )),
          Container(
            alignment: Alignment.topCenter,
            child: ElevatedButton(onPressed: (() {
              Navigator.of(context).pushNamed('get_CheckkBox');
            }),
            child:Text('CheckBox page')
          )),
          Container(
            alignment: Alignment.topCenter,
            child: ElevatedButton(onPressed: (() {
              Navigator.of(context).pushNamed('get_radio');
            }),
            child:Text('Radio page')
          )),
          Container(
            alignment: Alignment.topCenter,
            child: ElevatedButton(onPressed: (() {
              Navigator.of(context).pushNamed('get_Switch');
            }),
            child:Text('Switch page')
          )),
          Container(
            alignment: Alignment.topCenter,
            child: ElevatedButton(onPressed: (() {
              Navigator.of(context).pushNamed('get_CircleAvatar');
            }),
            child:Text('CircleAvatar Page.')
          )),
          Container(
            alignment: Alignment.topCenter,
            child: ElevatedButton(onPressed: (() {
              Navigator.of(context).pushNamed('get_AlertDialog');
            }),
            child:Text('AlertDialog page')
          )),
          Container(
            alignment: Alignment.topCenter,
            child: ElevatedButton(onPressed: (() {
              Navigator.of(context).pushNamed('get_AppBar');
            }),
            child:Text('AppBar page.')
          )),
          Container(
            alignment: Alignment.topCenter,
            child: ElevatedButton(onPressed: (() {
              Navigator.of(context).pushNamed('get_Drawer');
            }),
            child:Text('Drawer page.')
          )),
          Container(
            alignment: Alignment.topCenter,
            child: ElevatedButton(onPressed: (() {
              Navigator.of(context).pushNamed('get_TabBarView');
            }),
            child:Text('TabBarView page')
          )),
          Container(
            alignment: Alignment.topCenter,
            child: ElevatedButton(onPressed: (() {
              Navigator.of(context).pushNamed('get_BottomNavigationBar');
            }),
            child:Text('BottomNaviagatorBar page')
          )),
          Container(
            alignment: Alignment.topCenter,
            child: ElevatedButton(onPressed: (() {
              Navigator.of(context).pushNamed('get_PageView');
            }),
            child:Text('PageView ')
          )),
          Container(
            alignment: Alignment.topCenter,
            child: ElevatedButton(onPressed: (() {
              Navigator.of(context).pushNamed('get_TextFromField');
            }),
            child:Text('TextFormField')
          )),
          Container(
            alignment: Alignment.topCenter,
            child: ElevatedButton(onPressed: (() {
              Navigator.of(context).pushNamed('get_Slider');
            }),
            child:Text('Slider')
          )),
          Container(
            alignment: Alignment.topCenter,
            child: ElevatedButton(
              onPressed: (() {
                Navigator.of(context).pushNamed('get_ScrollController');
              }),
              child: Text('ScrollController'),
            ),
          )
        ]
      )
    );
  }
}