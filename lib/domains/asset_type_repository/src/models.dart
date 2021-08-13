import '../../../services/database_handler.dart';
import '../../../services/injection_pool.dart';
import 'asset_type_model.dart';

class AssetTypeModels {
  static const String _kTableName = 'asset_type';

  static late final DatabaseHandler _dbHandler =
      InjectionPool.injector!.get<DatabaseHandler>();

  Future<void> insertType(AssetTypeModel assetTypeModel) async {
    await _dbHandler.db!.rawInsert(
      'INSERT INTO $_kTableName(typeName, color) VALUES(?,?)',
      <String>[assetTypeModel.typeName, assetTypeModel.color],
    );
  }

  Future<List<AssetType>> getAllAssetType() async {
    return (await _dbHandler.db!.query(_kTableName))
        .map((Map<String, Object?> e) => AssetType.fromJson(e))
        .toList();
  }

  Future<void> updateAssetType(AssetTypeModel assetTypeModel) async {
    await _dbHandler.db!.update(
      _kTableName,
      assetTypeModel.toJson(),
      where: 'typeName = ?',
      whereArgs: <String>[assetTypeModel.typeName],
    );
  }

  Future<void> deleteAssetType(int assetTypeId) async {
    await _dbHandler.db!.delete(
      _kTableName,
      where: 'assetTypeId = ?',
      whereArgs: <int>[assetTypeId],
    );
  }

  Future<AssetType> get(String name) async {
    final List<Map<String, Object?>> maps = await _dbHandler.db!.query(
      _kTableName,
      where: 'typeName = ?',
      whereArgs: <String>[name],
    );

    if (maps.isNotEmpty) {
      return AssetType.fromJson(maps.first);
    } else {
      throw Exception('Name $name not found');
    }
  }
}
