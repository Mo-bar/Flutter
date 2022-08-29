import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            child: Row(
              children: [
                Expanded(
                  flex:1,
                  child: Image.asset('assets/images/login_img.png'),
                  ),
                Expanded(
                  flex:3,
                  child: ListTile(
                    title: const Text('Title'),
                    subtitle: const Text('subtitle'),
                    trailing: const Text('199\$'),
                    onTap: (){
                    },
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}