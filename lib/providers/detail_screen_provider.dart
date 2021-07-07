import 'package:flutter/cupertino.dart';
import 'package:lsv_ams/domains/asset_repository/src/asset_model.dart';
import 'package:lsv_ams/providers/domain/detail_types.dart';

class DetailScreenProvider with ChangeNotifier {
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
  DetailTypes get currentCategory => _currentCat;
  set currentCategory(DetailTypes newData) {
    _currentCat = newData;
    notifyListeners();
  }
}
