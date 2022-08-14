import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  List nots = [
    {
      'note' : ' object object object object object object object object ',
      'image' : 'images/1.png',
    },
    {
      'note' : ' object object object object object object object object ',
      'image' : 'images/1.png',
    },
    {
      'note' : ' object object object object object object object object ',
      'image' : 'images/1.png',
    },
    {
      'note' : ' object object object object object object object object ',
      'image' : 'images/1.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    double md = MediaQuery.of(context).size.width; //screen width
    return  Scaffold(
      appBar: AppBar(title: Text('Home'),),
      floatingActionButton:FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed:(){
          Navigator.of(context).pushNamed('get_AddNotes');
        },
        child: Icon(Icons.add),
        ),
      body: Container(
        child: ListView.builder(
          itemCount: nots.length,
          itemBuilder: (context, i){
            return Dismissible(
              key: Key('$i'),
              child: Card(
                child:Row(children: [
                  Expanded(
                    flex:1,
                    child: Image.asset('images/1.png', fit: BoxFit.fill,),
                  ),
                  Expanded(
                    flex:3,
                  child:  ListTile(
                    title: Text('Title.'),
                    subtitle: Text(nots[i]['note']),
                    trailing: IconButton(icon: Icon(Icons.edit), onPressed: (){}),
                  ),
                  )
                ],)
              ),
            );
              // return ListNotes(notes: nots[0]['note']);
          },
        )
      ),
    );
  }
}

class ListNotes extends StatelessWidget{
  var notes ;
  ListNotes(this.notes, );
  @override
  Widget build(BuildContext context){
    return ListTile(
      title: Text(notes[0]["note"]),
    );
  }
}