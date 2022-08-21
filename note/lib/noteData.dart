import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {

  static Database? _db ; 
  
  Future<Database?> get db async {
      if (_db == null){
        _db  = await intialDb() ;
        return _db ;  
      }else {
        return _db ; 
      }
  }


intialDb() async {
  String databasepath = await getDatabasesPath() ; 
  String path = join(databasepath , 'note.db') ;   
  Database mydb = await openDatabase(path , onCreate: _onCreate , version: 3  , onUpgrade:_onUpgrade ) ;  
  return mydb ; 
}

_onUpgrade(Database db , int oldversion , int newversion ) async{

 await db.execute("DROP TABLE notes");

 print("onUpgrade =====================================") ; 
   await db.execute('''
CREATE TABLE notes( id INTEGER  PRIMARY KEY  AUTOINCREMENT,title TEXT NOT NULL ,note TEXT NOT NULL)
 ''') ;
  
}

_onCreate(Database db , int version) async {
  await db.execute('''
CREATE TABLE notes( id INTEGER  PRIMARY KEY  AUTOINCREMENT,title TEXT NOT NULL ,note TEXT NOT NULL)
 ''') ;
 print(" onCreate =====================================") ; 

}
readData(table) async {
  Database? mydb = await db ; 
  List<Map> response = await  mydb!.query(table);
  return response ; 
}
//* Another method to get data
// readData(String sql) async {
//   Database? mydb = await db ; 
//   List<Map> response = await  mydb!.rawQuery(sql);
//   return response ; 
// }

insertData(String table,Map<String, Object?> values) async {
  Database? mydb = await db ; 
  int  response = await  mydb!.insert(table, values);
  return response ; 
}
//* Another method for insert
// insertData(String sql) async {
//   Database? mydb = await db ; 
//   int  response = await  mydb!.rawInsert(sql);
//   return response ; 
// }
updateData( table, Map<String, Object?> values,String  id) async {
  Database? mydb = await db ; 
  int  response = await  mydb!.update(table,values,where: id);
  return response ; 
}
deleteData(String table, String id) async {
  Database? mydb = await db ; 
  int  response = await  mydb!.delete(table, where: id);
  return response ; 
}
}