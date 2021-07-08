import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:lsv_ams/providers/main_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:supercharged/supercharged.dart';

import '../../../config/constansts.dart';
import '../../../config/responsive.dart';
import '../../../domains/asset_repository/src/asset_model.dart';
import '../../../domains/asset_type_repository/asset_type_repository.dart'
    as ats;
import '../../../domains/asset_type_repository/src/asset_type_model.dart';
import '../../../providers/domain/detail_types.dart';

class Header extends StatefulWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<MainScreenProvider>(context).currentCategory.maybeWhen(
          asset: (Asset asset) => <Widget>[
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
            FutureBuilder<List<AssetType>>(
              future: ats.fetchAll(),
              builder: (_, AsyncSnapshot<List<AssetType>> snapshot) {
                if (snapshot.hasData) {
                  final List<AssetType> tmp = snapshot.data!;

                  return tmp.isEmpty
                      ? ListTile(
                          trailing: LineIcon.bookmarkAlt(size: 24),
                          title: Text(
                            'Try adding a new category',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ).flexible()
                      : DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            value: asset.typeId == 0 ? null : asset.typeId,
                            icon: LineIcon.bookmarkAlt(),
                            elevation: 5,
                            style: Theme.of(context).textTheme.bodyText2,
                            onChanged: (int? id) =>
                                Provider.of<MainScreenProvider>(
                              context,
                              listen: false,
                            ).currentCategory = DetailTypes.asset(
                              asset.copyWith(typeId: id ?? 0),
                            ),
                            iconSize: asset.typeId == 0 ? 24 : 0,
                            items: tmp
                                .map<DropdownMenuItem<int>>(
                                  (AssetType e) => DropdownMenuItem<int>(
                                    child: <Widget>[
                                      Text(e.typeName)
                                          .padding(right: kDefaultPadding),
                                      LineIcon.bookmarkAlt(
                                        size: 24,
                                        color: e.color.toColor(),
                                      ),
                                    ].toRow(mainAxisSize: MainAxisSize.min),
                                    value: e.typeId,
                                  ),
                                )
                                .toList(),
                          ),
                        );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            IconButton(
              icon: LineIcon.print(size: 24),
              onPressed: () {},
            ),
            IconButton(
              icon: LineIcon.verticalEllipsis(size: 24),
              onPressed: () {},
            ),
          ].toRow().padding(all: kDefaultPadding),
          orElse: () => Container(),
        );
  }
}
