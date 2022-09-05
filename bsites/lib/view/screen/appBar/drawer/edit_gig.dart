// ignore_for_file: unnecessary_const

import 'package:ai_awesome_message/ai_awesome_message.dart';
import 'package:bsites/view/screen/home_.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../../../../data/datasource/sq_lite.dart';
class EditGig extends StatefulWidget {
  final int  gigId ;
  final String gigName;
  final double price;
  final String desc;
  final int duration ; 
  final String email;
  final int catId;
  const EditGig({Key? key,required this.catId,required this.email,required this.duration,required this.gigId ,required this.gigName,required this.price,required this.desc}) : super(key: key);
  @override
  State<EditGig> createState() => _EditGigState();
}
class _EditGigState extends State<EditGig> {
  GlobalKey<FormState> accountKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController gigName = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController desc = TextEditingController();  
  TextEditingController duration = TextEditingController();  
  int gigId =  -1;
  int catId = -1;
  double verPadding = 16;
  SqlDb sql = SqlDb();
  List<Map> categories = [];
  List<String> category = [];
  @override
  void initState() {
    loadData();
    email.text = widget.email;
    gigId = widget.gigId;
    gigName.text = widget.gigName;
    price.text = '${widget.price}';
    desc.text = widget.desc;
    duration.text = '${widget.duration}' ;
    catId = widget.catId;
    super.initState();
  }
  loadData() async {
    categories = await sql.getTableByName('Category');
    category.addAll(categories.map((item) => item['catName']).toList(growable: false).cast<String>());
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    if(categories.isEmpty){ 
      setState(() {});
      return const Center(child: CircularProgressIndicator(),);
    }
    return 
      Form
      (
        key: accountKey,
        autovalidateMode: AutovalidateMode.disabled,
        child :Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            shadowColor: Colors.blueAccent,
            elevation: 5,
            title:  const Text('Update Gig', style : TextStyle(fontWeight: FontWeight.bold,fontSize: 26, color: Color.fromARGB(255, 224, 224, 224), ),),
            leading: IconButton(
              onPressed: () {
                if(mounted){
                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined, color :  Color.fromARGB(255, 224, 224, 224), ),
            ),
            actions:  <Widget>[
              IconButton(onPressed: ()async{
                if(accountKey.currentState!.validate()){
                    int tester = await sql.updateData_('''
                      UPDATE Gig
                      SET gigName = "${gigName.text}",desc = "${desc.text}",price = ${price.text},desc = "${desc.text}" ,duration = ${duration.text} ,catId = $catId WHERE gigId = $gigId;
                    ''');
                  if(tester > 0){
                    if(mounted) 
                    {
                      Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context) => Home(
                      email: email.text,
                      ),));
                        Navigator.of(context).push(
                          AwesomeMessageRoute(
                            awesomeMessage: AwesomeHelper.createAwesome(title: "Notification", message:  "Gig updated!"),
                            theme: Theme.of(context),
                          ),
                        );
                    }
                  }else{
                    if(mounted) 
                    {
                      Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context) => Home(
                      email: email.text,
                      ),));
                        Navigator.of(context).push(
                          AwesomeMessageRoute(
                            awesomeMessage: AwesomeHelper.createAwesome(title: "Notification", message:  "Gig not updated!"),
                            theme: Theme.of(context),
                          ),
                        );
                    }
                  }
                  }
                }, icon: const Icon(Icons.done_outline, color: Color.fromARGB(255, 224, 224, 224),),
              ),
              const SizedBox(width: 18,)
            ],
          ),
          body: ListView(
            children: <Widget>[
              const SizedBox(height: 20,),
              ListTile(//*Email.
                title: TextFormField(
                  readOnly: true,
                  controller: email,
                  style:   const TextStyle(fontSize: 20,),
                  decoration:  InputDecoration(
                    isCollapsed: true,
                    label: const Text('Email'),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: verPadding),
                    prefixIcon: const Icon(Icons.email_outlined,size: 20,),
                    suffix: const Icon(Icons.edit_off,size: 20),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    )
                  ),
                ),
              ),
              const SizedBox(height: 8,),
              ListTile(//* Title
                title: TextFormField(
                  maxLength: 23,
                  controller: gigName,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) => value == null || value.isEmpty ? 'Required field' : null,
                  style:   const TextStyle(fontSize: 20,),
                  decoration:  InputDecoration(
                    counterStyle: const TextStyle(height:0.3, color: Colors.black),
                    label: const Text('Title'),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: verPadding),
                    prefixIcon: const Icon(Icons.title_outlined,size: 20,),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    )
                  ),
                ),
              ),
              ListTile(//* lname
                title: TextFormField(
                  controller: desc,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) => value == null || value.isEmpty ? 'Required field' : null,
                  style:   const TextStyle(fontSize: 20,),
                  decoration:  InputDecoration(
                    label: const Text('Description'),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: verPadding),
                    prefixIcon: const Icon(Icons.description_outlined,size: 20,),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    )
                  ),
                ),
              ),
              const SizedBox(height: 8,),
              Container(//*Category
                margin: const EdgeInsets.symmetric(horizontal: 18),
                child: DropdownSearch<String>(
                  popupProps: const PopupProps.menu(
                    menuProps: MenuProps(
                    ),
                  showSelectedItems: true,
                  showSearchBox: true,
                  ),
                  items: category,
                  dropdownDecoratorProps:  DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      label: const Text('Category'),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: verPadding),
                    prefixIcon: const Icon(Icons.category_outlined,size: 24,),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))
                      )
                    ),
                  ),
                  validator: (value)  =>  value == null || value.isEmpty ? 'Required field' : null,
                  onChanged: (value)
                  { 
                    if(value != null){
                      setState(() {
                      catId = category.indexOf(value);
                      });
                    }
                  },
                  selectedItem:  category[catId],
                ),
              ),
              const SizedBox(height: 8,),
              ListTile(
                title: TextFormField(
                  controller: duration,
                  validator: (value) => value == null || value.isEmpty ? 'Required field' : null,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  style:   const TextStyle(fontSize: 20,),
                  decoration:  InputDecoration(
                    label: const Text('Duration'),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: verPadding),
                    prefixIcon: const Icon(Icons.timelapse_outlined,size: 20,),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    )
                  ),
                ),
              ),
              const SizedBox(height: 8,),
              ListTile(
                title: TextFormField(
                  controller: price,
                  validator: (value) => value == null || value.isEmpty ? 'Required field' : null,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  style:   const TextStyle(fontSize: 20,),
                  decoration:  InputDecoration(
                    label: const Text('Price'),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: verPadding),
                    prefixIcon: const Icon(Icons.attach_money_outlined,size: 20,),
                    border: const OutlineInputBorder(
                      borderRadius: const BorderRadius.all(const Radius.circular(18))
                    )
                  ),
                ),
              ),
          ],)
        ),
      );
  }
}