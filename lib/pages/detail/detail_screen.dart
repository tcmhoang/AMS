import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../config/constansts.dart';
import 'components/header.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Widget data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        const Header(),
        const Divider(thickness: 1),
        data.padding(all: kDefaultPadding).scrollable().expanded(),
      ].toColumn().safeArea().backgroundColor(Colors.white),
    );
  }
}
