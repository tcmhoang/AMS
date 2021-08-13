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

    final String path = p.join(documentsDirectory.path, kAppDir, 'lsv.db');
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
      CREATE TABLE user(userId INTEGER PRIMARY KEY , fullName TEXT, dob INTEGER, gender INTEGER, address TEXT, urlImage TEXT);
  
      CREATE TABLE asset_type(typeName Text PRIMARY KEY, color TEXT);
  
      CREATE TABLE asset(
      tag TEXT PRIMARY KEY, 
      name TEXT,
      make TEXT, 
      created INTEGER, 
      lastUpdated INTEGER, 
      condition TEXT, 
      urlImage TEXT, 
      originalPrice BIGDECIMAL, 
      isAssigned INTEGER, 
      typeName TEXT REFERENCES asset_type(typeName)
    ); 

     CREATE TABLE user_asset(
     userId INTEGER REFERENCES user(id),
     assetTag TEXT REFERENCES asset(tag),
     PRIMARY KEY (assetTag)
    );
 
     CREATE TABLE record(
     id INTEGER PRIMARY KEY AUTOINCREMENT,
     userId INTEGER REFERENCES user(id),
     assetTag TEXT REFERENCES asset(tag),
     strPeriod INTEGER,
     endPeriod INTEGER
     );
 
    ''',
      );
}
