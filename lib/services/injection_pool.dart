import 'dart:async';

import 'package:flutter_simple_dependency_injection/injector.dart';
import '../domains/asset_repository/src/models.dart' as asset_models;
import '../domains/asset_type_repository/src/models.dart' as asset_type_model;
import '../domains/user_repository/src/models.dart' as user_model;

import 'database_handler.dart';

mixin InjectionPool {
  static final DatabaseHandler _dbHandler = DatabaseHandler();
  static final asset_models.Models _asModels = asset_models.Models();
  static final asset_type_model.Models _atModel = asset_type_model.Models();
  static final user_model.Models _uModel = user_model.Models();

  static Injector? injector;

  static Future<void> initInjection() async {
    await _dbHandler.initDb();

    injector = Injector();

    injector!
        .map<DatabaseHandler>((Injector i) => _dbHandler, isSingleton: true);

    injector!
        .map<asset_models.Models>((Injector i) => _asModels, isSingleton: true);
    injector!.map<asset_type_model.Models>(
      (Injector i) => _atModel,
      isSingleton: true,
    );
    injector!
        .map<user_model.Models>((Injector i) => _uModel, isSingleton: true);
  }
}
