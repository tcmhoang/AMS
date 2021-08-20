import '../../../services/database_handler.dart';
import '../../../services/injection_pool.dart';
import 'user_model.dart';

class UserModels {
  static const String _kTableName = 'user';
  static late final DatabaseHandler _dbHandler =
      InjectionPool.injector!.get<DatabaseHandler>();

  Future<void> insertUser(UserModel userModel) async {
    await _dbHandler.db!.rawInsert(
      'INSERT INTO $_kTableName(id,fullName, dob, gender, address, urlImage) VALUES(?,?,?,?,?,?)',
      <Object>[
        userModel.id,
        userModel.fullName,
        userModel.dob,
        userModel.gender,
        userModel.address,
        userModel.urlImage
      ],
    );
  }

  Future<List<User>> getAllUser() async {
    return (await _dbHandler.db!.query(_kTableName))
        .map((Map<String, Object?> e) => User.fromJson(e))
        .toList();
  }

  Future<void> updateUser(UserModel userModel) async {
    await _dbHandler.db!.update(
      _kTableName,
      userModel.toJson(),
      where: 'id = ?',
      whereArgs: <int>[userModel.id],
    );
  }

  Future<void> deleteUser(int userId) async {
    await _dbHandler.db!.delete(
      _kTableName,
      where: 'id = ?',
      whereArgs: <int>[userId],
    );
  }

  Future<User> getUser(int userId) async {
    final List<Map<String, Object?>> maps = await _dbHandler.db!.query(
      _kTableName,
      where: 'id= ?',
      whereArgs: <int>[userId],
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      throw Exception('ID $userId not found');
    }
  }

  Future<Set<int>> fetchAllIds() async => (await _dbHandler.db!
          .query(_kTableName, distinct: true, columns: <String>['id']))
      .map((Map<String, Object?> e) => e.values as int)
      .toSet();
}
