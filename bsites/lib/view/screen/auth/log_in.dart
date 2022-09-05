import 'package:bsites/data/datasource/sq_lite.dart';
import 'package:bsites/view/screen/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:bsites/view/screen/home_.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Login extends StatefulWidget  {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login>  {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController passwd = TextEditingController();
  SqlDb sql = SqlDb();
  FToast fToast =  FToast();
  @override
  void initState() {
      super.initState();
      fToast = FToast();
      fToast.init(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: loginKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: ListView(
                children: 
                <Widget>[
                  SizedBox(
                    height: 300,
                  child: Center(child: Image.asset('assets/images/login_img.png'))
                  ),
                  const SizedBox(height: 30),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                    child: TextFormField
                    (
                      controller: email,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value == null || value =='' ? 'Required field!': null,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction:TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        hintText: 'Email.',
                        label: const Text('Email'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                    child: TextFormField(
                      controller: passwd,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value == null || value =='' ? 'Required field!': null,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_open_outlined),
                        hintText: 'Password.',
                        label: const Text('Password'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 20),
                    child: Row(
                      children : <Widget>[
                        const Text("If you haven't yet an account. "),
                        InkWell(  
                          child: const Text('Click here!',style: TextStyle(color: Colors.blue),),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUp(),));
                          },
                        )
                      ], 
                    ),
                  ),
                  //Button___________________
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                      child: ElevatedButton(
                        onPressed: () async{     
                          if(loginKey.currentState!.validate())
                          {
                            List<Map> list = await sql.getdata('SELECT * FROM User WHERE email = "${email.text}"');
                            if(list.isNotEmpty ){
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).push(MaterialPageRoute(builder: ((context) =>  Home(
                            email: email.text,
                              ))));
                              greenToast('Done');
                            }else{
                              redToast('Email not exists');
                            }
                          }                 
                        }, 
                        style: ElevatedButton.styleFrom
                        (
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder
                          (
                            side: const BorderSide
                            (
                              color: Colors.blue,
                              width: 2
                            ),
                            borderRadius: BorderRadius.circular(13)
                          )
                        ),
                        child: const Text('Log in',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                  )
              ],
            ),
      ),
    );
    
  }
    void greenToast(String? str){
    fToast.showToast(
      fadeDuration: 100,
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.greenAccent
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  <Widget>[
          const Icon(Icons.done, color: Colors.white,),
          Text('$str', style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15 ,color: Colors.white),)
        ],)
      )
    );
    }  
    void redToast(String? str){
    fToast.showToast(
      fadeDuration: 50,
      gravity: ToastGravity.BOTTOM,
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.orangeAccent
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  <Widget>[
          const Icon(Icons.error_outline_outlined, color: Colors.white,),
          Text('$str', style: const TextStyle( fontWeight: FontWeight.bold,fontSize: 15 ,color: Colors.white),)
        ],)
      )
    );
    }
    void orangeToast(String? str){
    fToast.showToast(
      gravity: ToastGravity.BOTTOM,
      fadeDuration: 50,
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.orangeAccent
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  <Widget>[
          const Icon(Icons.remove_done_outlined, color: Colors.white,),
          Text('$str', style: const TextStyle( fontWeight: FontWeight.bold,fontSize: 15 ,color: Colors.white),)
        ],)
      )
    );
    }
} 