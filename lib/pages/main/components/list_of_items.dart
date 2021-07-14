import 'dart:io';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../components/side_menu.dart';
import '../../../config/constansts.dart';
import '../../../config/responsive.dart';
import '../../../domains/asset_repository/src/asset_model.dart';
import '../../../domains/user_repository/src/user_model.dart';
import '../../../providers/domain/detail_types.dart';
import '../../../providers/main_screen_provider.dart';
import '../../detail/detail_screen.dart';
import 'card_item.dart';

class ListOfItems extends StatefulWidget {
  const ListOfItems({
    Key? key,
  }) : super(key: key);

  @override
  State<ListOfItems> createState() => _ListOfItemsState();
}

class _ListOfItemsState extends State<ListOfItems> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  int _currIndex = 0;
  List<Object> _items = <Object>[];

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
    return Consumer<MainScreenProvider>(
      builder: (_, MainScreenProvider provider, __) =>
          FutureProvider<List<Object>>.value(
        initialData: const <Object>[],
        value: provider.listData,
        updateShouldNotify: _isDataChanged,
        child: Consumer<List<Object>>(
          builder: (_, List<Object> val, __) {
            if (_isDataChanged(_items, val)) {
              _currIndex = 0;
              _items = val;
            }

            return ListView.builder(
              itemCount: val.length,
              itemBuilder: (_, int index) => CardItem(
                isActive: !Responsive.isMobile(context) && index == _currIndex,
                item: val[index],
                press: () => _handleClick(context, index, provider),
              ),
            ).expanded();
          },
        ),
      ),
    );
  }

  bool _isDataChanged(List<Object> prev, List<Object> curr) =>
      prev.length != curr.length || prev.runtimeType != curr.runtimeType;

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

  void _handleClick(BuildContext context, int index, MainScreenProvider data) {
    setState(() {
      _currIndex = index;
    });

    _changeDetails(data, index);

    if (Responsive.isMobile(context)) {
      Navigator.push(
        context,
        MaterialPageRoute<PageRoute<Widget>>(
          builder: (_) => const DetailScreen(),
        ),
      );
    }
  }

  void _changeDetails(MainScreenProvider provider, int index) {
    switch (_items.runtimeType.toString()) {
      case 'List<Asset>':
        final List<Asset> tmp = _items as List<Asset>;
        provider.currentCategory = DetailTypes.asset(
          Asset(
            tmp[index].tag,
            tmp[index].name,
            tmp[index].typeId,
            tmp[index].userId,
            tmp[index].make,
            tmp[index].created,
            tmp[index].lastUpdated,
            tmp[index].condition,
            tmp[index].urlImage,
            tmp[index].timesUsed,
            tmp[index].originalPrice,
            tmp[index].isAssigned,
          ),
        );
        break;
      case 'List<User>':
        final List<User> tmp = _items as List<User>;
        provider.currentCategory = DetailTypes.user(
          User(
            tmp[index].userId,
            tmp[index].fullName,
            tmp[index].dob,
            tmp[index].gender,
            tmp[index].address,
            tmp[index].urlImage,
          ),
        );
        break;
      default:
        provider.currentCategory = const DetailTypes.empty();
    }
  }
}
