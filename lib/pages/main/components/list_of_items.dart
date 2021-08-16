import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../components/side_menu.dart';
import '../../../config/constants.dart';
import '../../../config/responsive.dart';
import '../../../domains/asset_repository/asset_repository.dart' as assets;
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
          _renderSearchIndicator(),
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
          FutureBuilder<List<Object>>(
        initialData: const <Object>[],
        future: provider.listData,
        builder: (_, AsyncSnapshot<List<Object>> snapshot) {
          if (snapshot.hasData) {
            _items = snapshot.data!;
            return ListView.builder(
              itemCount: _items.length,
              itemBuilder: (_, int index) => CardItem(
                isActive: !Responsive.isMobile(context) &&
                    index == provider.currentIndexList,
                item: _items[index],
                press: () => _handleClick(context, index, provider),
              ),
            ).expanded();
          } else
            return const CircularProgressIndicator().center();
        },
      ),
    );
  }

  Widget _renderSearchIndicator() {
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
      onSubmitted: (String val) =>
          Provider.of<MainScreenProvider>(context, listen: false).listData =
              assets.findByName(val),
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
      data.currentIndexList = index;
    });

    _changeDetails(data, _items[index]);

    if (Responsive.isMobile(context)) {
      Navigator.push(
        context,
        MaterialPageRoute<PageRoute<Widget>>(
          builder: (_) => const DetailScreen(),
        ),
      );
    }
  }

  void _changeDetails(MainScreenProvider provider, Object data) {
    if (data is Asset)
      provider.currentCategory = DetailTypes.asset(data);
    else if (data is User) {
      provider.currentCategory = DetailTypes.user(data);
      provider.listData = assets.findByUser(data.id);
    } else
      provider.currentCategory = const DetailTypes.empty();
  }
}
