import 'package:lsv_ams/domains/user_asset_repository/src/user_asset_model.dart';
import 'package:lsv_ams/services/database_handler.dart';
import 'package:lsv_ams/services/injection_pool.dart';

class UserAssetModels {
  static const String _kTableName = 'user_asset';
  static late final DatabaseHandler _dbHandler =
      InjectionPool.injector!.get<DatabaseHandler>();

  Future<int> insert(UserAsset data) async => _dbHandler.db!.insert(
        _kTableName,
        data.toJson(),
      );

  Future<List<UserAsset>> fetchAll() async =>
      (await _dbHandler.db!.query(_kTableName))
          .map((Map<String, Object?> e) => UserAsset.fromJson(e))
          .toList();

  Future<int> update(UserAsset data) async => _dbHandler.db!.update(
        _kTableName,
        data.toJson(),
        where: 'assetTag = ?',
        whereArgs: <String>[data.assetTag],
      );

  Future<int> delete(String tag) async => _dbHandler.db!.delete(
        _kTableName,
        where: 'assetTag = ?',
        whereArgs: <String>[tag],
      );

  Future<UserAsset> get(String tag) async {
    final List<Map<String, Object?>> maps = await _dbHandler.db!.query(
      _kTableName,
      where: 'assetTag = ?',
      whereArgs: <String>[tag],
    );
    return maps.isNotEmpty
        ? UserAsset.fromJson(maps.first)
        : throw Exception('$tag not found');
  }
}
