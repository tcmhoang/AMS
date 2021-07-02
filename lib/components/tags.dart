import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../config/constansts.dart';
import '../providers/main_screen_provider.dart';
import 'default_modal.dart';
import 'dialog_route.dart';

class Tags extends StatelessWidget {
  const Tags({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      _renderHeader(context),
      const SizedBox(height: kDefaultPadding / 2),
      _renderTag(context, color: const Color(0xFF23CF91), title: 'Design'),
      _renderTag(context, color: const Color(0xFF3A6FF7), title: 'Work'),
      _renderTag(context, color: const Color(0xFFF3CF50), title: 'Friends'),
      _renderTag(context, color: const Color(0xFF8338E1), title: 'Family'),
    ].toColumn();
  }

  Widget _renderHeader(BuildContext context) {
    return <Widget>[
      LineIcon.angleDown(size: 13),
      const SizedBox(width: kDefaultPadding / 4),
      const SizedBox(width: kDefaultPadding / 2),
      Text(
        'Tags',
        style: Theme.of(context).textTheme.button!.copyWith(color: kGrayColor),
      ),
      const Spacer(),
      MaterialButton(
          padding: const EdgeInsets.all(10),
          minWidth: 40,
          onPressed: () => Navigator.of(context).push(
                DefaultDialogRoute(
                  page: const DefaultModal(),
                  dismissible: false,
                ),
              ),
          child: LineIcon.plus(
            color: kGrayColor,
            size: 20,
          ))
    ].toRow();
  }

  Widget _renderTag(
    BuildContext context, {
    required Color color,
    required String title,
  }) {
    final MainScreenProvider state = Provider.of<MainScreenProvider>(context);
    return <Widget>[
      AnimatedSwitcher(
        duration: kDefaultDuration,
        child: state.menuItem == title
            ? LineIcon.caretRight(
                size: 20,
                color: kGrayColor,
              )
            : AnimatedContainer(
                duration: kDefaultDuration,
                width: state.menuItem == title ? 0 : 15,
              ),
      ),
      LineIcon.bookmarkAlt(
        size: 18,
        color: color,
      ),
      const SizedBox(width: kDefaultPadding / 2),
      Text(
        title,
        style: Theme.of(context).textTheme.button!.copyWith(color: kGrayColor),
      ),
    ].toRow().padding(left: kDefaultPadding * 1.5, vertical: 10).gestures(
      onTap: () {
        state.menuItem = title;
      },
    );
  }
}
