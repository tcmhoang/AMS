import 'package:flutter/material.dart';

import '../../components/side_menu.dart';
import '../detail/detail_screen.dart';
import 'components/list_of_assets.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Expanded>[
          const Expanded(
            flex: 2,
            child: SideMenu(),
          ),
          Expanded(
            flex: 3,
            child: ListOfAssets(
              // ignore: always_specify_types
              items: List.generate(10, (int index) => index).toList(),
            ),
          ),
          const Expanded(
            flex: 8,
            // child: AssetInfo(),
            child: DetailScreen(),
          ),
        ],
      ),
    );
  }
}
