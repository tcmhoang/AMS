import '../../../services/database_handler.dart';
import '../../../services/injection_pool.dart';
import 'asset_model.dart';

class AssetModels {
  static const String _kTableName = 'asset';

  static late final DatabaseHandler _dbHandler =
      InjectionPool.injector!.get<DatabaseHandler>();

  // insert data to Assets Table
  Future<void> insertAsset(AssetModel assetModel) async =>
      _dbHandler.db!.insert(_kTableName, assetModel.toJson());

  // get all data from Assets Table
  Future<List<Asset>> getAllAsset() async =>
      (await _dbHandler.db!.query(_kTableName))
          .map((Map<String, Object?> e) => Asset.fromJson(e))
          .toList();

  // update data to Assets Table
  Future<void> updateAsset(AssetModel assetModel) async =>
      _dbHandler.db!.update(
        _kTableName,
        assetModel.toJson(),
        where: 'tag = ?',
        whereArgs: <String>[assetModel.tag],
      );

  // delete data from Assets Table
  Future<void> deleteAsset(String tag) async {
    await _dbHandler.db!.delete(
      _kTableName,
      where: 'tag = ?',
      whereArgs: <String>[tag],
    );
  }

  Future<Asset> getAsset(String tag) async {
    final List<Map<String, Object?>> maps = await _dbHandler.db!.query(
      _kTableName,
      where: 'tag = ?',
      whereArgs: <String>[tag],
    );

    if (maps.isNotEmpty) {
      return Asset.fromJson(maps.first);
    } else {
      throw Exception('ID $tag not found');
    }
  }

  Future<List<Asset>> findByTypeName(String type) async {
    final List<Map<String, Object?>> maps = await _dbHandler.db!.query(
      _kTableName,
      where: 'typeName = ?',
      whereArgs: <String>[type],
    );

    if (maps.isNotEmpty) {
      return maps.map((Map<String, Object?> e) => Asset.fromJson(e)).toList();
    } else {
      throw Exception('$type not found');
    }
  }

  Future<List<Asset>> findByUserId(int userId) async {
    final List<Map<String, Object?>> maps = await _dbHandler.db!.query(
      _kTableName,
      where: 'userId = ?',
      whereArgs: <int>[userId],
    );

    if (maps.isNotEmpty) {
      return maps.map((Map<String, Object?> e) => Asset.fromJson(e)).toList();
    } else {
      throw Exception('$userId User not found');
    }
  }

  Future<List<Asset>> findByName(String name) async {
    final List<Map<String, Object?>> maps = await _dbHandler.db!.rawQuery(
      "SELECT * FROM $_kTableName WHERE name LIKE '%$name%'",
    );

    if (maps.isNotEmpty) {
      return maps.map((Map<String, Object?> e) => Asset.fromJson(e)).toList();
    } else {
      throw Exception('$name not found');
    }
  }
}
