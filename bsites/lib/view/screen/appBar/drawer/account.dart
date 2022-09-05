import 'package:bsites/view/screen/home_.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../../../../data/datasource/sq_lite.dart';

class Account extends StatefulWidget {
  final String fname;
  final String lname;
  final String country;
  final String email;
  final String passwd;
  const Account({Key? key,required this.email,required this.fname ,required this.lname,required this.country,required this.passwd}) : super(key: key);
  @override
  State<Account> createState() => _AccountState();
}
class _AccountState extends State<Account> {
  GlobalKey<FormState> accounrKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController countryName = TextEditingController();
  TextEditingController passwd = TextEditingController();  
  SqlDb sql = SqlDb();

  List<Map> countries = [];
  List<String> country = [];

  @override
  void initState() {
    loadData();
    email.text = widget.email;
    fname.text = widget.fname;
    lname.text = widget.lname;
    countryName.text = widget.country;
    passwd.text = widget.passwd;
    super.initState();
  }
  void loadData() async{
    countries = await sql.getTableByName('Country');
    if(countries.isNotEmpty){
      for(int i =0; i< countries.length;i++){
        country.add(countries[i]['name']);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
  double verPadding = 7, horPadding = 5, raduis = 14, verMargin = 8;
    return
      Form(
        key: accounrKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Scaffold(
          appBar: AppBar(
            title:  const Text('Update Account', style : TextStyle(fontWeight: FontWeight.bold,fontSize: 26)),
            leading: IconButton(onPressed: (){
              if(mounted){
                Navigator.of(context).pop();
              }
            }, icon: const Icon(Icons.arrow_back_ios_new_outlined)),
            actions: [
              IconButton(onPressed: ()async{
                  if(accounrKey.currentState!.validate()){
                    await sql.updateData_('''
                      UPDATE User
                      SET fname = "${fname.text}",lname = "${lname.text}",passwd = "${passwd.text}" ,countryName = "${countryName.text}" WHERE email = "${email.text}";
                    ''');
                  if(mounted){
                    Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context) => Home(
                      email: email.text,
                    ),));
                  }else{
                  }
                  }
              }, icon: const Icon(Icons.done_outline))
            ],
          ),
          body: ListView(
            children: <Widget>[
              SizedBox(height: verMargin,),
              ListTile(//*Email.
                title: TextFormField(
                  readOnly: true,
                  initialValue: email.text,
                  style:   const TextStyle(fontSize: 20,),
                  decoration:  InputDecoration(
                    label: const Text('Email'),
                    contentPadding: EdgeInsets.symmetric(horizontal: horPadding, vertical: verPadding),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(raduis),
                    ),
                    prefixIcon: const Icon(Icons.email_outlined),
                    suffix: const Icon(Icons.edit_off,size: 20)
                  ),
              ),
            ),
              SizedBox(height: verMargin,),
              ListTile(//* fname
                title: TextFormField(
                  controller: fname,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) => value == null || value.isEmpty ? 'Required field' : null,
                  style:   const TextStyle(fontSize: 20,),
                  decoration:  InputDecoration(
                    label: const Text('First name'),
                    contentPadding: EdgeInsets.symmetric(horizontal: horPadding, vertical: verPadding),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(raduis),
                    ),
                    prefixIcon: const Icon(Icons.person_outline),
                  ),
                ),
              ),
              SizedBox(height: verMargin,),
              ListTile(//* lname
                title: TextFormField(
                  controller: lname,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) => value == null || value.isEmpty ? 'Required field' : null,
                  style:   const TextStyle(fontSize: 20,),
                  decoration:  InputDecoration(
                    label: const Text('Last name'),
                    contentPadding: EdgeInsets.symmetric(horizontal: horPadding, vertical: verPadding),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(raduis),
                    ),
                    prefixIcon: const Icon(Icons.person_outline),
                  ),
                ),
              ),
              SizedBox(height: verMargin,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                child: DropdownSearch<String>(
                  
                  popupProps: const PopupProps.menu(
                    menuProps: MenuProps(
                      shape: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                      )
                    ),
                  showSelectedItems: true,
                  showSearchBox: true,
                  ),
                  items:  country,
                  dropdownDecoratorProps:  DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      label: const Text('Country'),
                      contentPadding: EdgeInsets.symmetric(vertical: verPadding, horizontal: horPadding),
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(raduis))
                      ),
                      prefixIcon: const Icon(Icons.flag_outlined)
                    ),
                  ),
                  validator: (value)  =>  value == null || value.isEmpty ? 'Required field' : null,
                  onChanged: (value)
                  { 
                    if(value != null){
                      countryName.text = value;
                    }
                  },
                  selectedItem: countryName.text,
                ),
              ),
              SizedBox(height: verMargin,),
              ListTile(
                title: TextFormField(
                  controller: passwd,
                  validator: (value) => value == null || value.isEmpty ? 'Required field' : null,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  style:   const TextStyle(fontSize: 20,),
                  decoration:  InputDecoration(
                    label: const Text('Password'),
                    contentPadding: EdgeInsets.symmetric(horizontal: horPadding, vertical: verPadding),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(raduis),
                    ),
                    prefixIcon: const Icon(Icons.password_outlined),
                  ),
                ),
              ),
          ],
        )
      ),
    ); 
  }
}