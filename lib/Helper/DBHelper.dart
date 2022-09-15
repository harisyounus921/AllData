import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'GoogleInfo_Model.dart';

class DBHelper {

  static Database _db ;

  Future<Database> get db async {
    if(_db != null){return _db;};
    _db = await initDatabase();
  }

  initDatabase()async{
    io.Directory documentDirectory = await getApplicationDocumentsDirectory() ;
    String path = join(documentDirectory.path , 'googleInfo.db');
    return await openDatabase(path , version: 1 , onCreate: _onCreate,);
  }

  _onCreate (Database db , int version )async{
    await db
        .execute('CREATE TABLE googleInfo(email TEXT PRIMARY KEY,name TEXT, image TEXT )');
  }

  Future<googleInfo> insert(googleInfo info)async{
    var dbClient = await db ;
    await dbClient.insert('googleInfo', info.toMap());
    return info ;
  }

  Future<List<googleInfo>> getCartList()async{
    var dbClient = await db ;
    final List<Map<String , Object>> queryResult =  await dbClient.query('googleInfo');
    return queryResult.map((e) => googleInfo.fromMap(e)).toList();
  }

  Future<List<googleInfo>> getData () async {
    return  getCartList();
  }

  Future<int> delete(int id)async{
    var dbClient = await db ;
    return await dbClient.delete('googleInfo', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateQuantity(googleInfo info)async{
    var dbClient = await db ;
    return await dbClient.update('googleInfo', info.toMap(), where: 'id = ?', whereArgs: [info.email]);
  }
}