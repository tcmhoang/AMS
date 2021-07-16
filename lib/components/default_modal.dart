import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../config/constansts.dart';
import '../config/responsive.dart';

class DefaultModal extends StatelessWidget {
  const DefaultModal({
    Key? key,
    this.data,
    required this.title,
    this.maxWidth,
    this.maxHeight,
  }) : super(key: key);

  final Widget? data;
  final String title;
  final double? maxWidth, maxHeight;
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      _renderHeader(context),
      const SizedBox(height: kDefaultPadding),
      data ?? const Text('(　´･‿･｀)'),
    ]
        .toColumn(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
        )
        .padding(
          horizontal: 16,
          bottom: kDefaultPadding,
        )
        .card(
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: kBgDarkColor,
        )
        .constrained(
          maxWidth: maxWidth ?? MediaQuery.of(context).size.width / 2,
          minHeight: maxHeight ?? MediaQuery.of(context).size.height * .7,
          animate: true,
        )
        .scrollable()
        .animate(kDefaultDuration, Curves.bounceInOut);
  }

  Widget _renderHeader(BuildContext context) {
    return !Responsive.isMobile(context)
        ? <Widget>[
            const CloseButton().alignment(Alignment.centerLeft).expanded(),
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ).fittedBox().flexible(flex: 2),
            const Spacer(),
          ].toRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
          )
        : <Widget>[
            const CloseButton(),
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ).padding(left: kDefaultPadding * 0.5),
          ].toColumn(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          );
  }
}
