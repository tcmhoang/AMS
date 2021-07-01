import 'package:flutter/material.dart';

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
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const Header(),
              const Divider(thickness: 1),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: data,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
