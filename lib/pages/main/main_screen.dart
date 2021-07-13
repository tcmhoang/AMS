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
    return Consumer<MainScreenProvider>(
      builder: (_, MainScreenProvider value, __) => Scaffold(
        body: Responsive(
          desktop: _renderDesktop(_size, value),
          tablet: _renderTablet(value),
          mobile: _renderMobile(value),
        ),
      ),
    );
  }

  ListOfItems _renderMobile(MainScreenProvider provider) {
    return const ListOfItems();
  }

  Widget _renderTablet(MainScreenProvider provider) {
    return <Widget>[
      const ListOfItems().expanded(flex: 6),
      const DetailScreen().expanded(flex: 9)
    ].toRow();
  }

  Widget _renderDesktop(Size _size, MainScreenProvider provider) {
    return <Widget>[
      const SideMenu().expanded(flex: _size.width > 1340 ? 2 : 4),
      const ListOfItems().expanded(flex: _size.width > 1340 ? 3 : 5),
      const DetailScreen().expanded(flex: _size.width > 1340 ? 8 : 10),
    ].toRow();
  }
}
