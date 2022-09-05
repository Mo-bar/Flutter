import 'package:ai_awesome_message/ai_awesome_message.dart';
import 'package:bsites/view/screen/home_.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../data/datasource/sq_lite.dart';

class Addproduct extends StatefulWidget {
  final String email;
  const Addproduct({Key? key,required this.email}) : super(key: key);

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> 
{
  GlobalKey<FormState> addgigKey = GlobalKey<FormState>();
  TextEditingController gigName = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController duration = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController catName = TextEditingController();
  int catId = 0;
  List<String> niches = [];
  SqlDb sql = SqlDb();
  late List<Map> listCat ;

  FToast fToast =  FToast();
@override
  void initState() {
  loadData();
    email.text = widget.email;
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }
  // [{catId: 1, catName: Logos}, {catId: 2, catName: Web site}, {catId: 3, catName: Mobile app}, {catId: 4, catName: Mockup}]
  loadData() async{
    listCat = await sql.getTableByName('Category');
    for (var element in listCat) { niches.add('${element['catName']}'); }
    return await sql.getTableByName('Gig');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: addgigKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14,vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(//*back button
                    onPressed: (){
                    bool tester = Navigator.of(context).canPop();
                    if(tester) {
                      Navigator.of(context).pop();
                    }
                  }, icon: const Icon(Icons.backspace_outlined, size: 30,)),
                  const Text('New Gig.', style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                )),
                IconButton(//* save button
                
                  onPressed: ()async{
                    if(addgigKey.currentState!.validate()){
                          int tester = await sql.insertData('Gig', {
                          'gigName' : gigName.text,
                          'price' : price.text,
                          'duration' : duration.text,
                          'desc' : desc.text,
                          'email' : email.text,
                          'catId' :  catId,
                        });
                        if(tester > 0){
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(email: email.text),));
                              Navigator.of(context).push(
                                AwesomeMessageRoute(
                                  awesomeMessage: AwesomeHelper.createAwesome(title: "Notification", message:  "Added!"),
                                  theme: Theme.of(context),
                            ),
                          );
                          });
                        }
                    }
                  }, 
                  icon: const Icon(Icons.save,size: 30, color:Colors.green))
                ]
              ),
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value == null || value =='' ? 'Required field': null,
                controller: gigName,
                maxLines: 1,
                maxLength: 23,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.title_outlined),
                  label: const Text('Title',),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14)
                  )
                ),
              )
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownSearch<String>(
                autoValidateMode: AutovalidateMode.onUserInteraction,
                popupProps: const PopupProps.menu(
                  showSearchBox: true,
                ),
                items:  niches,
                selectedItem: null,
                validator: (value) => value == null || value =='' ? 'Required field': null,
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    prefixIcon: Icon(Icons.category_outlined),
                    label: Text('Category'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14))
                    )
                  )
                ),
                onChanged: (val) {
                  catName.text = val!;
                  setState(() {
                  catId = niches.indexOf(catName.text);
                  });
                },
              )
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value == null || value =='' ? 'Required field': null,
                controller: price,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.attach_money_outlined),
                  suffix: const Text('\$', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  label: const Text('Price'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14)
                  )
                ),
              )
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value == null || value =='' ? 'Required field': null,
                controller: duration,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.timelapse_sharp),
                  label: const Text('Duration(Days)'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14)
                  )
                ),
              )
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value == null || value =='' ? 'Required field': null,
                controller: desc,
                keyboardType: TextInputType.text,
                minLines: 1,
                maxLines: 4,
                maxLength: 300,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.description_outlined),
                  label: const Text('Description'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14)
                  )
                ),
              )
            ),
          ],
        ),
      )
    );
  }
}