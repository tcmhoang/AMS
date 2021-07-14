import 'package:flutter/cupertino.dart';

import '../domains/asset_repository/asset_repository.dart' as assets;
import '../domains/asset_repository/src/asset_model.dart';
import '../domains/user_repository/user_repository.dart' as users;
import 'domain/detail_types.dart';

class MainScreenProvider with ChangeNotifier {
  MainScreenProvider() {
    _listData = assets.fetchAll();
    _listData.then<void>(
      (List<Object> value) {
        if (value.isNotEmpty) {
          currentCategory = DetailTypes.asset(value[0] as Asset);
        }
      },
    );
  }
  static final Map<String, Future<List<Object>>> kActions =
      <String, Future<List<Object>>>{
    'Users': users.fetchAll(),
    'Assets': assets.fetchAll()
  };

  String _currentSelectSideMenu = 'Assets';
  DetailTypes _currentCat = const DetailTypes.empty();
  int _currIdxList = 0;

  int get currentIndexList => _currIdxList;
  set currentIndexList(int newVal) {
    _currIdxList = newVal;
    notifyListeners();
  }

  late Future<List<Object>> _listData;

  String get menuItem => _currentSelectSideMenu;
  set menuItem(String val) {
    _currentSelectSideMenu = val;
    if (kActions.containsKey(val)) {
      listData = kActions[val]!;
    } else {
      listData = assets.findByType(val);
    }
    currentIndexList = 0;
    notifyListeners();
  }

  Future<List<Object>> get listData => _listData;

  set listData(Future<List<Object>> newData) {
    _listData = newData;
    notifyListeners();
  }

  DetailTypes get currentCategory => _currentCat;
  set currentCategory(DetailTypes newData) {
    _currentCat = newData;
    notifyListeners();
  }
}
