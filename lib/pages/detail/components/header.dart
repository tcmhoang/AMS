import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

import '../../../config/constansts.dart';
import '../../../config/responsive.dart';

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
          if (Responsive.isMobile(context)) const BackButton(),
          IconButton(
            icon: LineIcon.trash(size: 24),
            onPressed: () {},
          ),
          IconButton(
            icon: LineIcon.upload(size: 24),
            onPressed: () {},
          ),
          const Spacer(),
          IconButton(
            icon: LineIcon.print(size: 24),
            onPressed: () {},
          ),
          IconButton(
            icon: LineIcon.bookmarkAlt(size: 24),
            onPressed: () {},
          ),
          IconButton(
            icon: LineIcon.verticalEllipsis(size: 24),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
