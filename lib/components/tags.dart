import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:lsv_ams/domains/asset_type_repository/asset_type_repository.dart';
import 'package:lsv_ams/domains/asset_type_repository/src/asset_type_model.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:supercharged/supercharged.dart';

import '../config/constansts.dart';
import '../providers/main_screen_provider.dart';
import 'category_creation_modal.dart';
import 'default_dialog_route.dart';
import 'default_modal.dart';

class Tags extends StatefulWidget {
  const Tags({
    Key? key,
  }) : super(key: key);

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Future<List<AssetType>?> itemList = fetchAll();
    return FutureBuilder<List<AssetType>?>(
      future: itemList,
      builder: (_, AsyncSnapshot<Object?> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final List<AssetType> data = snapshot.data! as List<AssetType>;

          return <Widget>[
            _renderHeader(context),
            const SizedBox(height: kDefaultPadding / 2),
            ...data
                .map(
                  (AssetType e) => _renderTag(
                    context,
                    color: e.color.toColor(),
                    title: e.typeName,
                  ),
                )
                .toList(),
          ].toColumn();
        } else
          return const CircularProgressIndicator();
      },
    );
  }

  Widget _renderHeader(BuildContext context) {
    return <Widget>[
      LineIcon.angleDown(size: 13),
      const SizedBox(width: kDefaultPadding / 4),
      const SizedBox(width: kDefaultPadding / 2),
      Text(
        'Category',
        style: Theme.of(context).textTheme.button!.copyWith(color: kGrayColor),
      ),
      const Spacer(),
      MaterialButton(
        padding: const EdgeInsets.all(10),
        minWidth: 40,
        onPressed: () => Navigator.of(context)
            .push(
              DefaultDialogRoute(
                page: DefaultModal(
                  title: 'Create a new category',
                  data: CategoryCreationModal(),
                ),
                dismissible: false,
              ),
            )
            .then((_) => setState(() {})),
        child: LineIcon.plus(
          color: kGrayColor,
          size: 20,
        ),
      )
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
