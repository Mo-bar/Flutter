import 'package:flutter/material.dart';

class list_view extends StatefulWidget {
  const list_view({Key? key}) : super(key: key);

  @override
  State<list_view> createState() => _list_viewState();
}

class _list_viewState extends State<list_view> {
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
  List<Widget> widget_list = [
    Container(child:Text('Widget'),color: Colors.grey,height: 100,),
    Container(child:Text('Widget'),color: Colors.grey,height: 100,),
    Container(child:Text('Widget'),color: Colors.grey,height: 100,),
    Container(child:Text('Widget'),color: Colors.grey,height: 100,),
    Container(child:Text('Widget'),color: Colors.grey,height: 100,),
    Container(child:Text('Widget'),color: Colors.grey,height: 100,)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      //_______________ListView_______________
      body: ListView(
        scrollDirection: Axis.vertical,
        // reverse: true,
        // physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            child: null,
            color: Colors.greenAccent,
            height: 300,
          ),
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true, // ListView take full space of container
              children: [
                Container(
                  child: null,
                  color: Colors.redAccent,
                  width: 300,
                  height: 50,
                ),
                Container(
                  child: null,
                  color: Colors.black26,
                  width: 300,
                  height: 50,
                ),
                Container(
                  child: null,
                  color: Colors.white,
                  width: 300,
                  height: 50,
                )
              ],
            )
          ),
          Container(
            child: null,
            color: Colors.blueAccent,
            height: 300,
          ),
          Container(
            // height:300,
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:Mobile.length,
              itemBuilder: (context, i){
                return ListTile(
                  title: Text('Mobile : '+Mobile[i]['mobile']),
                  subtitle: Text(Mobile[i]['company']),
                  leading: Icon(Icons.phone_android),
                  // title: Text('${Mobile[i]['company']}'),
                );
              },
            )
          ),
          //_______________ListView.separated_______________
          Container(
            child: ListView.separated(
              shrinkWrap:true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:Mobile.length,
              itemBuilder: (context, i){
                return ListTile(
                  title: Text('Mobile : '+Mobile[i]['mobile']),
                  subtitle: Text(Mobile[i]['company']),
                  leading: Icon(Icons.phone_android),
                  // title: Text('${Mobile[i]['company']}'),
                );
              },
              separatorBuilder: (context, i){
                return Divider(color: Colors.grey, thickness: 3,);
              },
            )
          ),
          //_________________ListView.custom
          Container(
            // height: 300,
            child: ListView.custom(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              childrenDelegate: SliverChildBuilderDelegate((context, index) {
                return Text('Container : $index');
              },
              childCount: 10, 
              )
              )
          ),
          //___________________SliverChildChildDelegate.
          Container(
            child:ListView.custom(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              childrenDelegate: SliverChildListDelegate(widget_list),
            )
          )

        ],
      )
      );
  }
}