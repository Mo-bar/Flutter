import 'package:flutter/material.dart';
import 'package:note/noteData.dart';

class EditNotes extends StatefulWidget {
  final new_title;
  final new_note ;
  final id;
  
  const EditNotes({Key? key,this.new_title,this.new_note, this.id}) : super(key: key);
  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();
  SqlDb sql = SqlDb();

  @override
  void initState() {
    note.text = widget.new_note;
    title.text = widget.new_title;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Edit note'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
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
          const SizedBox(height: 5,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: note,
              maxLength:200,
              maxLines: 4,
              minLines: 1,
              decoration: InputDecoration(

                labelText: 'Note',
                prefixIcon: const Icon(Icons.note_add_outlined),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14)
                )
              ),
            ),
          ),
          const SizedBox(height: 5,),
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
              ElevatedButton.icon(

              onPressed: (){bottomArea(); }, 
              icon: const Icon(Icons.image_search_outlined,color: Colors.blue,),
              label: const Text('Image note',style: TextStyle(color:Colors.blue),),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation:5,
                shadowColor: Colors.grey,
                textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
          ),
              ),
              ElevatedButton.icon(
                onPressed: () async{
                  String req = "UPDATE notes SET  WHERE id = ${widget.id} ";
                  int resp = await sql.updateData('notes', {'title' : title.text , 'note' : note.text }, '${widget.id}');
                  if(resp > 0){
                    Navigator.of(context).pushNamed('get_HomePage');
                  }
                }, 
                label: const Text('Save',style: TextStyle(color: Colors.blue),),
                icon: const Icon(Icons.save_outlined,color:Colors.blue),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 5,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
    return SizedBox(
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