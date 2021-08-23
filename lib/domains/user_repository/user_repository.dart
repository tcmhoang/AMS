import 'package:flutter/cupertino.dart';

import '../../services/injection_pool.dart';
import 'src/models.dart';
import 'src/user_model.dart';

late UserModels users = InjectionPool.injector!.get<UserModels>();

final ValueNotifier<int> count = ValueNotifier<int>(0);

Future<bool> create(User user) async {
  try {
    await users.insertUser(user);
  } catch (_, __) {
    return false;
  }
  return true;
}

Future<bool> update(int id, User newData) async {
  try {
    if (newData.id != id && (await fetchAllIds()).contains(newData.id)) {
      throw Exception('Not the same data');
    }
    await users.getUser(id);
    await users.updateUser(newData, id);
  } catch (_, __) {
    return false;
  }
  return true;
}

Future<bool> delete(int id) async {
  try {
    await users.deleteUser(id);
    return true;
  } catch (_, __) {
    return false;
  }
}

Future<List<User>> fetchAll() async {
  try {
    final List<User> tmp = await users.getAllUser();
    count.value = tmp.length;
    return tmp;
  } catch (_, __) {
    return <User>[];
  }
}

Future<User?> get(int id) async {
  try {
    return users.getUser(id);
  } catch (_, __) {
    return null;
  }
}

Future<Set<int>> fetchAllIds() async {
  try {
    return users.fetchAllIds();
  } catch (_) {
    return <int>{};
  }
}
