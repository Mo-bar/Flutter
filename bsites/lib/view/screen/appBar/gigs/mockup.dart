import 'package:bsites/data/datasource/sq_lite.dart';
import 'package:flutter/material.dart';
import 'package:ai_awesome_message/ai_awesome_message.dart';
class Mockup extends StatefulWidget {
  final String email;
  const Mockup({Key? key, required this.email}) : super(key: key);
  @override
  State<Mockup> createState() => _MockupState();
}
class _MockupState extends State<Mockup> {
  final GlobalKey<ScaffoldState> scaffoldLogo = GlobalKey<ScaffoldState>();
  TextEditingController email = TextEditingController();
  SqlDb sql = SqlDb();
  loadData()async{
    List<Map> helper = [];
    helper.addAll(await sql.getdata('SELECT G.*,C.flag, U.fname FROM Gig G, User U,Country C WHERE G.catId = 3 AND G.email = U.email AND C.name = U.countryName'));
    return helper;
  }
@override
  void initState() {
    email.text = widget.email;
    loadData();
    super.initState();
  }
  int widgetKey = 0;
  Icon changeIcon(String icon,Key key) {
    if(icon =='true'  && key == Key('$widgetKey')){
      return const Icon(Icons.favorite_sharp,color:Colors.red);
    }
    return const Icon(Icons.favorite_outline_sharp,color: Colors.black,);
  }
    String press ='false';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: scaffoldLogo,
      body: FutureBuilder(
        future: loadData(),
        builder: (context,AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.none || snapshot.hasError){
            return const SizedBox(height: 700,child:  Center(child: Text('Error in connection!',style:  TextStyle(fontSize: 25,color: Color.fromARGB(255, 173, 30, 64)),)));
          }
          if (snapshot.hasData){
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
                          flex:4,
                          child: Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: ListTile(
                              title:  Column(children: <Widget>[
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
                                  //*********duration 
                                  Row(children: <Widget>
                                  [
                                    const Icon(Icons.hourglass_bottom_outlined,size: 19),
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
                              ]),
                              onTap: (){
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex:1,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(5),
                                backgroundColor: MaterialStateProperty.all( Colors.white,),
                                shadowColor: MaterialStateProperty.all(Colors.blueAccent)
                              ),
                              onPressed: ()async
                              {
                                List lst = await sql.getdata('SELECT * FROM Addtocard WHERE email = "${email.text}" AND gigId = ${snapshot.data![index]["gigId"]}');
                                if(lst.isEmpty)
                                {
                                    int iT = -1;
                                    iT = await sql.insertData('Addtocard', 
                                    {
                                      'email' : email.text,
                                      'gigId' : snapshot.data![index]["gigId"]
                                    });
                                    press = 'true';
                                    if(iT > 0 && mounted){ 
                                      Navigator.of(context).push(
                                        AwesomeMessageRoute(
                                          awesomeMessage: AwesomeHelper.createAwesome(title: "Notification", message:  "Added to favorite."),
                                          theme: Theme.of(context),
                                        ),
                                      );
                                    }
                                  }
                                if(lst.isNotEmpty)
                                {
                                    int dt = -1;
                                    dt = await sql.deleteReq('DELETE FROM Addtocard WHERE gigId = ${snapshot.data![index]["gigId"]}');
                                  press = 'false';
                                  if(dt > 0 && mounted)
                                  {
                                    Navigator.of(context).push(
                                      AwesomeMessageRoute(
                                        awesomeMessage: AwesomeHelper.createAwesome(title: "Notification", message:  "Deleted"),
                                        theme: Theme.of(context),
                                      ),
                                    );
                                  }
                                }
                                await sql.updateData('Gig', {'favorite' : press}, '${snapshot.data![index]["gigId"]}');
                                setState(() 
                                {
                                widgetKey = index;
                                lst;
                                });
                              },
                              child: changeIcon(press , Key('$index')),
                            )
                          ),
                      ],
                    ),
                  );
                }
              );
            }
            return const SizedBox(height: 700,child:  Center(child: Text('No mockup',style:  TextStyle(fontSize: 25,color: Color.fromARGB(255, 248, 168, 131)),)));
        },
      )
    );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
