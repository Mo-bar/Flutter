import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  GlobalKey<ScaffoldState> sk = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: sk,
      appBar: AppBar(),
      drawerScrimColor: Colors.blue.withOpacity(0.7),
      drawer:Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(child: Icon(Icons.account_balance),backgroundColor: Colors.amber),
              accountName: Text('Mourad_br.'), 
              accountEmail: Text('Mouradbarkouch@gmail.com.')
            ),
            ListTile(
              title: Text('Home page.'),
              subtitle: const Text(''),
              leading: Icon(Icons.home),  
              onTap: () => print('home'),
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () => print('Settings'),
            ),
            ListTile(
              title: Text('Accessibilite'),
              leading: Icon(Icons.accessibility),
              onTap: () => print('Accessibity'),
            ),
            ListTile(
              title: Text('Contact'),
              leading: Icon(Icons.contact_page),
              onTap: () => print('Contact'),
            ),
          ],
        ),
      ),
      body: Center(child: ElevatedButton(
        child: Text('Open drawer.'),
        onPressed: (){
          // sk.currentState.openDrawer();
        },
      ),
      )
    );
  }
}