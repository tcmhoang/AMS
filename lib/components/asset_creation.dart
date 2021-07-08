import 'dart:io';
import 'dart:typed_data';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icon.dart';
import 'package:lsv_ams/config/constansts.dart';
import 'package:lsv_ams/domains/asset_repository/asset_repository.dart';
import 'package:lsv_ams/domains/asset_repository/src/asset_model.dart';
import 'package:lsv_ams/domains/asset_type_repository/asset_type_repository.dart'
    as at;
import 'package:lsv_ams/domains/asset_type_repository/src/asset_type_model.dart';
import 'package:lsv_ams/domains/user_repository/src/user_model.dart';
import 'package:lsv_ams/domains/user_repository/user_repository.dart' as us;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:styled_widget/styled_widget.dart';

class AssetCreation extends StatefulWidget {
  @override
  AssetCreationState createState() => AssetCreationState();
}

class AssetCreationState extends State<AssetCreation> {
  late String tag;
  late String name;
  late String manufacture;
  late double price;
  late bool isAssigned = false;
  final List<String> listCondition = <String>['New', 'Used', 'Broken'];
  Future<List<AssetType>> dropdownListAsset = at.fetchAll();
  Future<List<User>> dropdownListUser = us.fetchAll();
  late int selectedAsset = 0;
  late int selectedUser = 0;
  late String dropdownAssetValue = 'a';
  late String dropdownConditionValue = 'New';
  late String dropdownUserValue = '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String image = '';
  List<AssetType> itemListAsset = <AssetType>[];
  List<User> itemListUser = <User>[];

