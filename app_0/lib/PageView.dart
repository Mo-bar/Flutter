import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  PageController pc = new PageController();
  List img = [
    {
      'url' : 'https://i.pinimg.com/736x/c1/73/2a/c1732ab0090b2a27defeba3f93b92f62.jpg',
    },
    {
      'url' : 'https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/v535batch2-mynt-43.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=9f602de67a347b7c50ef8eeac3835189',
    },
    {
      'url' : 'https://i.pinimg.com/736x/c1/9d/79/c19d7964360a0144b39a0e4b67ca2cfb.jpg',
    },
  ];
  @override
  void initState(){
    pc = new PageController(initialPage: 0, /*viewportFraction: .4 pic take 0.4 of fullsize*/);
    super.initState();
  }
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('PageView'),
          bottom: TabBar(tabs: [
            Tab(child: Text('PageView'),),
            Tab(child: Text('PageView.builder'),)
          ],)
        ),
        drawer: Drawer(),
        body: TabBarView(children: 
          [
            Column(
              children: [
                Container(
                  height: 300,
                  child: PageView(
                    controller: pc,
                    // reverse: true, // arabic version
                    // scrollDirection: Axis.vertical, 
                    onPageChanged: (index) => print(index),
                    children: [
                    Image.network('https://i.pinimg.com/736x/c1/73/2a/c1732ab0090b2a27defeba3f93b92f62.jpg', fit: BoxFit.fill,),
                    Image.network('https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/v535batch2-mynt-43.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=9f602de67a347b7c50ef8eeac3835189', fit: BoxFit.fill,),
                    Image.network('https://i.pinimg.com/736x/c1/73/2a/c1732ab0090b2a27defeba3f93b92f62.jpg', fit: BoxFit.fill,),
                    Image.network('https://i.pinimg.com/736x/c1/9d/79/c19d7964360a0144b39a0e4b67ca2cfb.jpg', fit: BoxFit.fill,),
                  ],)
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: (){
                      pc.jumpToPage(0);
                    } , 
                    child: Text('jump to first page.')
                    ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: (){
                    pc.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                  }
                  , child: Text('Animate to first page.')),
                ),
              ],
            ),
            //________Page_2
            Container(
              child: Column(
                children: [
                  Container(
                    height: 300,
                    child: PageView.builder(
                      controller: pc,
                      itemCount: img.length,
                      itemBuilder: (context, i) {
                      return Image.network(img[i]['url'], fit: BoxFit.fill,);
                    } ),
                  ),
                  ElevatedButton(onPressed: (){
                    pc.jumpToPage(0);
                  }, child: Text('Jump to first page')
                  ),
                  ElevatedButton(onPressed: (){
                    pc.animateToPage(img.length-1, duration: Duration(milliseconds: 400), curve: Curves.easeIn);
                  }, child: Text('Animate to last page'))
                ],
              )
            )
          ]
        )
      )
    );
  }
}