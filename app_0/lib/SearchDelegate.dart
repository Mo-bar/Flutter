import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchDelegate'),
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: Data_search());
          }, icon: Icon(Icons.search))
        ],
      ),
      drawer: Drawer(),
    );
  }
}

class Data_search extends SearchDelegate{
    List<String> names = [
    'khaled',
    'Mouad',
    'Meryem',
    'Simo',
    'Anas'
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
    IconButton(icon: Icon(Icons.close),onPressed: (){
      query ='';
    },)
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) => IconButton(onPressed: (){
    close(context,null);
  }, icon: Icon(Icons.arrow_back_ios));

  @override
  Widget buildResults(BuildContext context) {
    return Text('res');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List name_filter = names.where((item) => item.startsWith(query)).toList(); // .contains
    return ListView.builder(
      itemCount: query == '' ? names.length : name_filter.length,
      itemBuilder: (context,i){
        return InkWell(
          onTap: () {
            query = query =='' ? names[i] : name_filter[i];
            showResults(context);
          },
          child: ListTile(
            title: query == '' ? Text(names[i]) : Text(name_filter[i]),
          ),
        );
      },
    );
  }

}