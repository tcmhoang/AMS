import 'dart:io';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:lsv_ams/components/side_menu.dart';
import 'package:lsv_ams/config/responsive.dart';
import 'package:lsv_ams/pages/detail/detail_screen.dart';

import '../../../config/constansts.dart';
import 'card_item.dart';

class ListOfAssets extends StatefulWidget {
  const ListOfAssets({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<int> items;

  @override
  State<ListOfAssets> createState() => _ListOfAssetsState();
}

class _ListOfAssetsState extends State<ListOfAssets> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 250),
        child: const SideMenu(),
      ),
      body: Container(
        color: kBgDarkColor,
        padding: EdgeInsets.only(
          top: Platform.isLinux || Platform.isWindows ? kDefaultPadding : 0,
        ),
        child: SafeArea(
          right: false,
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: <Widget>[
                    if (!Responsive.isDesktop(context)) ...<Widget>[
                      IconButton(
                        onPressed: () {
                          _key.currentState!.openDrawer();
                        },
                        icon: const Icon(Icons.menu),
                      ),
                      const SizedBox(width: 5)
                    ],
                    Expanded(
                      child: TextField(
                        onChanged: (String value) {},
                        decoration: InputDecoration(
                          hintText: 'Search',
                          fillColor: kBgLightColor,
                          filled: true,
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsets.all(kDefaultPadding * .75),
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
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: <Widget>[
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
                  ],
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.items.length,
                  itemBuilder: (_, int index) => CardItem(
                    isActive: !Responsive.isMobile(context) && index == 0,
                    // item: items[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute<PageRoute<Widget>>(
                        builder: (_) => const DetailScreen(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
