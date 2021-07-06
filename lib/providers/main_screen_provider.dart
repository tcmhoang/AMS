import 'package:flutter/cupertino.dart';
import 'package:lsv_ams/domains/asset_repository/src/asset_model.dart';

class MainScreenProvider with ChangeNotifier {
  Widget _currentDetailPage = Container();
  String _currentSelectSideMenu = 'Assets';
  List<Object> _listData = <Object>[
    Asset(
      '13123123',
      'Monitor',
      1,
      1,
      'Dell',
      '123213213',
      DateTime.now().millisecondsSinceEpoch,
      DateTime.now().millisecondsSinceEpoch,
      'New',
      'asdasd',
      3,
      12321,
      1,
    )
  ];

  Widget get detailPage => _currentDetailPage;

  set detailPage(Widget newData) {
    _currentDetailPage = newData;
    notifyListeners();
  }

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
}
