import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lsv_ams/domains/user_repository/src/user_model.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../config/constansts.dart';
import '../../../config/extensions.dart';
import '../../../domains/asset_repository/src/asset_model.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    this.isActive = false,
    required this.item,
    required this.press,
  }) : super(key: key);

  final bool isActive;
  final Object item;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    _Card processedData = _Card(
      name: 'AssetName',
      title: 'UserName',
      date: DateTime.now(),
      body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      icon: LineIcons.print,
    );
    if (item is Asset) {
      final Asset tmp = item as Asset;
      processedData = _Card(
        name: tmp.name,
        title: tmp.tag,
        date: DateTime.fromMillisecondsSinceEpoch(tmp.lastUpdated),
        body:
            ' Manufacture: ${tmp.make} \t  Handover times: ${tmp.timesUsed} \t Tag: ${tmp.tag} ',
        icon: LineIcons.print,
      );
    }
    if (item is User) {
      final User tmp = item as User;
      processedData = _Card(
        name: tmp.fullName,
        title: tmp.address,
        date: DateTime.fromMillisecondsSinceEpoch(tmp.dob),
        body: '',
        icon: LineIcons.print,
        image: tmp.urlImage.isEmpty ? null : FileImage(File(tmp.urlImage)),
      );
    }
    return _renderCard(context, processedData).gestures(onTap: press).padding(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding / 2,
        );
  }

  Widget _renderCard(BuildContext context, _Card cardData) => <Widget>[
        <Widget>[
          _renderAvatar(cardData.image),
          const SizedBox(width: kDefaultPadding / 2),
          _renderTitle(context, cardData.name, cardData.title),
          _renderSideSection(context, cardData.date, cardData.icon),
        ].toRow(),
        const SizedBox(height: kDefaultPadding / 2),
        _renderBriefBody(context, cardData.body)
      ]
          .toColumn()
          .padding(all: kDefaultPadding)
          .decorated(
            color: isActive ? kPrimaryColor : kBgDarkColor,
            borderRadius: BorderRadius.circular(15),
            animate: true,
          )
          .animate(kDefaultDuration, Curves.easeInOutSine)
          .addNeumorphism(
            blurRadius: 15,
            borderRadius: 15,
            offset: const Offset(5, 5),
            topShadowColor: Colors.white60,
            bottomShadowColor: const Color(0xFF234395).withOpacity(0.15),
          );

  Text _renderBriefBody(BuildContext context, String body) {
    return Text(
      body,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.caption!.copyWith(
            height: 1.5,
            color: isActive ? Colors.white70 : null,
          ),
    );
  }

  Widget _renderSideSection(
    BuildContext context,
    DateTime date,
    IconData icon,
  ) {
    return <Widget>[
      Text(
        DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(date),
        style: Theme.of(context).textTheme.caption!.copyWith(
              color: isActive ? Colors.white70 : null,
            ),
      ),
      const SizedBox(height: 5),
      LineIcon(
        icon,
        color: isActive ? Colors.white70 : kGrayColor,
      )

      // )
    ].toColumn();
  }

  Widget _renderTitle(BuildContext context, String name, String title) {
    return Text.rich(
      TextSpan(
        text: '$name\n',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isActive ? Colors.white : kTextColor,
        ),
        children: <InlineSpan>[
          TextSpan(
            text: title,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: isActive ? Colors.white : kTextColor,
                ),
          ),
        ],
      ),
    ).expanded();
  }

  Widget _renderAvatar(ImageProvider? image) => CircleAvatar(
        backgroundImage: image ?? const AssetImage('assets/img/avatar.jpg'),
      ).width(32);
}

class _Card {
  _Card({
    this.image,
    required this.name,
    required this.title,
    required this.date,
    required this.body,
    required this.icon,
  });

  final ImageProvider? image;
  final String name;
  final String title;
  final DateTime date;
  final String body;
  final IconData icon;
}