  @override
  void initState() {
    super.initState();
    dropdownListAsset.then((List<AssetType> value) {
      itemListAsset = value;
      setState(() {
        dropdownAssetValue = itemListAsset[0].typeName;
      });
    });
    dropdownListUser.then((List<User> value) {
      itemListUser = value;
      setState(() {
        dropdownUserValue = itemListUser[0].fullName;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: <Widget>[
        Text(
          'Add Asset',
          style: Theme.of(context).textTheme.headline5,
        ).alignment(Alignment.centerLeft),
        <Widget>[
          _renderTag(context),
          _renderName(context),
        ].toRow(),
        <Widget>[
          _renderType(context),
          _renderManufacture(context),
        ].toRow(),
        <Widget>[
          _renderCondition(context),
          _renderPrice(context),
        ].toRow(),
        <Widget>[
          const Text('Is Assigned:'),
          _renderIsAssigned(context),
          if (isAssigned == true) _renderUserAssigned(context),
        ].toRow().height(kDefaultPadding * 3),
        <Widget>[
          _renderImage(context),
        ].toRow().height(kDefaultPadding * 8),
        const SizedBox(
          height: 60,
        ),
        _renderAddUserBtn(context),
      ]
          .toColumn(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
          )
          .padding(all: 6)
          .width(double.infinity),
    ).padding(all: 25);
  }

  Widget _renderAddUserBtn(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(150, 40),
        padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        primary: kPrimaryColor,
      ),
      onPressed: () async {
        for (final AssetType element in itemListAsset) {
          if (element.typeName == dropdownAssetValue) {
            selectedAsset = element.typeId;
          }
        }
        for (final User element in itemListUser) {
          if (element.fullName == dropdownUserValue) {
            selectedUser = element.userId;
          }
        }
        if (formKey.currentState!.validate()) {
          await create(
            Asset(
              tag,
              name,
              selectedAsset,
              selectedUser,
              manufacture,
              DateTime.now().microsecondsSinceEpoch,
              DateTime.now().microsecondsSinceEpoch,
              dropdownConditionValue,
              image,
              2,
              price,
              isAssigned == true ? 1 : 0,
            ),
          );
        }
        _showTopFlash();
      },
      icon: LineIcon.save(),
      label: const Text('SAVE'),
    );
  }

  Widget _renderTag(BuildContext context) => TextFormField(
        validator: (String? tag) =>
            tag != null && tag.isEmpty ? 'The tag cannot be empty' : null,
        onChanged: (String value) => setState(() {
          tag = value;
        }),
        decoration: const InputDecoration(
          labelText: 'Tag',
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: kGrayColor),
          ),
        ),
      ).padding(bottom: kDefaultPadding, right: kDefaultPadding).expanded();

  Widget _renderName(BuildContext context) => TextFormField(
        validator: (String? name) => name != null && name.isEmpty
            ? 'The asset name cannot be empty'
            : null,
        onChanged: (String value) => setState(() {
          name = value;
        }),
        decoration: const InputDecoration(
          labelText: 'Asset name',
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: kGrayColor),
          ),
        ),
      ).padding(bottom: kDefaultPadding).expanded();

  Widget _renderType(BuildContext context) => DropdownButtonFormField<String>(
        value: dropdownAssetValue,
        icon: LineIcon.arrowCircleDown(),
        iconSize: 24,
        elevation: 16,
        decoration: const InputDecoration(
          labelText: 'Category name',
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: kGrayColor),
          ),
        ),
        style: Theme.of(context).textTheme.bodyText2,
        onChanged: (String? value) {
          setState(() {
            dropdownAssetValue = value!;
          });
        },
        items: itemListAsset
            .map((AssetType e) => e.typeName)
            .toList()
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      )
          .height(51)
          .padding(bottom: kDefaultPadding, right: kDefaultPadding)
          .expanded();
  Widget _renderCondition(BuildContext context) =>
      DropdownButtonFormField<String>(
        value: dropdownConditionValue,
        icon: LineIcon.arrowCircleDown(),
        iconSize: 24,
        elevation: 16,
        decoration: const InputDecoration(
          labelText: 'Condition',
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: kGrayColor),
          ),
        ),
        style: Theme.of(context).textTheme.bodyText2,
        onChanged: (String? value) {
          setState(() {
            dropdownConditionValue = value!;
          });
        },
        items: listCondition.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      )
          .height(51)
          .padding(bottom: kDefaultPadding, right: kDefaultPadding)
          .expanded();

  Widget _renderManufacture(BuildContext context) => TextFormField(
        onChanged: (String value) => setState(() {
          manufacture = value;
        }),
        decoration: const InputDecoration(
          labelText: 'Manufacture',
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: kGrayColor),
          ),
        ),
      ).padding(bottom: kDefaultPadding).expanded();

  Widget _renderPrice(BuildContext context) => TextFormField(
        onChanged: (String value) => setState(() {
          price = double.parse(value);
        }),
        decoration: const InputDecoration(
          labelText: 'Price',
          suffix: Text('VNĐ'),
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: kGrayColor),
          ),
        ),
      ).padding(bottom: kDefaultPadding).expanded();

  Widget _renderIsAssigned(BuildContext context) => Checkbox(
        checkColor: Colors.white,
        value: isAssigned,
        onChanged: (bool? value) {
          setState(() {
            isAssigned = value!;
          });
        },
      ).padding(right: kDefaultPadding);

  Widget _renderUserAssigned(BuildContext context) => DropdownSearch<String>(
        dropDownButton: RotatedBox(
          quarterTurns: -1,
          child: LineIcon.search(),
        ),
        mode: Mode.MENU,
        showSearchBox: true,
        showSelectedItem: true,
        items: itemListUser.map((User e) => e.fullName).toList(),
        label: 'User assigned',
        onChanged: (String? value) {
          setState(() {
            dropdownUserValue = value!;
          });
        },
        selectedItem: dropdownUserValue,
      ).expanded();

  Widget _renderImage(BuildContext context) => Container(
        child: image.isEmpty
            ? LineIcon.plus()
            : Image.file(
                File(image),
              ),
      ).border(all: 1).gestures(
        onTap: () async {
          final XTypeGroup typeGroup =
              XTypeGroup(label: 'images', extensions: <String>['jpg', 'png']);
          final XFile? file =
              await openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);

          if (file != null) {
            final Directory tmp = await getApplicationDocumentsDirectory();
            final String path = p.join(tmp.path, 'lsv_ams', 'images');
            await Directory(path).create(recursive: true);
            final Uint8List bdata = await file.readAsBytes();
            final File img = File(
              p.join(path, '${DateTime.now().microsecondsSinceEpoch}.png'),
            );
            await img.create();
            await img.writeAsBytes(bdata);
            setState(() {
              image = img.path;
            });
          }
        },
      );

  void _showTopFlash({FlashBehavior style = FlashBehavior.floating}) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 3),
      persistent: true,
      builder: (_, FlashController<Object?> controller) {
        return Flash<dynamic>(
          controller: controller,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          barrierBlur: 3.0,
          barrierColor: Colors.black38,
          barrierDismissible: true,
          behavior: style,
          position: FlashPosition.top,
          child: FlashBar(
            title: const Text(
              'Notification',
              style: TextStyle(color: kBadgeColor, fontSize: 18),
            ),
            content: const Text('Create new user successfully (　´･‿･｀ )'),
            showProgressIndicator: true,
            primaryAction: TextButton(
              onPressed: () => controller.dismiss(),
              child:
                  const Text('DISMISS', style: TextStyle(color: Colors.amber)),
            ),
          ),
        );
      },
    );
  }
}

enum Gender { MALE, FEMALE, OTHER }
