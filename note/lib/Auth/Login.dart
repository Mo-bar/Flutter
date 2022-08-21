import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
              children: 
              [
                Container(
                  height: 200,
                child: Center(child: Image.asset('images/1.png'))
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                  child: TextFormField
                  (
                    keyboardType: TextInputType.emailAddress,
                    textInputAction:TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_outlined),
                      hintText: 'Email.',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                  child: TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_open_outlined),
                      hintText: 'Password.',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 20),
                  child: Row(
                    children : [
                      const Text("If you haven't an account. "),
                      InkWell(  
                        child: const Text('Click here!',style: TextStyle(color: Colors.blue),),
                        onTap: (){
                          Navigator.of(context).pushNamed('get_SignUp');
                        },
                      )
                    ], 
                  ),
                ),
                //Button___________________
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    ElevatedButton(onPressed: (){                      
                      Navigator.of(context).pushNamed('get_HomePage');}, 
                      child: const Text('Log in',style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.blue,
                            width: 2
                          ),
                          borderRadius: BorderRadius.circular(13)
                        )
                      ),

                    ),

                  ElevatedButton(onPressed: (){}, 
                    child: const Text('Cancel',style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      animationDuration: const Duration(seconds: 2),
                      enabledMouseCursor: MouseCursor.defer,
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.blue,
                          width: 2
                        ),
                        borderRadius: BorderRadius.circular(13)
                      )
                    ),
                  )
              ],),
                )
            ],
          ),
    );
  }
} 