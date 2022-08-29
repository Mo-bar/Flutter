import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../../data/datasource/sqlflite.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({Key? key}) : super(key: key);

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> 
{
  GlobalKey<FormState> gk = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController duration = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController category = TextEditingController(); 
  // List<String> niches = ['Logos','Web application','Mobile application','Tshirts'];
  late int catController;
  List<String> niches = [];
  SqlDb sql = SqlDb();
  late List<Map> listCat ;

  @override
  void initState() {
    get_data();
    super.initState();
  }
  get_data() async{
    listCat = await sql.getTableByName('Category');
    for (var element in listCat) { niches.add('${element['name']}'); }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: gk,
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
                
                  onPressed: (){
                    if(gk.currentState!.validate()){
                      // sql.insertData('Gig', <String, Object>{
                      //   'name' : '${name.text}',
                      //   'price' : price.text,
                      //   'duration' : duration.text,
                      //   'desc' : ${desc.text},
                      //   'email' : ${email.text},
                      //   'cat_id' : cat_controller,
                      // });
                      print('done');
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
                controller: name,
                maxLines: 1,
                maxLength: 50,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.near_me_outlined),
                  label: const Text('Gig name'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14)
                  )
                ),
              )
            ),
            // const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownSearch<String>(
                autoValidateMode: AutovalidateMode.onUserInteraction,
                popupProps: const PopupProps.menu(
                  showSearchBox: true,
                ),
                items:  niches,
                // selectedItem: null,
                validator: (value) => value == null || value =='' ? 'Required field': null,
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    prefixIcon: Icon(Icons.category),
                    label: Text('Category'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14))
                    )
                  )
                ),
                onChanged: (val) {
                  int pos =  niches.indexWhere((element) => element == val);
                  catController = ++pos;
                  // print('value : $val');
                  // print('index : $cat_controller');
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
                  prefixIcon: const Icon(Icons.price_check_rounded),
                  suffix: const Text('\$', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  // helperText: 'jjjjjjjj',
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