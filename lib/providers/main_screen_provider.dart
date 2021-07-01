import 'package:flutter/cupertino.dart';

class MainScreenProvider with ChangeNotifier {
  Widget _currentDetailPage = Container();

  Widget get detailPage => _currentDetailPage;

  set detailPage(Widget newData) {
    _currentDetailPage = newData;
    notifyListeners();
  }
}
