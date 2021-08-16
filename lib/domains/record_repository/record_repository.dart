import 'package:lsv_ams/domains/record_repository/src/models.dart';
import 'package:lsv_ams/services/injection_pool.dart';

import 'src/record_model.dart';

late RecordModels rs = InjectionPool.injector!.get<RecordModels>();

Future<bool> create(Record data) async {
  try {
    return (await rs.insert(data)) > 0;
  } catch (_, __) {
    return false;
  }
}

Future<bool> update(Record data) async {
  try {
    return (await rs.update(data)) > 0;
  } catch (_, __) {
    return false;
  }
}

Future<List<Record>> fetchAll() async {
  try {
    return await rs.fetchAll();
  } catch (_, __) {
    return <Record>[];
  }
}

Future<Record?> get(int id) async {
  try {
    return rs.get(id);
  } catch (_, __) {
    return null;
  }
}

Future<bool> delete(int id) async {
  try {
    return (await rs.delete(id)) > 0;
  } catch (_, __) {
    return false;
  }
}
