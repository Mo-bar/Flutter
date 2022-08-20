import 'package:flutter/material.dart';
import 'package:note/noteData.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  SqlDb sql = SqlDb();
  getdata() async {
    var resp =  await sql.readData('Select * from notes');
    return resp;
  }
  @override
  Widget build(BuildContext context) {
    // double md = MediaQuery.of(context).size.width; //screen width
    return  Scaffold(
      appBar: AppBar(title: Text('Home'),),
      floatingActionButton:FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed:() {
          Navigator.of(context).pushNamed('get_AddNotes');
        },
        child: Icon(Icons.add),
        ),
      body: Container(
        child: FutureBuilder(
          future: getdata(),
          builder: (BuildContext context, AsyncSnapshot snapshot) =>
          snapshot.hasData ? ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, i){
                                return Dismissible(
                                  key: Key('$i'),
                                  direction: DismissDirection.horizontal,
                                  onDismissed: (direction) async{
                                    int resp = await sql.deleteData("DELETE FROM notes WHERE id = ${snapshot.data[i]['id']}");
                                  },
                                  child: Card(
                                    child:Row(children: [
                                      Expanded(
                                        flex:1,
                                        child: Image.asset('images/1.png', fit: BoxFit.fill,),
                                      ),
                                      Expanded(
                                        flex:3,
                                      child:  ListTile(
                                        title: Text(snapshot.data[i]['title']),
                                        subtitle: Text(snapshot.data[i]['note']),
                                        trailing: IconButton(icon: Icon(Icons.edit), onPressed: (){}),
                                      ),
                                      )
                                    ],)
                                  ),
                                );
                                  // return ListNotes(notes: nots[0]['note']);
                              },
                            ) : Center(child: Text('No notes'),)
        
        )
      ),
    );
  }
}