import 'package:lsv_ams/domains/user_repository/src/user_model.dart';
import 'package:lsv_ams/services/database_handler.dart';
import 'package:lsv_ams/services/injection_pool.dart';

class Models {
  static DatabaseHandler? _dbHandler =
      InjectionPool.injector!.get<DatabaseHandler>();

  Future<void> insertUser(UserModel userModel) async {
    await _dbHandler!.db!.insert('users', userModel.toJson());
  }

  Future<List<User>> getAllUser() async {
    return (await _dbHandler!.db!.query('users'))
        .map((e) => User.fromJson(e))
        .toList();
  }

  Future<void> updateUser(UserModel userModel) async {
    await _dbHandler!.db!.update(
      'users',
      userModel.toJson(),
      where: 'userId = ?',
      whereArgs: [userModel.userId],
    );
  }

  Future<void> deleteUser(int userId) async {
    await _dbHandler!.db!.delete(
      'users',
      where: 'userId = ?',
      whereArgs: [userId],
    );
  }

  Future<User> getUser(int userId) async {
    final maps = await _dbHandler!.db!.query(
      'users',
      where: 'userId = ?',
      whereArgs: [userId],
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      throw Exception('ID $userId not found');
    }
  }
}
