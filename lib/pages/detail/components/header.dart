import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

import '../../../config/constansts.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: LineIcon.trash(size: 24),
            onPressed: () {},
          ),
          const SizedBox(width: kDefaultPadding / 2),
          IconButton(
            icon: LineIcon.upload(size: 24),
            onPressed: () {},
          ),
          const Spacer(),
          IconButton(
            icon: LineIcon.print(size: 24),
            onPressed: () {},
          ),
          const SizedBox(width: kDefaultPadding / 2),
          IconButton(
            icon: LineIcon.bookmarkAlt(size: 24),
            onPressed: () {},
          ),
          const SizedBox(width: kDefaultPadding / 2),
          IconButton(
            icon: LineIcon.verticalEllipsis(size: 24),
            onPressed: () {},
          ),
          const SizedBox(width: kDefaultPadding / 2),
        ],
      ),
    );
  }
}