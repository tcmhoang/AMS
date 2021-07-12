import 'package:flutter/cupertino.dart';

import 'domain/detail_types.dart';

class MainScreenProvider with ChangeNotifier {
  String _currentSelectSideMenu = 'Assets';
  List<Object> _listData = <Object>[];

  DetailTypes _currentCat = const DetailTypes.empty();

  String get menuItem => _currentSelectSideMenu;

  set menuItem(String val) {
    _currentSelectSideMenu = val;
    notifyListeners();
  }

  List<Object> get listData => _listData;

  set listData(List<Object> newData) {
    _listData = newData;
    notifyListeners();
  }

  DetailTypes get currentCategory => _currentCat;
  set currentCategory(DetailTypes newData) {
    _currentCat = newData;
    notifyListeners();
  }
}
