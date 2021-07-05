import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../config/constansts.dart';

class AssetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      _renderAvatar(),
      const SizedBox(width: kDefaultPadding),
      <Widget>[
        _renderBriefInfo(context),
        const SizedBox(height: kDefaultPadding),
        _renderDetails(context),
      ]
          .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .expanded(),
    ].toRow(crossAxisAlignment: CrossAxisAlignment.start);
  }

  Row _renderBriefInfo(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text.rich(
                TextSpan(
                  // text: emails[1].name,
                  text: 'Full user name',
                  style: Theme.of(context).textTheme.button,
                  children: <InlineSpan>[
                    TextSpan(
                      text: '<email@leon-system.com>',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
              Text(
                'Device Name',
                style: Theme.of(context).textTheme.headline6,
              )
            ],
          ),
        ),
        const SizedBox(width: kDefaultPadding / 2),
        Text(
          DateFormat(
            DateFormat.YEAR_NUM_MONTH_WEEKDAY_DAY,
          ).format(DateTime.now()),
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }

  CircleAvatar _renderAvatar() => const CircleAvatar(
        maxRadius: 24,
        backgroundColor: Colors.blueGrey,
        // backgroundImage: AssetImage(emails[1].image),
      );

  Widget _renderDetails(BuildContext context) => LayoutBuilder(
        builder: (_, BoxConstraints constraints) => SizedBox(
          width: constraints.maxWidth > 850 ? 800 : constraints.maxWidth,
          child: <Widget>[
            const Text(
              'Device Info, \n \nSunt architecto voluptatum esse tempora sint nihil minus incidunt nisi. Perspiciatis natus quo unde magnam numquam pariatur amet ut. Perspiciatis ab totam. Ut labore maxime provident. Voluptate ea omnis et ipsum asperiores laborum repellat explicabo fuga. Dolore voluptatem praesentium quis eos laborum dolores cupiditate nemo labore.',
              style: TextStyle(
                height: 1.5,
                color: Color(0xFF4D5875),
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            <Widget>[
              const Text(
                '6 attachments',
                style: TextStyle(fontSize: 12),
              ),
              const Spacer(),
              Text(
                'Download All',
                style: Theme.of(context).textTheme.caption,
              ),
              const SizedBox(
                width: kDefaultPadding / 4,
              ),
              LineIcon.download(
                size: 16,
                color: kGrayColor,
              ),
            ].toRow(),
            const Divider(thickness: 1),
            const SizedBox(height: kDefaultPadding / 2),
            StaggeredGridView.countBuilder(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) => Container(
                color: Colors.blueGrey.withOpacity(0.5),
              ).clipRRect(all: 8),
              staggeredTileBuilder: (int index) => StaggeredTile.count(
                2,
                index.isOdd ? 2 : 1,
              ),
              mainAxisSpacing: kDefaultPadding,
              crossAxisSpacing: kDefaultPadding,
            ).height(200),
          ].toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      );
}
