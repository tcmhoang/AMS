import '../../services/injection_pool.dart';
import 'src/asset_type_model.dart';
import 'src/models.dart';

late AssetTypeModels ats = InjectionPool.injector!.get<AssetTypeModels>();

Future<bool> create(AssetType data) async {
  try {
    await ats.insertType(data);
  } catch (_, __) {
    return false;
  }
  return true;
}

Future<bool> update(int id, AssetType newData) async {
  try {
    await ats.updateAssetType(newData);
  } catch (_, __) {
    return false;
  }
  return true;
}

Future<List<AssetType>?> fetchAll() async {
  try {
    return await ats.getAllAssetType();
  } catch (_, __) {
    return null;
  }
}

Future<AssetType?> get(int id) async {
  try {
    return ats.get(id);
  } catch (_, __) {
    return null;
  }
}

Future<AssetType?> findByTitle(String title) async {
  try {
    return ats.findByTitle(title);
  } catch (_, __) {
    return null;
  }
}
