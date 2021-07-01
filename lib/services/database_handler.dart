import 'dart:io';

import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class DatabaseHandler {
  static Database? _db;
  static const kDbName = 'ams.db';

  initDb() async {
    sqfliteFfiInit();
    final databaseFactory = databaseFactoryFfi;

    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = p.join(documentsDirectory.path, "database_name.db");
    print(path);
    _db = await databaseFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: _createDB,
      ),
    );
  }

  Database? get db {
    return _db;
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE users(userId INTEGER PRIMARY KEY AUTOINCREMENT, fullName TEXT, dob INTEGER, gender INTEGER, address TEXT, urlImage TEXT);
    CREATE TABLE assets(tag TEXT PRIMARY KEY, name TEXT, type TEXT, make TEXT, serial TEXT, created INTEGER, lastUpdated INTEGER, condition TEXT, manageBy TEXT, urlImage TEXT, timesUsed INTEGER, originalPrice REAL, isAssigned INTEGER, typeId INTEGER, FOREIGN KEY (typeId) REFERENCES asset_type(typeId));
    CREATE TABLE deleted(deletedDate InTEGER, tagDelete TEXt, FOREIGN KEY (tagDelete) REFERENCES assets(tag));
    CREATE TABLE asset_type(typeId INTEGer PRIMARY KEY AUTOINCREMENT, typeName Text, color TEXT);
    ''');
  }
}
