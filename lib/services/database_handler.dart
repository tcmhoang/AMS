import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../config/constansts.dart';

class DatabaseHandler {
  static Database? _db;
  static const String kDbName = 'ams.db';

  Future<void> initDb() async {
    sqfliteFfiInit();
    final DatabaseFactory databaseFactory = databaseFactoryFfi;

    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory();

    final String path = p.join(documentsDirectory.path, kAppDir, 'lvs.db');
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

  Future<void> _createDB(Database db, int version) async => db.execute(
        '''
  CREATE TABLE users(userId INTEGER PRIMARY KEY AUTOINCREMENT, fullName TEXT, dob INTEGER, gender INTEGER, address TEXT, urlImage TEXT);
  CREATE TABLE asset_type(typeId INTEGER PRIMARY KEY AUTOINCREMENT, typeName Text UNIQUE, color TEXT);
  CREATE TABLE assets(
  tag TEXT PRIMARY KEY, 
  name TEXT,
  make TEXT, 
  created INTEGER, 
  lastUpdated INTEGER, 
  condition TEXT, 
  urlImage TEXT, 
  timesUsed INTEGER, 
  originalPrice REAL, 
  isAssigned INTEGER, 
  typeId INTEGER,
  userId INTEGER,
  FOREIGN KEY(typeId) REFERENCES asset_type(typeId),
  FOREIGN KEY(userId) REFERENCES users(userId)
);
    ''',
      );
}
