import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

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
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kDefaultDuration,
      child: Padding(
        padding: const EdgeInsets.only(top: kDefaultPadding),
        child: InkWell(
          onTap: press,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              if (isActive)
                LineIcon.caretRight(size: 20)
              else
                const SizedBox(width: 15),
              const SizedBox(width: kDefaultPadding / 4),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 15, right: 5),
                  decoration: showBorder
                      ? const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Color(0xFFDFE2EF)),
                          ),
                        )
                      : null,
                  child: Row(
                    children: <Widget>[
                      LineIcon(
                        iconSrc,
                        color: isActive ? kPrimaryColor : kGrayColor,
                        size: 20,
                      ),
                      const SizedBox(width: kDefaultPadding * 0.75),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.button!.copyWith(
                              color: isActive ? kTextColor : kGrayColor,
                            ),
                      ),
                      const Spacer(),
                      if (itemCount != 0) CounterBadge(count: itemCount)
                    ],
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
