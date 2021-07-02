import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icon.dart';
import 'package:styled_widget/styled_widget.dart';

import '../config/constansts.dart';
import 'counter_badge.dart';

class SideMenuItem extends StatelessWidget {
  const SideMenuItem({
    Key? key,
    this.isActive = false,
    this.itemCount = 0,
    this.showBorder = true,
    required this.iconSrc,
    required this.title,
    required this.press,
  }) : super(key: key);

  final bool isActive, showBorder;
  final int itemCount;
  final IconData iconSrc;
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) => <Widget>[
        AnimatedSwitcher(
          duration: kDefaultDuration,
          child: isActive
              ? LineIcon.caretRight(size: 20)
              : const SizedBox(width: 15),
        ),
        const SizedBox(width: kDefaultPadding / 4),
        _renderContent(context)
            .padding(
              bottom: 15,
              right: 5,
            )
            .decorated(
              border: showBorder
                  ? const Border(
                      bottom: BorderSide(color: Color(0xFFDFE2EF)),
                    )
                  : null,
            )
            .expanded(),
      ]
          .toRow(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          )
          .gestures(onTap: press)
          .padding(top: kDefaultPadding);

  Widget _renderContent(BuildContext context) => <Widget>[
        LineIcon(
          iconSrc,
          color: isActive ? kPrimaryColor : kGrayColor,
          size: 20,
        ).animate(kDefaultDuration, Curves.easeInOutExpo),
        const SizedBox(width: kDefaultPadding * 0.75),
        Text(
          title,
          style: Theme.of(context).textTheme.button!.copyWith(
                color: isActive ? kTextColor : kGrayColor,
              ),
        ),
        const Spacer(),
        if (itemCount != 0) CounterBadge(count: itemCount)
      ].toRow();
}
