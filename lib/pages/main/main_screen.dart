import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/side_menu.dart';
import '../../config/responsive.dart';
import '../../providers/main_screen_provider.dart';
import '../detail/detail_screen.dart';
import 'components/list_of_items.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<MainScreenProvider>(
      create: (_) => MainScreenProvider(),
      child: Consumer<MainScreenProvider>(
        builder: (_, MainScreenProvider value, __) => Scaffold(
          body: Responsive(
            desktop: Row(
              children: <Expanded>[
                Expanded(
                  flex: _size.width > 1340 ? 2 : 4,
                  child: const SideMenu(),
                ),
                Expanded(
                  flex: _size.width > 1340 ? 3 : 5,
                  child: ListOfItems(
                    items:
                        List<int>.generate(10, (int index) => index).toList(),
                  ),
                ),
                Expanded(
                  flex: _size.width > 1340 ? 8 : 10,
                  // child: AssetInfo(),
                  child: DetailScreen(data: value.detailPage),
                ),
              ],
            ),
            tablet: Row(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: ListOfItems(
                    items:
                        List<int>.generate(10, (int index) => index).toList(),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: DetailScreen(data: value.detailPage),
                )
              ],
            ),
            mobile: ListOfItems(
              items: List<int>.generate(10, (int index) => index).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
