import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  TextEditingController Lname = TextEditingController();
  int radiusValue = 0;
  String PW='';

  @override
  Widget build(BuildContext context) {
    
  GlobalKey<FormState> PS_val = new  GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: ListView(children: [
        Container(
          margin : EdgeInsets.all(5),
          child: TextFormField(
            textInputAction:TextInputAction.next,
            readOnly: true,
            initialValue: 'IA11111',
            decoration: InputDecoration(
              // prefixText: "Nom: ",
              // prefix: Text('Nom: ', style: TextStyle(fontWeight: FontWeight.bold)),
              prefixText: 'Matricule: ',
              hintText: '...',
              prefixIcon: Icon(Icons.person),
              suffixIcon: Icon(Icons.info_outline_rounded),
              filled: true,
              fillColor: Colors.green[50],
              contentPadding: EdgeInsets.all(15),
            ),
          ),
        ),
        //TextFormField_2_______________
        Container(
          margin : EdgeInsets.all(5),
          child: TextFormField(
            controller: Lname,
            textInputAction:TextInputAction.next,
            decoration: const InputDecoration(
              prefix:  Text('Prenom', style: TextStyle(fontWeight: FontWeight.bold),),
              hintText: ' .......',
              // enabledBorder: UnderlineInputBorder(
                enabledBorder:OutlineInputBorder(
                  
                  borderSide: BorderSide(
                    color: Colors.black45,
                    width:3,
                  ),
              ),
              
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueAccent,
                ),
              )
              
            ),
          ),
        ),
        //TextFormField_3__________________
        Container(
          margin : EdgeInsets.all(5),
          child:TextFormField(
            // controller: phone,
            textInputAction: TextInputAction.next,
            maxLength: 10,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 52, 52, 52)
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide(
                  color: Colors.blue.shade300,
                  width:3,
                )
              )
            ),
          )
        ),
        //TextFormField_4__________________
        Container(
          padding:EdgeInsets.all(13),
          child: TextFormField(
            // controller: email,
            textInputAction:TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon((Icons.email_outlined)),
              // border:InputBorder.none,
              // border: UnderlineInputBorder(),
              border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(13)
              )
            ),
          ),
        ),
        Container(
          padding:EdgeInsets.all(13),
          child: TextFormField(
            textInputAction:TextInputAction.next,
            maxLength: 100,
            maxLines:2,
            minLines: 1, // defaulf value
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Decsription',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13)
              )
            ),
          ),
        ),
        Container(
          child: TextFormField(
            textInputAction: TextInputAction.done,
            maxLines:1,
            obscureText: true, //hidden Text
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              
            ),
            onChanged: (text) => print(text),
            onEditingComplete: () => print('done'),
          ),
        ),
        Container(
          child: ElevatedButton(
            child: Text('Sign up'),
            onPressed: (){
              print('UserName : '+Lname.text);
              
            },
          ),
        ),
        Form(
            key: PS_val,
            
            child: Column(
              children: [
                TextFormField(
                  onSaved: (text){
                    PW = text.toString();
                  },
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    if(value == ''){
                      return 'not valide';
                    }
                    return 'valide';
                    }
                ),
                ElevatedButton(onPressed: (){
                  if(PS_val.currentState!.validate()){
                    PS_val.currentState!
                    .save();
                  }else{
                    print('Not valide!');
                  }
                }, 
                child: Text('Valider') )
              ],
            ),
        ),
      ],)
    );
  }
}