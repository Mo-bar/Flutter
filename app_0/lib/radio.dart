import 'package:flutter/material.dart';

class radio extends StatefulWidget {
  const radio({Key? key}) : super(key: key);

  @override
  State<radio> createState() => _radioState();
}

class _radioState extends State<radio> {
  String gender = '', country ='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Column(
        children: [
          Container(alignment: Alignment.topLeft,child: Text('Radio',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),),
          Divider(),
          Row(
            children: [
            Container(margin: EdgeInsets.only(left: 10),child: Text('Gender')),
            Spacer(),
            Text('Male'),
            Radio(
            value: 'male', 
            groupValue: gender, 
            onChanged: (val){
              setState(() {
                gender = val.toString();
                print(gender);
              });
            }
            ),
            Text('Female'),
            Radio(
            value: 'female', 
            groupValue: gender, 
            onChanged: (val){
              setState(() {
                gender = val.toString();
                print(gender);
              });
            }
            ),Spacer()
          ]),
          Container(alignment: Alignment.topLeft,child: Text('RadioListTile'),),
          Divider(),
          RadioListTile(
          value: 'Morocco', 
          groupValue: country, 
          title: Text('Morocco'),
          subtitle: Text('North africa.'),
          secondary: Icon(Icons.flag),
          controlAffinity: ListTileControlAffinity.trailing,
          activeColor:Colors.redAccent,
          selected: country == 'Morocco' ? true : false,
          isThreeLine: true,
          onChanged: (val){
            setState(() {
              country = val.toString();
            });
          }),
          RadioListTile(
          value: 'Egypt', 
          groupValue: country, 
          title: Text('Egypt'),
          subtitle: Text('North africa.'),
          secondary: Icon(Icons.flag),
          controlAffinity: ListTileControlAffinity.trailing,
          activeColor:Color.fromARGB(255, 0, 0, 0),
          selected: country == 'Egypt' ? true : false,
          isThreeLine: true,
          onChanged: (val){
            setState(() {
              country = val.toString();
            });
          }),
          RadioListTile(
          value: 'Algerie', 
          groupValue: country, 
          title: Text('Algerie'),
          subtitle: Text('North africa.'),
          secondary: Icon(Icons.flag),
          controlAffinity: ListTileControlAffinity.trailing,
          activeColor:Color.fromARGB(255, 33, 119, 1),
          selected: country == 'Algerie' ? true : false,
          isThreeLine: true,
          onChanged: (val){
            setState(() {
              country = val.toString();
            });
          }),
        ],
      ),
    );
  }
}