import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../config/constants.dart';
import '../config/extensions.dart';

class CounterBadge extends StatelessWidget {
  const CounterBadge({
    Key? key,
    required this.count,
  }) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) => Text(
        count.toString(),
        style: Theme.of(context).textTheme.caption!.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
      )
          .padding(
            horizontal: 8,
            vertical: 2,
          )
          .decorated(
            color: kBadgeColor,
            borderRadius: BorderRadius.circular(9),
          )
          .addNeumorphism(
            offset: const Offset(4, 4),
            borderRadius: 9,
            blurRadius: 4,
            topShadowColor: Colors.white,
            bottomShadowColor: const Color(0xFF30384D).withOpacity(0.3),
          );
}
