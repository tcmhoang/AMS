import 'package:flutter/material.dart';
import 'package:lsv_ams/config/constansts.dart';
import 'package:lsv_ams/providers/main_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import 'components/header.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenProvider>(
      builder: (_, MainScreenProvider val, __) => Scaffold(
        body: <Widget>[
          const Header(),
          val.currentCategory.maybeWhen(
            empty: () => Container(),
            orElse: () => const Divider(thickness: 1),
          ),
          val.currentCategory.maybeWhen(
            empty: () => Container(),
            orElse: () => const Divider(thickness: 1),
          ),
          val.currentCategory.maybeWhen(
            creation: (_, Widget content) =>
                content.padding(all: kDefaultPadding),
            orElse: () => Container(),
          ),
        ].toColumn().scrollable(),
      ),
    );
  }
}
