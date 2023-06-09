import 'dart:io';

import 'package:my_to_do_list_flutter_project/models/to_do_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper{

  String tableName = "to_do_list_table";
  String id = "id";
  String title = "title";
  String description = "description";
  String status = "status";
  String date = "date";

  factory DataBaseHelper(){

    return _dataBaseHelper;
  }

  static final DataBaseHelper _dataBaseHelper = DataBaseHelper._createInstance();  // signton object

  DataBaseHelper._createInstance();

  // factory DataBaseHelper(){

  //   if(_dataBaseHelper == null){
  //     _dataBaseHelper = DataBaseHelper._createInstance();
  //   }
  //   return _dataBaseHelper;
  // }

  //Database _database; // singleton

  Database _database;

  get database async{
    return _database;
  }

  // Database _database;

  Future<Database> initalizeDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "my_todo_list_database.db";
    return await openDatabase(path,version: 1,onCreate: _create);
  }

  _create(Database database,int version) async{
    return await database.execute("CREATE TABLE $tableName ($id INTEGER PRIMARY KEY AUTOINCREMENT , $title TEXT, $description TEXT, $status TEXT, $date TEXT )");
  }

}