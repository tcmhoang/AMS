import 'dart:async';

import 'package:flutter_simple_dependency_injection/injector.dart';
import '../domains/asset_repository/src/models.dart';
import '../domains/asset_type_repository/src/models.dart';
import '../domains/user_repository/src/models.dart';

import 'database_handler.dart';

mixin InjectionPool {
  static final DatabaseHandler _dbHandler = DatabaseHandler();
  static final AssetModels _asModels = AssetModels();
  static final AssetTypeModels _atModel = AssetTypeModels();
  static final UserModels _uModel = UserModels();

  static Injector? injector;

  static Future<void> initInjection() async {
    await _dbHandler.initDb();

    injector = Injector();

    injector!
        .map<DatabaseHandler>((Injector i) => _dbHandler, isSingleton: true);

    injector!.map<AssetModels>((Injector i) => _asModels, isSingleton: true);
    injector!.map<AssetTypeModels>(
      (Injector i) => _atModel,
      isSingleton: true,
    );
    injector!.map<UserModels>((Injector i) => _uModel, isSingleton: true);
  }
}
