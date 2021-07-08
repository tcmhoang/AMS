import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../providers/detail_screen_provider.dart';
import 'components/header.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailScreenProvider>(
      create: (_) => DetailScreenProvider(),
      child: Consumer<DetailScreenProvider>(
        builder: (_, DetailScreenProvider val, __) => Scaffold(
          body: <Widget>[
            const Header(),
            val.currentCategory.maybeWhen(
              empty: () => Container(),
              orElse: () => const Divider(thickness: 1),
            ),
            // val.content.padding(all: kDefaultPadding).scrollable().expanded(),
          ].toColumn().safeArea().backgroundColor(Colors.white),
        ),
      ),
    );
  }
}
