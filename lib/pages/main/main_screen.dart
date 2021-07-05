import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

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
            desktop: _renderDesktop(_size, value),
            tablet: _renderTablet(value),
            mobile: _renderMobile(),
          ),
        ),
      ),
    );
  }

  ListOfItems _renderMobile() {
    return ListOfItems(
      items: List<int>.generate(10, (int index) => index).toList(),
    );
  }

  Widget _renderTablet(MainScreenProvider value) {
    return <Widget>[
      ListOfItems(
        items: List<int>.generate(10, (int index) => index).toList(),
      ).expanded(flex: 6),
      DetailScreen(data: value.detailPage).expanded(flex: 9)
    ].toRow();
  }

  Widget _renderDesktop(Size _size, MainScreenProvider value) {
    return <Widget>[
      const SideMenu().expanded(flex: _size.width > 1340 ? 2 : 4),
      ListOfItems(
        items: List<int>.generate(10, (int index) => index).toList(),
      ).expanded(flex: _size.width > 1340 ? 3 : 5),
      DetailScreen(data: value.detailPage)
          .expanded(flex: _size.width > 1340 ? 8 : 10),
    ].toRow();
  }
}
