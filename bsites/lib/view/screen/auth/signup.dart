import 'package:bsites/view/screen/Home.dart';
import 'package:bsites/data/datasource/sqlflite.dart';
import 'package:bsites/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {

  GlobalKey<FormState> signupKey = GlobalKey();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController passwd = TextEditingController();
  TextEditingController dialCode = TextEditingController();
  double radius = 14;
  late Map<String, Object?> infos = {
                    'fname' : fname.text,
                    'lname' : lname.text,
                    'birthday' : birthday.text,
                    'email' : email.text,
                    'passwd' : passwd.text,
                    'dial_code' : dialCode.text,
                  };
  SqlDb sql = SqlDb();
  List<String> countries = [];
  late FToast fToast;
  int indexCountry = -1;
  late List<Map> countries_;
  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    get_countries();
    super.initState();
  }
  get_countries() async{
    countries_ = await sql.getTableByName('Country');
    List<Map> user_ = await sql.getTableByName('User');
    print(user_);
    print(countries_);
    for (var element in countries_) {
      countries.add(element['name']);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: signupKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 220,
            child: Image.asset('assets/images/signup_img.png',fit: BoxFit.cover )
          ),
          Column(children: 
          [
            Container(
              margin:const EdgeInsets.symmetric(horizontal: 20),
              child:TextFormField(
                controller:fname,
                validator: (value) => value == null || value.isEmpty ? 'Required field!' : null,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  helperStyle: const TextStyle(color: Colors.red),
                  hintText: 'First name',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius)
                  )
                )
              )
            ),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.symmetric(horizontal:20),
              child: TextFormField(
                validator: (value) => value == null || value.isEmpty ? 'Required field' : null,
                controller: lname,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius)
                  ),
                  prefixIcon: const Icon(Icons.person),
                  hintText: 'Last name'
                )
              ),
            ),
            const SizedBox(height: 5),
            Container(//*birthday field.
              margin: const EdgeInsets.symmetric(horizontal:20),
              child:TextFormField(
                validator: (value) => value == null || value.isEmpty ? 'Required field' : null,
                controller: birthday,
                keyboardType: TextInputType.datetime,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius)
                  ),
                  prefixIcon: const Icon(Icons.date_range_outlined),
                  hintText: 'BirthDay: DD/MM/YYYY'
                ),
              )
            ),
            const SizedBox(height: 8),
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
                items:  countries,
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
                  indexCountry = countries.indexWhere((element) => element == value!);
                  dialCode.text = countries_[indexCountry]['dial_code'];
                },
                selectedItem: null,
            ),
            ),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                validator: (value) => value == null || value.isEmpty ? 'Required field' : null,
                controller: email,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius)
                  ),
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined)
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                validator: (value) => value == null || value.isEmpty ? 'Required field' : null,
                controller: passwd,
                keyboardType: TextInputType.visiblePassword,
                obscureText:true,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock_open)
                )
              ),
            ),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.only(left:25),
              child: Row(children: [
                const Text('Already have an account. '),
                const SizedBox(width: 5,),
                InkWell(
                  child: const Text('Click here!', style: TextStyle(color: Colors.blue),),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const Login())));
                  },
                )
              ]),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const SizedBox(
                width: 280,
                child: Text('Sign up.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,)),
              onPressed: () async{
                if (signupKey.currentState!.validate() ) {
                   List<Map> list = await sql.getdata('SELECT * FROM User WHERE email = "${email.text}"');
                      if(list.isEmpty ){
                        int helper = await sql.insertData('User', infos);
                        if(helper > 0){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) =>  Home(
                            email_: email.text,
                          ))));
                          greenToast();
                        }
                      }else{
                        redToast();
                      }
                }
              },
              )
          ],)
        ],
      )
      )
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
          Text('Done', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ,color: Colors.white),)
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
          Text('Email already exist', style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20 ,color: Colors.white),)
        ],)
      )
    );
    }
} 