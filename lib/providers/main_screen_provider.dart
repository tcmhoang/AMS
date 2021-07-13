import 'package:flutter/cupertino.dart';
import 'package:lsv_ams/domains/asset_repository/asset_repository.dart';

import 'domain/detail_types.dart';

class MainScreenProvider with ChangeNotifier {
  MainScreenProvider() {
    _listData = fetchAll();
  }

  String _currentSelectSideMenu = 'Assets';
  String get menuItem => _currentSelectSideMenu;

  late Future<List<Object>> _listData;
  DetailTypes _currentCat = const DetailTypes.empty();

  set menuItem(String val) {
    _currentSelectSideMenu = val;
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
