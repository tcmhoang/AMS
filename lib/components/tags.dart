import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';

import '../config/constansts.dart';
import '../providers/main_screen_provider.dart';
import 'tag_creation_modal.dart';

class Tags extends StatelessWidget {
  const Tags({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            LineIcon.angleDown(size: 13),
            const SizedBox(width: kDefaultPadding / 4),
            const SizedBox(width: kDefaultPadding / 2),
            Text(
              'Tags',
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: kGrayColor),
            ),
            const Spacer(),
            MaterialButton(
              padding: const EdgeInsets.all(10),
              minWidth: 40,
              onPressed: () => Navigator.of(context).push(
                TagCreationRoute(page: TagCreationModal(), dismissible: false),
              ),
              child: const Icon(
                Icons.add,
                color: kGrayColor,
                size: 20,
              ),
            )
          ],
        ),
        const SizedBox(height: kDefaultPadding / 2),
        buildTag(context, color: const Color(0xFF23CF91), title: 'Design'),
        buildTag(context, color: const Color(0xFF3A6FF7), title: 'Work'),
        buildTag(context, color: const Color(0xFFF3CF50), title: 'Friends'),
        buildTag(context, color: const Color(0xFF8338E1), title: 'Family'),
      ],
    );
  }

  InkWell buildTag(
    BuildContext context, {
    required Color color,
    required String title,
  }) {
    final MainScreenProvider state = Provider.of<MainScreenProvider>(context);
    return InkWell(
      onTap: () {
        state.menuItem = title;
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(kDefaultPadding * 1.5, 10, 0, 10),
        child: Row(
          children: <Widget>[
            if (state.menuItem == title)
              LineIcon.caretRight(
                size: 20,
                color: kGrayColor,
              ),
            LineIcon.bookmarkAlt(
              size: 18,
              color: color,
            ),
            const SizedBox(width: kDefaultPadding / 2),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: kGrayColor),
            ),
          ],
        ),
      ),
    );
  }
}
