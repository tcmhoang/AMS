import '../../services/injection_pool.dart';
import 'src/asset_model.dart';
import 'src/models.dart';

late AssetModels assets = InjectionPool.injector!.get<AssetModels>();

Future<bool> create(Asset asset) async {
  try {
    await assets.insertAsset(asset);
  } catch (_, __) {
    return false;
  }
  return true;
}

Future<bool> update(String tag, Asset newData) async {
  try {
    if (newData.tag != tag) {
      throw Exception('Not the same data');
    }
    await assets.getAsset(tag);
    await assets.updateAsset(newData);
  } catch (_, __) {
    return false;
  }
  return true;
}

Future<List<Asset>?> fetchAll() async {
  try {
    return await assets.getAllAsset();
  } catch (_, __) {
    return null;
  }
}

Future<bool> delete(String tag) async {
  try {
    await assets.deleteAsset(tag);
    return true;
  } catch (_, __) {
    return false;
  }
}

Future<Asset?> get(String tag) async {
  try {
    return await assets.getAsset(tag);
  } catch (_, __) {
    return null;
  }
}

Future<bool> fetchByType(String type) async {
  // TODO(tuanhm): Do later
  return true;
}

Future<bool> isExisted(String tag) async =>
    (await fetchAll())!.any((Asset e) => e.tag == tag);
