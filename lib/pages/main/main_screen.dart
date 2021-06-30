import 'package:flutter/material.dart';
import 'package:lsv_ams/config/responsive.dart';

import '../../components/side_menu.dart';
import '../detail/detail_screen.dart';
import 'components/list_of_assets.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        desktop: Row(
          children: <Expanded>[
            Expanded(
              flex: _size.width > 1340 ? 2 : 4,
              child: const SideMenu(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 3 : 5,
              child: ListOfAssets(
                items: List<int>.generate(10, (int index) => index).toList(),
              ),
            ),
            Expanded(
              flex: _size.width > 1340 ? 8 : 10,
              // child: AssetInfo(),
              child: const DetailScreen(),
            ),
          ],
        ),
        tablet: Row(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: ListOfAssets(
                items: List<int>.generate(10, (int index) => index).toList(),
              ),
            ),
            const Expanded(
              flex: 9,
              child: DetailScreen(),
            )
          ],
        ),
        mobile: ListOfAssets(
          items: List<int>.generate(10, (int index) => index).toList(),
        ),
      ),
    );
  }
}
