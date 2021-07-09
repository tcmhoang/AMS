import '../../services/injection_pool.dart';
import '../asset_type_repository/src/asset_type_model.dart';
import '../asset_type_repository/src/models.dart';
import 'src/asset_model.dart';
import 'src/models.dart';

late AssetModels assets = InjectionPool.injector!.get<AssetModels>();
late AssetTypeModels types = InjectionPool.injector!.get<AssetTypeModels>();

int count = 0;

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

Future<List<Asset>> fetchAll() async {
  try {
    final List<Asset> tmp = await assets.getAllAsset();
    count = tmp.length;
    return tmp;
  } catch (_, __) {
    return <Asset>[];
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

Future<List<Asset>> fetchByType(String typeName) async {
  final AssetType tmp = await types.findByTitle(typeName);
  try {
    if (tmp != null) {
      return await assets.fetchByType(tmp.typeId);
    } else
      return <Asset>[];
  } catch (_, __) {
    return <Asset>[];
  }
}

Future<bool> isExisted(String tag) async =>
    (await fetchAll()).any((Asset e) => e.tag == tag);
