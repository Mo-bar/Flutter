import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../data/datasource/sqlflite.dart';

class Account extends StatefulWidget {
  final email;
  const Account({Key? key,this.email}) : super(key: key);
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  GlobalKey<FormState> accounrKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController newFname = TextEditingController();
  TextEditingController newLname = TextEditingController();
  TextEditingController newCountry = TextEditingController();
  TextEditingController newDialcode = TextEditingController();
  TextEditingController newPasswd = TextEditingController();
  SqlDb sql = SqlDb();
  late FToast fToast;
  List<Map> countries = [];
  List<Map> user = [];
  List<String> country = [];
  int indexCountry = -1, oldIndex = -1 ;
  String fname ='' ,lname ='',passwd ='', dialCode = '';
  @override
  void initState() {
    email.text = widget.email;
    fToast = FToast();
    fToast.init(context);
    getdata();
    super.initState();
  }
  getdata() async{
    countries = await sql.getTableByName('Country');
    user = await sql.getdata('SELECT * FROM "User" WHERE "email" = "${email.text}"');
    print(user);
    if(user.isNotEmpty){
      for(int i =0; i< countries.length;i++){
        country.add(countries[i]['name']);
      }
      dialCode = user[0]['dial_code'];
      countries.forEach((element) { 
        oldIndex = countries.indexWhere((element) => element['dial_code'] == dialCode); 
       });
       print(oldIndex);
    }
    if(user.isNotEmpty){
      fname = user[0]['fname'];
      lname = user[0]['lname'];
      passwd = user[0]['passwd'];
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: accounrKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Scaffold(
        appBar: AppBar(
          title:  const Text('Account infos', style : TextStyle(fontWeight: FontWeight.bold,fontSize: 26)),
        ),
        body: Column(
          children: <Widget>[
              ListTile(//*Email.
              title: TextFormField(
                readOnly: true,
                // initialValue: '${email.text}',
                style:   const TextStyle(fontSize: 20,),
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
              ),
            ),
            ListTile(//* fname
              title: TextFormField(
                // controller: newFname,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                // validator: (value) => value == null || value.isEmpty ? 'Required field' : null,
                // initialValue: '$fname',
                style:   const TextStyle(fontSize: 20,),
                decoration: const InputDecoration(
                  label: Text('First name'),
                ),
              ),
            ),
            Container(//*Country field.
              margin: const EdgeInsets.symmetric(horizontal:20),
              child: DropdownSearch<String>(
                popupProps: const PopupProps.menu(
                  menuProps: MenuProps(
                    shape: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                    )
                  ),
                showSelectedItems: true,
                showSearchBox: true,
                // disabledItemFn: (String s) => s.startsWith('I'),
                ),
                items:  country,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    prefixIcon: const Icon(Icons.flag_outlined),
                    labelText: 'Country',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14))
                  ),
                ),
                validator: (value)  =>  value == null || value.isEmpty ? 'Required field' : null,
                onChanged: (value)
                { 
                  indexCountry = country.indexWhere((element) => element == value!);
                  newDialcode.text = countries[indexCountry]['dial_code'];
                },
                // selectedItem: country[oldIndex],
            ),
            ),
            ListTile(
              title: TextFormField(
                controller: newPasswd,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                obscureText: true,
                // initialValue: '${passwd}',
                style:   const TextStyle(fontSize: 20,),
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: ()async
              {
                if(accounrKey.currentState!.validate()){
                  if(newPasswd != null && newPasswd != ''){
                    newPasswd.text = passwd;
                  }
                  int tester = sql.updateData(
                                                'User',
                                                {
                                                  'fname' : newFname.text,
                                                  'lname' : newLname.text,
                                                  'dial_code' :newDialcode.text,
                                                  'passwd' : newPasswd.text, 
                                                },
                                                '${email.text}'
                                                );
                if(tester > 0){
                  Navigator.of(context).canPop() ? Navigator.of(context).pop() : null;
                  greenToast();
                }else{
                  redToast();
                }
                }
              }, child: Text('Save changed'))
        ],)
      ),
    );
  }
    greenToast(){
    fToast.showToast(
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
          Icon(Icons.done, color: Colors.white,),
          Text('Saved', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ,color: Colors.white),)
        ],)
      )
    );
    }  
    redToast(){
    fToast.showToast(
      gravity: ToastGravity.BOTTOM,
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
          Icon(Icons.error_outline_outlined, color: Colors.white,),
          Text('Incorrect infos', style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20 ,color: Colors.white),)
        ],)
      )
    );
    }
}