import 'package:flutter/cupertino.dart';

class MainScreenProvider with ChangeNotifier {
  Widget _currentDetailPage = Container();
  String _currentSelectSideMenu = 'Assets';

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
}
