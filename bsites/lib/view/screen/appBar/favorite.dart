import 'package:bsites/data/datasource/sq_lite.dart';
import 'package:bsites/view/screen/home_.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: must_be_immutable
class Favorite extends StatefulWidget {
String email;
  Favorite({Key? key,required this.email}) : super(key: key);
  @override
  State<Favorite> createState() => _FavoriteState();
}
// [{catId: 1, catName: logos}, {catId: 2, catName: Web site}, {catId: 3, catName: Mobile app}, {catId: 4, catName: T-Shirt}]
class _FavoriteState extends State<Favorite> {
  TextEditingController email = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldFav = GlobalKey<ScaffoldState>();
  SqlDb sql = SqlDb();
  int isPressed = 0;
  loadData()async{
    List<Map> helper = [];
    helper.addAll(await sql.getdata('SELECT A.*,G.*,C.flag, U.fname FROM Addtocard A, Gig G, User U,Country C WHERE A.email = "${email.text}" AND G.gigId = A.gigId AND G.email = U.email AND U.countryName = C.name;'));
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
    return  Scaffold(
      key: scaffoldFav,
      appBar: AppBar(
        title: const Text('Favorite items', style : TextStyle(fontWeight: FontWeight.bold,fontSize: 26, color: Color.fromARGB(255, 224, 224, 224), ),),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: (() {
            Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: ((context) => Home(
              email: email.text,
            ))));
          }
        ),
      ),),
      body: FutureBuilder(
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
                    color: Colors.white,
                    shadowColor: Colors.blueAccent,
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    key: Key('$index'),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex:3,
                          child: ListTile(
                            title: Column(children: <Row>[
                              
                                //*********Title
                                Row(children: <Widget>
                                [ 
                                    const Icon(Icons.title, size:16),
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
                                  //*********user 
                                  Row(children: <Widget>
                                  [
                                    const Icon(Icons.person_outline,size: 19),
                                    const SizedBox(width: 8,),
                                    Text('${snapshot.data![index]["fname"]}',style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)
                                  ],),
                                  //*********flag 
                                  Row(children: <Widget>
                                  [
                                    const Icon(Icons.flag_outlined,size: 19),
                                    const SizedBox(width: 8,),
                                    Text('${snapshot.data![index]["flag"]}',)
                                  ],),
                            ],),
                            onTap: (){
                            },
                          ),
                        ),
                        Expanded(flex :1,child: Text('${snapshot.data![index]["price"]}\$')),
                        Expanded(
                          flex:1,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(5),
                                backgroundColor: MaterialStateProperty.all( Colors.white,),
                                shadowColor: MaterialStateProperty.all(Colors.blueAccent)
                              ),
                              onPressed: ()async{
                                int del = -1;
                                del = await sql.deleteReq('DELETE FROM Addtocard WHERE gigId = ${snapshot.data![index]["gigId"]}');
                                await sql.updateData('Gig', {'favorite' : 'false'}, '${snapshot.data![index]["gigId"]}');
                                  if(del >0){
                                  setState(() {
                                  });
                                  }
                              },
                              child: const Icon(Icons.favorite_sharp,color:Colors.red),
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
