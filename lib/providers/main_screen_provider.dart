import 'package:flutter/cupertino.dart';
import '../domains/asset_repository/src/asset_model.dart';

import 'domain/detail_types.dart';

class MainScreenProvider with ChangeNotifier {
  String _currentSelectSideMenu = 'Assets';
  List<Object> _listData = <Object>[
    Asset(
      '13123123',
      'Monitor',
      1,
      1,
      'Dell',
      DateTime.now().millisecondsSinceEpoch,
      DateTime.now().millisecondsSinceEpoch,
      'New',
      'asdasd',
      3,
      12321,
      1,
    )
  ];

  DetailTypes _currentCat = DetailTypes.asset(
    Asset(
      '13123123',
      'Monitor',
      0,
      1,
      'Dell',
      DateTime.now().millisecondsSinceEpoch,
      DateTime.now().millisecondsSinceEpoch,
      'New',
      'asdasd',
      3,
      12321,
      1,
    ),
  );

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
