import 'package:flutter/material.dart';
import 'package:note/noteData.dart';

class addNote extends StatefulWidget {
  const addNote({Key? key}) : super(key: key);

  @override
  State<addNote> createState() => _addNoteState();
}

class _addNoteState extends State<addNote> {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();
  SqlDb sql = new SqlDb();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Add note'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: title,
              maxLength: 30,
              minLines: 1,
              maxLines: 1,
              decoration: const InputDecoration(
                filled:true,
                fillColor: Colors.white,
                labelText: 'Note title.',
                prefixIcon: Icon(Icons.title_rounded)
              ),
            ),
          ),
          SizedBox(height: 5,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: note,
              maxLength:200,
              maxLines: 4,
              minLines: 1,
              decoration: InputDecoration(
                labelText: 'Note',
                prefixIcon: Icon(Icons.note_add_outlined),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14)
                )
              ),
            ),
          ),
          SizedBox(height: 5,),
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
              ElevatedButton.icon(

              onPressed: (){bottomArea(); }, 
              icon: Icon(Icons.image_search_outlined,color: Colors.blue,),
              label: Text('Image note',style: TextStyle(color:Colors.blue),),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation:5,
                shadowColor: Colors.grey,
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
          ),
              ),
              ElevatedButton.icon(
                onPressed: () async{
                  String req = "INSERT INTO notes(title,note) VALUES ('${title.text}','${note.text}')";
                  int? resp = await sql.insertData(req);
                  if(resp != null){
                    Navigator.of(context).pushNamed('get_HomePage');
                  }
                  print(resp);
                }, 
                label: Text('Save',style: TextStyle(color: Colors.blue),),
                icon: Icon(Icons.save_outlined,color:Colors.blue),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 5,
                  textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)
                  )
                ),
                )
            ] 
            )
        ],
      ),
    );
  }
  bottomArea() => showModalBottomSheet(context: context, builder: (context){
    return Container(
      height: 190,
      child: Column  (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.only(top:20,left: 20),
            alignment: Alignment.topLeft,
            child: const Text('Choose an image', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              ElevatedButton.icon(
                onPressed: (){}, 
                icon: const Icon(Icons.photo_album_outlined,color: Colors.blue), label: const Text('Gallery',style: TextStyle(color:Colors.blue),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 5,
                  shadowColor: Colors.grey,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                ),
                ElevatedButton.icon(
                  onPressed: (){}, 
                  icon: const Icon(Icons.camera_outlined, color: Colors.blue), 
                  label: const Text('Camera',style: TextStyle(color: Colors.blue)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 5,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )

                  ),

                  )
            ],)
          ])
    );
  });
} 