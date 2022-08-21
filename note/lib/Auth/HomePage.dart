import 'package:flutter/material.dart';
import 'package:note/noteData.dart';
import 'package:note/CRUD/edit.dart';
import 'package:snack/snack.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  SqlDb sql = SqlDb();
  List notes = [];
  bool isLoading = true;
  @override
  void initState() {
    getdata();
    super.initState();
  }
  void getdata() async {
    List<Map> resp =  await sql.readData('notes');
    notes.addAll(resp);
    isLoading = false;
    if(mounted){
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    // double md = MediaQuery.of(context).size.width; //screen width
    return  Scaffold(
      appBar: AppBar(title: const Text('Home'),),
      floatingActionButton:FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed:() {
          Navigator.of(context).pushNamed('get_AddNotes');
        },
        child: const Icon(Icons.add),
        ),
      body: SizedBox(
        child: isLoading == true ? const Center(child: Text('Loading...'),):
                            ListView.builder(
                              itemCount: notes.length,
                              itemBuilder: (context, i){
                                return   notes.isEmpty ? const Center(child: Text('No notes.'),) : SizedBox(
                                  child: SizedBox(
                                    child: Dismissible(
                                      key: Key("${notes[i]['id']}"),
                                      direction: DismissDirection.horizontal,
                                      background: Container(
                                        color: Colors.redAccent,
                                        child:  Container(alignment: Alignment.centerLeft,margin:  const EdgeInsets.only(left: 30), child: const Icon(Icons.delete_forever, color: Colors.white, size: 40,),)
                                      ),
                                      
                                      onDismissed: (DismissDirection direction) async{
                                        int resp = await sql.deleteData('notes', "${notes[i]['id']}");
                                        if(resp > 0){
                                          setState(() {
                                          notes.removeWhere((element) => element['id'] == notes[i]['id']); //* remove from UI
                                          });
                                        }
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
                                            title: Text(notes[i]['title']),
                                            subtitle: Text(notes[i]['note']),
                                            trailing: IconButton(icon: const Icon(Icons.edit),onPressed: () {
                                              Navigator.of(context).push(MaterialPageRoute(builder: ((context) => EditNotes(
                                                id: notes[i]['id'],
                                                new_title: notes[i]['title'],
                                                new_note: notes[i]['note'],
                                              ))));
                                            },),
                                          ),
                                          )
                                        ],)
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
      ) 
        //*Another methode with futurebuilder.
        //  child: FutureBuilder(
        //   future: getdata(),
        //   builder: (BuildContext context, AsyncSnapshot snapshot) =>
        //   snapshot.hasData ? ListView.builder(
        //                       itemCount: snapshot.data!.length,
        //                       itemBuilder: (context, i){
        //                         return Dismissible(
        //                           key: Key('$i'),
        //                           direction: DismissDirection.horizontal,
        //                           background: Container(
        //                             color: Colors.redAccent,
        //                             child: Center(child: Text('Removing', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),)
        //                           ),
        //                           onDismissed: (direction) async{
        //                             int resp = await sql.deleteData("DELETE FROM notes WHERE id = ${snapshot.data[i]['id']}");
        //                           },
        //                           child: Card(
        //                             child:Row(children: [
        //                               Expanded(
        //                                 flex:1,
        //                                 child: Image.asset('images/1.png', fit: BoxFit.fill,),
        //                               ),
        //                               Expanded(
        //                                 flex:3,
        //                               child:  ListTile(
        //                                 title: Text(snapshot.data[i]['title']),
        //                                 subtitle: Text(snapshot.data[i]['note']),
        //                                 trailing: IconButton(icon: Icon(Icons.edit), onPressed: (){}),
        //                               ),
        //                               )
        //                             ],)
        //                           ),
        //                         );
        //                       },
        //                     ) : Center(child: Text('No notes'),)
        
        // )
      
    );
  }
}