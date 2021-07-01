import 'package:lsv_ams/domains/asset_type_repository/src/asset_type_model.dart';
import 'package:lsv_ams/services/database_handler.dart';
import 'package:lsv_ams/services/injection_pool.dart';

class Models {
  static DatabaseHandler? _dbHandler =
      InjectionPool.injector!.get<DatabaseHandler>();

  Future<void> insertType(AssetTypeModel assetTypeModel) async {
    await _dbHandler!.db!.insert('asset_type', assetTypeModel.toJson());
  }

  Future<List<AssetType>> getAllAssetType() async {
    return (await _dbHandler!.db!.query('asset_type'))
        .map((e) => AssetType.fromJson(e))
        .toList();
  }

  Future<void> updateAssetType(AssetTypeModel assetTypeModel) async {
    await _dbHandler!.db!.update(
      'asset_type',
      assetTypeModel.toJson(),
      where: 'typeId = ?',
      whereArgs: [assetTypeModel.typeId],
    );
  }

  Future<void> deleteAssetType(int assetTypeId) async {
    await _dbHandler!.db!.delete(
      'asset_type',
      where: 'assetTypeId = ?',
      whereArgs: [assetTypeId],
    );
  }

  Future<AssetType> getUser(int assetTypeId) async {
    final maps = await _dbHandler!.db!.query(
      'asset_type',
      where: 'assetTypeId = ?',
      whereArgs: [assetTypeId],
    );

    if (maps.isNotEmpty) {
      return AssetType.fromJson(maps.first);
    } else {
      throw Exception('ID $assetTypeId not found');
    }
  }
}
