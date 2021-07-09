import 'dart:io';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:lsv_ams/domains/asset_repository/src/asset_model.dart';
import 'package:lsv_ams/providers/domain/detail_types.dart';
import 'package:lsv_ams/providers/main_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../components/side_menu.dart';
import '../../../config/constansts.dart';
import '../../../config/responsive.dart';
import '../../detail/detail_screen.dart';
import 'card_item.dart';

class ListOfItems extends StatefulWidget {
  const ListOfItems({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<Object> items;

  @override
  State<ListOfItems> createState() => _ListOfItemsState();
}

class _ListOfItemsState extends State<ListOfItems> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int _currIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const SideMenu().constrained(maxWidth: 250),
      body: SafeArea(
        right: false,
        child: <Widget>[
          <Widget>[
            if (!Responsive.isDesktop(context)) ..._renderIcons,
            _renderSearchBar()
          ].toRow().padding(horizontal: kDefaultPadding),
          const SizedBox(height: kDefaultPadding),
          _renderSearchIdicator(),
          const SizedBox(height: kDefaultPadding),
          _renderListItems(context),
        ].toColumn(),
      )
          .padding(
            top: Platform.isLinux || Platform.isWindows ? kDefaultPadding : 0,
          )
          .backgroundColor(kBgDarkColor),
    );
  }

  List<Widget> get _renderIcons {
    return <Widget>[
      IconButton(
        onPressed: () {
          _key.currentState!.openDrawer();
        },
        icon: const Icon(Icons.menu),
      ),
      const SizedBox(width: 5)
    ];
  }

  Widget _renderListItems(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (_, int index) => CardItem(
        isActive: !Responsive.isMobile(context) && index == _currIndex,
        item: widget.items[index],
        press: () => _handleClick(context, index),
      ),
    ).expanded();
  }

  Widget _renderSearchIdicator() {
    return <Widget>[
      LineIcon.angleDown(
        size: 12,
        color: Colors.black,
      ),
      const SizedBox(width: 5),
      const Text(
        'Sort by date',
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      const Spacer(),
      MaterialButton(
        minWidth: 20,
        onPressed: () {},
        child: LineIcon.sort(size: 16),
      ),
    ].toRow().padding(horizontal: kDefaultPadding);
  }

  Widget _renderSearchBar() {
    return TextField(
      onChanged: (String value) {},
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: kBgLightColor,
        filled: true,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(kDefaultPadding * .75),
          child: RotatedBox(
            quarterTurns: -1,
            child: LineIcon.search(size: 24),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
      ),
    ).expanded();
  }

  void _handleClick(BuildContext context, int index) {
    setState(() {
      _currIndex = index;
    });
    if (Responsive.isMobile(context)) {
      Navigator.push(
        context,
        MaterialPageRoute<PageRoute<Widget>>(
          builder: (_) => const DetailScreen(),
        ),
      );
    }
    if (Provider.of<MainScreenProvider>(context, listen: false).menuItem ==
        'Assets') {
      final List<Asset> tmp = widget.items as List<Asset>;
      Provider.of<MainScreenProvider>(context, listen: false).currentCategory =
          DetailTypes.asset(
        Asset(
          tmp[index].tag,
          tmp[index].name,
          1,
          1,
          tmp[index].make,
          DateTime.now().millisecondsSinceEpoch,
          DateTime.now().millisecondsSinceEpoch,
          tmp[index].condition,
          'asdasd',
          3,
          tmp[index].originalPrice,
          1,
        ),
      );
    }
  }
}
