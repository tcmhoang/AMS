import 'package:lsv_ams/domains/user_asset_repository/src/models.dart';
import 'package:lsv_ams/domains/user_asset_repository/src/user_asset_model.dart';
import 'package:lsv_ams/services/injection_pool.dart';

late UserAssetModels uas = InjectionPool.injector!.get<UserAssetModels>();

Future<bool> create(UserAsset data) async {
  try {
    return (await uas.insert(data)) > 0;
  } catch (_, __) {
    return false;
  }
}

Future<bool> update(UserAsset data) async {
  try {
    return (await uas.update(data)) > 0;
  } catch (_, __) {
    return false;
  }
}

Future<List<UserAsset>> fetchAll() async {
  try {
    return await uas.fetchAll();
  } catch (_, __) {
    return <UserAsset>[];
  }
}

Future<UserAsset?> get(String tag) async {
  try {
    return uas.get(tag);
  } catch (_, __) {
    return null;
  }
}

Future<bool> delete(String tag) async {
  try {
    return (await uas.delete(tag)) > 0;
  } catch (_, __) {
    return false;
  }
}
