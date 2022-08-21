import 'package:flutter/material.dart';
import 'Auth/Homepage.dart';
import 'Auth/Login.dart';
import 'Auth/SignUp.dart';
import 'CRUD/AddNotes.dart';
import 'CRUD/edit.dart';
void main() async {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
    Map<String, WidgetBuilder> routePages = {
    'get_HomePage':(context)=> const Notes(),
    'get_SignUp':(context) => const SignUp(),
    'get_AddNotes':(context) => const AddNotes(),
    'get_Login':(context) => const Login(),
    'get_EditNotes':(context) => const EditNotes(),
  };
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routePages,
      home: const Login(),
    );
  }
}



