import 'package:bsites/view/screen/auth/login.dart';
import 'package:flutter/material.dart';

//* pages
import 'package:bsites/view/screen/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bsites',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        colorScheme:ColorScheme.fromSwatch(primarySwatch: Colors.blue,).copyWith(secondary:Colors.amber),

    // Define the default font family.
    fontFamily: 'Cairo',
        iconTheme: const IconThemeData(
          size: 30,
        ),
        textTheme: const TextTheme(
          
          headline1: TextStyle(
            fontSize: 18,
          ),
          headline2: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          )
        ),
        

      ),
      routes:{
        'get_home':(context) => Home(),
        'get_Login':(context) => const Login(),

      },
      home:  Login(),
    );
  }
}
