import 'package:flutter/material.dart';

class drawer_ extends StatefulWidget {
  const drawer_({Key? key}) : super(key: key);

  @override
  State<drawer_> createState() => _drawer_State();
}

class _drawer_State extends State<drawer_> {
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
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(child: Icon(Icons.account_balance),backgroundColor: Colors.amber),
              accountName: Text('Mourad_br.'), 
              accountEmail: Text('Mouradbarkouch@gmail.com.')
            ),
            ListTile(
              title: Text('Home page.'),
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
            )
          ],
        ),
      ),
      body: Center(child: ElevatedButton(
        child: Text('Open drawer.'),
        onPressed: (){
          sk.currentState.openDrawer();
        },
      ),
      )
    );
  }
}