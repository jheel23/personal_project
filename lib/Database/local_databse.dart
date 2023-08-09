import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class LocalDatabaseHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath(); //Get the path to the database
    return sql.openDatabase(path.join(dbPath, 'places.db'), //Open the database
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_tasks(id TEXT PRIMARY KEY, title TEXT, description TEXT, priority TEXT, isCompleted BOOLEAN)');
    }, version: 1);
  }

  //Method TO INSERT DATA INTO THE DATABASE:
  static Future<void> insertData(
      String tableName, Map<String, dynamic> tableData) async {
    //Calling the function to open the database:
    final db = await LocalDatabaseHelper.database();
    //"INSERT" --> Command to insert data into the database:
    db.insert(tableName, tableData,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<void> deleteData(String tableName, String id) async {
    final db = await LocalDatabaseHelper.database();
    db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  //Method TO GET DATA FROM THE DATABASE:
  static Future<List<Map<String, dynamic>>> getData(String tablename) async {
    final db = await LocalDatabaseHelper.database();
    //"QUERY" --> Command to get data from the database:
    return db.query(tablename);
  }
}
