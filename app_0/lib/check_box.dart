import 'package:flutter/material.dart';
class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool female = false, male = false, usa = false, ma = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        child: Column(
          children: 
          [
            Container( alignment: Alignment.topLeft,child: Text('Checkbox.',style: TextStyle(fontWeight: FontWeight.bold),)),
            Container(
              child: Row(children: 
              [
                Text('Gender'),Spacer(),
                // VerticalDivider(color: Colors.white,thickness: 4,),
                // Spacer(),
                Text('Female'),
                Checkbox(
                  activeColor: Colors.black, //bg check color.
                  checkColor: Colors.white, // check color.
                  value: female, 
                  onChanged: (val){
                    setState(() {
                      female = val!;
                    });
                    }),
                    Text('Male'),
                Checkbox(
                      value: male, 
                      onChanged: (val){
                        setState(() {
                          male = val!;
                        });
                      }),
              ]),
            ),
          
          Divider(thickness:3),
          Container(
            child: Column(
              children: [
                Container(alignment: Alignment.topLeft,child: Text('ChechboxListTile', style: TextStyle(fontWeight: FontWeight.bold),)),
                CheckboxListTile(
                  contentPadding: EdgeInsets.only(top:10),
                  title: Text('USA'),
                  subtitle: Text('United State of America.'),
                  secondary: Icon(Icons.flag),
                  checkColor: Colors.white,
                  activeColor: Colors.lightBlueAccent,
                  isThreeLine: true,
                  value: usa,
                  selected:usa,
                  controlAffinity: ListTileControlAffinity.platform,
                  onChanged:((val){ 
                  setState(() {
                    usa = val!;
                  });
                  })
                ),
                CheckboxListTile(
                  contentPadding: EdgeInsets.only(top:10),
                  title: Text('Morocco'),
                  subtitle: Text('Kingdom of Morocco.'),
                  secondary: Icon(Icons.flag),
                  checkColor: Colors.white,
                  activeColor: Colors.redAccent,
                  isThreeLine: true,
                  value: ma,
                  selected:ma,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged:((val){ 
                  setState(() {
                    ma = val!;
                  });
                })
                )
              ],
            ),
          )
                // CheckboxListTile(value: , onChanged: onChanged)
          ],
        )
    ),
    );
  }
}
