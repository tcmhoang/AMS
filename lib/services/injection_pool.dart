import 'dart:async';

import 'package:flutter_simple_dependency_injection/injector.dart';

import 'database_handler.dart';

mixin InjectionPool {
  static final DatabaseHandler _dbHandler = DatabaseHandler();
  static Injector? injector;

  static Future<void> initInjection() async {
    await _dbHandler.initDb();

    injector = Injector();

    injector!
        .map<DatabaseHandler>((Injector i) => _dbHandler, isSingleton: true);
  }
}
