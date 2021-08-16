import 'dart:async';

import 'package:lsv_ams/domains/record_repository/src/record_model.dart';
import 'package:lsv_ams/services/database_handler.dart';
import 'package:lsv_ams/services/injection_pool.dart';

class RecordModels {
  static const String _kTableName = 'record';
  static late final DatabaseHandler _dbHandler =
      InjectionPool.injector!.get<DatabaseHandler>();

  Future<int> insert(Record data) async => _dbHandler.db!.insert(
        _kTableName,
        data.toJson(),
      );

  Future<List<Record>> fetchAll() async =>
      (await _dbHandler.db!.query(_kTableName))
          .map((Map<String, Object?> e) => Record.fromJson(e))
          .toList();

  Future<int> update(Record data) async => _dbHandler.db!.update(
        _kTableName,
        data.toJson(),
        where: 'id = ?',
        whereArgs: <int>[data.id],
      );

  Future<int> delete(int id) async =>
      _dbHandler.db!.delete(_kTableName, where: 'id = ?', whereArgs: <int>[id]);

  Future<Record> get(int id) async {
    final List<Map<String, Object?>> maps = await _dbHandler.db!.query(
      _kTableName,
      where: 'id = ?',
      whereArgs: <int>[id],
    );
    return maps.isNotEmpty
        ? Record.fromJson(maps.first)
        : throw Exception('$id not found');
  }
}
