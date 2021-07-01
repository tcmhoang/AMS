import 'dart:async';

import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:lsv_ams/services/database_handler.dart';

class InjectionPool {
  static DatabaseHandler _dbHandler = DatabaseHandler();
  static Injector? injector;

  static Future initInjection() async {
    await _dbHandler.initDb();

    injector = Injector();

    injector!.map<DatabaseHandler>((i) => _dbHandler, isSingleton: true);
  }
}
