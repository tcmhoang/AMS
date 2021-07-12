import 'dart:io';
import 'dart:typed_data';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icon.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../config/constansts.dart';
import '../domains/asset_repository/asset_repository.dart';
import '../domains/asset_repository/src/asset_model.dart';
import '../domains/asset_type_repository/asset_type_repository.dart' as at;
import '../domains/asset_type_repository/src/asset_type_model.dart';
import '../domains/user_repository/src/user_model.dart';
import '../domains/user_repository/user_repository.dart' as us;

class AssetCreation extends StatefulWidget {
  const AssetCreation({this.data});
  final Asset? data;

  @override
  AssetCreationState createState() => AssetCreationState();
}

class AssetCreationState extends State<AssetCreation> {
  Future<List<AssetType>> listAsset = at.fetchAll();
  Future<List<User>> listUser = us.fetchAll();
  final List<String> listCondition = <String>['New', 'Used', 'Broken'];
  TextEditingController fTagController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController fManufactureController = TextEditingController();
  TextEditingController fPriceController = TextEditingController();
  late bool isAssigned = false;
  late int selectedAsset = 0;
  late int selectedUser = 0;
  TextEditingController fConditionController = TextEditingController();
  TextEditingController fTypeController = TextEditingController();
  TextEditingController fUserController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String image = '';
  List<AssetType> itemListAsset = <AssetType>[];
  List<User> itemListUser = <User>[];
  Asset? data;

  @override
  void initState() {
    super.initState();
    listAsset.then((List<AssetType> value) {
      itemListAsset = value;
      setState(() {
        fTypeController.text = itemListAsset[0].typeName;
        print(fTypeController.value);
      });
    });
    listUser.then((List<User> value) {
      itemListUser = value;
      setState(() {
        fUserController.text = itemListUser[0].fullName;
      });
    });

    fTagController.text = '';
    fNameController.text = '';
    fManufactureController.text = '';
    fConditionController.text = 'New';
    fPriceController.text = '';
    // selectedAsset = 1;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data != data) {
      data = widget.data;
      if (widget.data != null) {
        final Asset tmp = widget.data!;
        fTagController.text = tmp.tag;
        fNameController.text = tmp.name;
        fManufactureController.text = tmp.make;
        fPriceController.text = tmp.originalPrice.toString();
        fConditionController.text = tmp.condition;
        fTypeController.text = tmp.typeId.toString();
      } else {
        fTagController.text = '';
        fNameController.text = '';
        fManufactureController.text = '';
        fConditionController.text = 'New';
        fPriceController.text = '';
        fTypeController.text = '';
      }
    }
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
          if (element.typeName == fTypeController.text) {
            selectedAsset = element.typeId;
          }
        }
        for (final User element in itemListUser) {
          if (element.fullName == fUserController.text) {
            selectedUser = element.userId;
          }
        }
        if (formKey.currentState!.validate()) {
          await create(
            Asset(
              fTagController.text,
              fNameController.text,
              selectedAsset,
              selectedUser,
              fManufactureController.text,
              DateTime.now().microsecondsSinceEpoch,
              DateTime.now().microsecondsSinceEpoch,
              fConditionController.text,
              image,
              2,
              double.parse(fPriceController.text),
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
        controller: fTagController,
        validator: (String? tag) =>
            tag != null && tag.isEmpty ? 'The tag cannot be empty' : null,
        decoration: const InputDecoration(
          labelText: 'Tag',
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: kGrayColor),
          ),
        ),
      ).padding(bottom: kDefaultPadding, right: kDefaultPadding).expanded();

  Widget _renderName(BuildContext context) => TextFormField(
        controller: fNameController,
        validator: (String? name) => name != null && name.isEmpty
            ? 'The asset name cannot be empty'
            : null,
        decoration: const InputDecoration(
          labelText: 'Asset name',
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: kGrayColor),
          ),
        ),
      ).padding(bottom: kDefaultPadding).expanded();

  Widget _renderType(BuildContext context) {
    // print(data!.typeId);
    return DropdownButtonFormField<int>(
      value: data == null || data!.typeId == 0 ? null : data!.typeId,
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
      onChanged: (int? id) => selectedAsset = id!,
      items: itemListAsset.map<DropdownMenuItem<int>>((AssetType as) {
        return DropdownMenuItem<int>(
          value: as.typeId,
          child: Text(as.typeName),
        );
      }).toList(),
    )
        .height(51)
        .padding(bottom: kDefaultPadding, right: kDefaultPadding)
        .expanded();
  }

  Widget _renderCondition(BuildContext context) =>
      DropdownButtonFormField<String>(
        value: fConditionController.text,
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
            fConditionController.text = value!;
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
        controller: fManufactureController,
        decoration: const InputDecoration(
          labelText: 'Manufacture',
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: kGrayColor),
          ),
        ),
      ).padding(bottom: kDefaultPadding).expanded();

  Widget _renderPrice(BuildContext context) => TextFormField(
        controller: fPriceController,
        validator: (String? price) => price != null && price.isEmpty
            ? 'The asset name cannot be empty'
            : null,
        // ignore: always_specify_types
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
            fUserController.text = value!;
          });
        },
        selectedItem: fUserController.text,
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
