import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  //dbname
  static const databaseName= "notes.db";
  //dbversion
  static const databaseVersion= 1;

  //table name
  static const tableStudent = "student";

  //column name
  static const colId ='id';
  static const colName = 'name';
  static const colAge = 'age';
  static const colPhn = 'phnNumber';
  static const colEmail ='email';
  static const colLocation = 'location';
  static const colGender = 'gender';

  DatabaseHelper.privateConstractor();
  static final DatabaseHelper instance =DatabaseHelper.privateConstractor();

  static Database? myDb;

  Future<Database?> get database async{
    if(myDb!=null)
      return myDb;

    myDb = await initDatabase();
    return myDb;

  }

  initDatabase()async{
    String path =join(await getDatabasesPath(),databaseName);
    return openDatabase(path,version: databaseVersion,onCreate: createTables);
  }

  Future createTables(Database db,int version) async{
    await db.execute(
      """
      CREATE TABLES $tableStudent(
      $colId INTEGER PRIMARY KEY,
      $colName TEXT NOT NULL,
      $colAge INTEGER NOT NULL,
      $colPhn TEXT NOT NULL,
      $colEmail TEXT NOT NULL,
      $colLocation TEXT NOT NULL,
      $colGender TEXT NOT NULL
      )
      """
    );
  }

}