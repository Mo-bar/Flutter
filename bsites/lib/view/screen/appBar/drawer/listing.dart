import 'package:bsites/data/datasource/sq_lite.dart';
import 'package:bsites/view/screen/home_.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'edit_gig.dart';
class Listing extends StatefulWidget {
final String email;
  const Listing({Key? key,required this.email}) : super(key: key);
  @override
  State<Listing> createState() => _ListingState();
}
// [{catId: 1, catName: logos}, {catId: 2, catName: Web site}, {catId: 3, catName: Mobile app}, {catId: 4, catName: T-Shirt}]
class _ListingState extends State<Listing> {
  TextEditingController email = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldFav = GlobalKey<ScaffoldState>();
  SqlDb sql = SqlDb();
  int isPressed = 0;
  loadData()async{
    List<Map> helper = [];
    helper.addAll(await sql.getdata('SELECT G.*,C.catName FROM  Gig G,Category C WHERE email = "${email.text}" AND G.catId = C.catId;'));
    return helper;
  }
FToast fToast =  FToast();
@override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    loadData();
    email.text = widget.email;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold
    (
      key: scaffoldFav,
      appBar: AppBar
      (
        backgroundColor: Colors.blueAccent,
        title: const Text('My listings', style : TextStyle(fontWeight: FontWeight.bold,fontSize: 26, color: Color.fromARGB(255, 224, 224, 224), ),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: (() {
            Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: ((context) => Home(
              email: email.text,
            ))));
          }
        ),
        ),
      ),
      body: FutureBuilder
      (
        future: loadData(),
        builder: (context,AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasError){
              return Text('${snapshot.error}');
            }else if (snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  
                  return Card(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    shadowColor: Colors.blueAccent,
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    key: Key('$index'),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex:5,
                          child: ListTile(
                            title:  Column
                            (
                              children: <Widget>[
                                Row(children: <Widget>
                                [//*********Title
                                    const Icon(Icons.title_outlined, size: 16),
                                    const SizedBox(width: 8,),
                                    Text('${snapshot.data![index]["gigName"]}',style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                                  ],),
                                  //*********Desc 
                                  Row(children: <Widget>
                                  [
                                    const Icon(Icons.description_outlined,size: 16),
                                    const SizedBox(width: 8,),
                                    Text('${snapshot.data![index]["desc"]}',style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)
                                  ],),
                                  //*********duration 
                                  Row(children: <Widget>
                                  [
                                    const Icon(Icons.timer_outlined,size: 19),
                                    const SizedBox(width: 8,),
                                    Text('${snapshot.data![index]["duration"]}  days',style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)
                                  ],),
                                  //*********price 
                                  Row(children: <Widget>
                                  [
                                    const Icon(Icons.attach_money,size: 19),
                                    const SizedBox(width: 8,),
                                    Text('${snapshot.data![index]["price"]} \$',style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)
                                  ],),
                                  Row(//*********category
                                    children: <Widget>[const Icon(Icons.category_outlined,size:20),
                                    const SizedBox(width: 6,),
                                    Text('${snapshot.data![index]["catName"]}',style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),],
                                  ),
                              ],
                            ),
                            onTap: (){
                            },
                          ),
                        ),
                        Expanded( //*Delete 
                          flex:1,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(5),
                                backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 255, 255, 255)),
                                shadowColor: MaterialStateProperty.all(Colors.blueAccent)
                              ),
                              onPressed: ()async{
                                int del = -1;
                                del = await sql.deleteReq('DELETE FROM Gig WHERE gigId = ${snapshot.data![index]["gigId"]}');
                                  if(del >0){
                                  setState(() {});
                                  }
                              },
                              child: const Icon(Icons.delete,color:Colors.red,size:20),
                            )
                          ),
                          const SizedBox(width: 19,),
                        Expanded(//* update button
                          flex:1,
                          child:                             ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(5),
                                backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 255, 255, 255)),
                                shadowColor: MaterialStateProperty.all(Colors.blueAccent)
                              ),
                              onPressed: ()async
                              {
                                setState(() {
                                  Navigator.of(context).push(MaterialPageRoute(builder: ((context) => EditGig
                                  (
                                    gigId : snapshot.data![index]["gigId"],
                                    gigName : snapshot.data![index]["gigName"],
                                    desc : snapshot.data![index]["desc"],
                                    price : snapshot.data![index]["price"],
                                    email: email.text,
                                    duration : snapshot.data![index]["duration"],
                                    catId: snapshot.data![index]["catId"],
                                  )
                                  )));
                                });
                                  
                              },
                              child: const Icon(Icons.edit,color: Colors.grey,size: 20,),
                            )
                          ),
                      ],
                    ),
                  );
                  }
              );
            }else{
              return const SizedBox(height: 700,child:  Center(child: Text('No Gigs',style: TextStyle(fontSize: 25,color: Colors.orangeAccent),)));
            }
          }
          return const  Center(child:  CircularProgressIndicator());
        },
      )
      );
  }
}
