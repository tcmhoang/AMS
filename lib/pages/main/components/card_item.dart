import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../config/constansts.dart';
import '../../../config/extensions.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    this.isActive = false,
    // this.item,
    required this.press,
  }) : super(key: key);

  final bool isActive;
  // final item;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return _renderCard(context).gestures(onTap: press).padding(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding / 2,
        );
  }

  Widget _renderCard(BuildContext context) => <Widget>[
        <Widget>[
          _renderAvatar(),
          const SizedBox(width: kDefaultPadding / 2),
          _renderTitle(context),
          _renderSideSection(context),
        ].toRow(),
        const SizedBox(height: kDefaultPadding / 2),
        _renderBriefBody(context)
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

  Text _renderBriefBody(BuildContext context) {
    return Text(
      // item.body,
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.caption!.copyWith(
            height: 1.5,
            color: isActive ? Colors.white70 : null,
          ),
    );
  }

  Widget _renderSideSection(BuildContext context) {
    return <Widget>[
      Text(
        // item.time,
        DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(DateTime.now()),
        style: Theme.of(context).textTheme.caption!.copyWith(
              color: isActive ? Colors.white70 : null,
            ),
      ),
      const SizedBox(height: 5),
      LineIcon.print(
        color: isActive ? Colors.white70 : kGrayColor,
      )

      // )
    ].toColumn();
  }

  Widget _renderTitle(BuildContext context) {
    return Text.rich(
      TextSpan(
        // text: '${item.name} \n',
        text: 'Asset name\n',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isActive ? Colors.white : kTextColor,
        ),
        children: <InlineSpan>[
          TextSpan(
            // text: item.subject,
            text: 'Username',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: isActive ? Colors.white : kTextColor,
                ),
          ),
        ],
      ),
    ).expanded();
  }

  Widget _renderAvatar() => const CircleAvatar(
        backgroundColor: Colors.blueGrey,
        // backgroundImage: AssetImage(item.image),
      ).width(32);
}
