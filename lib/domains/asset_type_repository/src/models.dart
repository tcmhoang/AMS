import '../../../services/database_handler.dart';
import '../../../services/injection_pool.dart';
import 'asset_type_model.dart';

class Models {
  static late final DatabaseHandler _dbHandler =
      InjectionPool.injector!.get<DatabaseHandler>();

  Future<void> insertType(AssetTypeModel assetTypeModel) async {
    await _dbHandler.db!.insert('asset_type', assetTypeModel.toJson());
  }

  Future<List<AssetType>> getAllAssetType() async {
    return (await _dbHandler.db!.query('asset_type'))
        .map((Map<String, Object?> e) => AssetType.fromJson(e))
        .toList();
  }

  Future<void> updateAssetType(AssetTypeModel assetTypeModel) async {
    await _dbHandler.db!.update(
      'asset_type',
      assetTypeModel.toJson(),
      where: 'typeId = ?',
      whereArgs: <int>[assetTypeModel.typeId],
    );
  }

  Future<void> deleteAssetType(int assetTypeId) async {
    await _dbHandler.db!.delete(
      'asset_type',
      where: 'assetTypeId = ?',
      whereArgs: <int>[assetTypeId],
    );
  }

  Future<AssetType> getUser(int assetTypeId) async {
    final List<Map<String, Object?>> maps = await _dbHandler.db!.query(
      'asset_type',
      where: 'assetTypeId = ?',
      whereArgs: <int>[assetTypeId],
    );

    if (maps.isNotEmpty) {
      return AssetType.fromJson(maps.first);
    } else {
      throw Exception('ID $assetTypeId not found');
    }
  }
}
