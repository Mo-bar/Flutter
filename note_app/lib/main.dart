import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// import 'package:dropdown_search/dropdown_search.dart';
import 'Auth/Homepage.dart';
import 'Auth/Login.dart';
import 'Auth/SignUp.dart';
import 'CRUD/addNotes.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
    Map<String, WidgetBuilder> routePages = {
    'get_HomePage':(context)=> Notes(),
    'get_SignUp':(context) => SignUp(),
    'get_AddNotes':(context) => addNote(),
    'get_Login':(context) => Login(),
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
      home: Login(),
    );
  }
}



