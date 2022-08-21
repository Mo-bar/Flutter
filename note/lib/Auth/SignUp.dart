import 'package:flutter/material.dart';
 import 'package:dropdown_search/dropdown_search.dart';
 import 'package:sqflite/sqflite.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  double radius = 14;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 140,
            child: Image.asset('images/1.png'),
          ),
          Container(
            child: Column(children: 
            [
              Container(
                margin:const EdgeInsets.symmetric(horizontal: 20),
                child:TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
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
              SizedBox(height: 5),
              Container(
                margin: EdgeInsets.symmetric(horizontal:20),
                child:TextFormField(
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius)
                    ),
                    prefixIcon: Icon(Icons.date_range_outlined),
                    hintText: 'BirthDay: DD/MM/YYYY'
                  ),
                )
              ),
              SizedBox(height: 8),
              Container(
                margin: EdgeInsets.symmetric(horizontal:20),
                child: DropdownSearch<String>(
                  popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  showSearchBox: true,
                  disabledItemFn: (String s) => s.startsWith('I'),
                  ),
                  items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      prefixIcon: Icon(Icons.flag_outlined),
                      hintText: 'Country in menu mode',
                      labelText: 'Menu mode',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14))
                    ),
                    
                  ),
                  onChanged: print,
                  selectedItem: null,
                  
              ),
              ),
              SizedBox(height: 5),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius)
                    ),
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined)
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText:true,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock_open)
                  )
                ),
              ),
              SizedBox(height: 5),
              Container(
                margin: EdgeInsets.only(left:25),
                child: Row(children: [
                  Container(child: Text('Already have an account'),),
                  SizedBox(width: 5,),
                  InkWell(
                    child: Text('Click here!', style: TextStyle(color: Colors.blue),),
                    onTap: (){
                      Navigator.of(context).pushNamed('get_Login');
                    },
                  )
                ]),
              ),
              SizedBox(height: 5),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Container(
                    child:  ElevatedButton(child: 
                    Icon(Icons.done_outline_rounded),
                    onPressed: (){
                      Navigator.of(context).pushNamed('get_HomePage');
                    },
                    )
                  ),
                  Container(child: 
                    ElevatedButton(
                      child: Icon(Icons.cancel_outlined),
                      onPressed: (){},
                    )
                  )
                ]),
              )

            ],))
        ],
      )
    );
  }
} 