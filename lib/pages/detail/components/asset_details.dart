import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icon.dart';
import 'package:lsv_ams/domains/user_repository/src/user_model.dart';
import 'package:lsv_ams/domains/user_repository/user_repository.dart' as users;
import 'package:lsv_ams/providers/main_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../components/flash.dart';
import '../../../components/form_utils.dart';
import '../../../config/constants.dart';
import '../../../config/currency_formatter.dart';
import '../../../config/responsive.dart';
import '../../../domains/asset_repository/asset_repository.dart' as assets;
import '../../../domains/asset_repository/src/asset_model.dart';
import '../../../domains/asset_type_repository/asset_type_repository.dart'
    as asset_types;
import '../../../domains/asset_type_repository/src/asset_type_model.dart';

class AssetDetails extends StatefulWidget {
  const AssetDetails({this.data});
  final Asset? data;

  @override
  AssetDetailsState createState() => AssetDetailsState();
}

class AssetDetailsState extends State<AssetDetails> {
  static const List<String> _kConditions = <String>[
    'New',
    'Using',
    'Broken',
    'Fixing',
    'Sold'
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _tagController = TextEditingController();
  final TextEditingController _assetNameController = TextEditingController();
  final TextEditingController _manufacturerController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _conditionController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _userController = TextEditingController();

  bool _isAssigned = false;
  int _assignedUserId = 0;

  String _image = '';
  String _selectedCategoryName = '';

  Asset? _data;

  @override
  Widget build(BuildContext context) {
    _bindVals();
    return Form(
      key: _formKey,
      child: <Widget>[
        if (Responsive.isMobile(context) && _data == null)
          Text(
            'Create a new asset',
            style: Theme.of(context).textTheme.headline5,
          ).alignment(Alignment.centerLeft),
        <Widget>[
          _renderTag(context),
          _renderAssetName(context),
        ].toRow(),
        <Widget>[
          _renderCategory(context),
          _renderManufacture(context),
        ].toRow(),
        <Widget>[
          _renderCondition(context),
          _renderPrice(context),
        ].toRow(),
        <Widget>[
          const Text('Is Assigned:').padding(all: kDefaultPadding),
          _renderIsAssigned(context),
          if (_isAssigned == true) _renderUserAssigned(context),
        ].toRow(),
        _renderImage(context).padding(all: kDefaultPadding),
        _renderSaveBtn(context),
      ]
          .toColumn(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
          )
          .padding(all: 6)
          .width(double.infinity),
    ).padding(all: 25);
  }

  void _bindVals() {
    if (widget.data != _data) {
      _data = widget.data;
      if (widget.data != null) {
        final Asset tmp = widget.data!;
        _tagController.text = tmp.tag;
        _assetNameController.text = tmp.name;
        _manufacturerController.text = tmp.make;
        _priceController.text =
            CurrencyFormatter.formatter.format(tmp.originalPrice);
        _conditionController.text = tmp.condition;
        _typeController.text = tmp.typeName;
        _selectedCategoryName = tmp.typeName;
        _isAssigned = tmp.isAssigned != 0;
        _assignedUserId = tmp.userId;
        _image = tmp.urlImage;
      } else {
        _tagController.text = '';
        _assetNameController.text = '';
        _manufacturerController.text = '';
        _conditionController.text = 'New';
        _priceController.text = '';
        _typeController.text = '';
        _selectedCategoryName = '';
        _isAssigned = false;
        _assignedUserId = 0;
        _image = '';
      }
    }
  }

  Widget _renderSaveBtn(BuildContext context) {
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
        if (_formKey.currentState!.validate()) {
          await _saveData();
          Provider.of<MainScreenProvider>(context, listen: false).listData =
              assets.fetchAll();
          showTopFlash(
            context,
            'Update Status',
            'Your modifications have been saved',
          );
        } else {
          showTopFlash(
            context,
            'Update Status',
            'An error occurred. Please try again!',
            isError: true,
          );
        }
      },
      icon: LineIcon.save(),
      label: const Text('SAVE'),
    );
  }

  Future<void> _saveData() async {
    if (_data == null) {
      _image = await saveImage(_image, 'ast');
      await assets.create(
        Asset(
          _tagController.text,
          _assetNameController.text,
          _manufacturerController.text,
          DateTime.now().millisecondsSinceEpoch,
          DateTime.now().millisecondsSinceEpoch,
          _conditionController.text,
          _image,
          CurrencyFormatter.getValue(_priceController.text),
          _isAssigned ? 1 : 0,
          _selectedCategoryName,
          _assignedUserId,
        ),
      );
    } else {
      await assets.update(
        _data!.tag,
        _data!.copyWith(
          name: _assetNameController.text,
          condition: _conditionController.text,
          lastUpdated: DateTime.now().millisecondsSinceEpoch,
          isAssigned: _isAssigned ? 1 : 0,
          typeName: _selectedCategoryName,
          make: _manufacturerController.text,
          originalPrice: CurrencyFormatter.getValue(_priceController.text),
          userId: _isAssigned == true ? _assignedUserId : 0,
        ),
      );
    }
  }

  Widget _renderTag(BuildContext context) =>
      renderDefaultFieldForm(_tagController, 'tag', enable: _data == null)
          .expanded();

  Widget _renderAssetName(BuildContext context) =>
      renderDefaultFieldForm(_assetNameController, 'asset name').expanded();

  Widget _renderCategory(BuildContext context) {
    return FutureBuilder<List<AssetType>>(
      future: asset_types.fetchAll(),
      builder: (_, AsyncSnapshot<List<AssetType>> snapshot) {
        if (snapshot.hasData) {
          final List<AssetType> data = snapshot.data!;
          return DropdownButtonFormField<String>(
            value: _data?.typeName,
            icon: LineIcon.arrowCircleDown(
              size: 24,
              color: kGrayColor,
            ),
            iconSize: 24,
            elevation: 16,
            decoration: getDefaultInputDecoration(title: 'Category name'),
            style: Theme.of(context).textTheme.bodyText2,
            onChanged: (String? id) => _selectedCategoryName = id!,
            items: data
                .map<DropdownMenuItem<String>>(
                  (AssetType as) => DropdownMenuItem<String>(
                    value: as.typeName,
                    child: Text(as.typeName),
                  ),
                )
                .toList(),
          )
              .padding(
                bottom: kDefaultPadding,
                right: kDefaultPadding,
              )
              .expanded();
        } else {
          return const CircularProgressIndicator().center().expanded();
        }
      },
    );
  }

  Widget _renderCondition(BuildContext context) =>
      DropdownButtonFormField<String>(
        value: _conditionController.text.isEmpty
            ? null
            : _conditionController.text,
        icon: LineIcon.arrowCircleDown(
          size: 24,
          color: kGrayColor,
        ),
        iconSize: 24,
        elevation: 16,
        decoration: getDefaultInputDecoration(title: 'Condition'),
        style: Theme.of(context).textTheme.bodyText2,
        onChanged: (String? value) => _conditionController.text = value!,
        items: _kConditions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ).padding(bottom: kDefaultPadding, right: kDefaultPadding).expanded();

  Widget _renderManufacture(BuildContext context) =>
      renderDefaultFieldForm(_manufacturerController, 'manufacture').expanded();

  Widget _renderPrice(BuildContext context) => TextFormField(
        controller: _priceController,
        validator: (String? price) => price != null && price.isEmpty
            ? 'The asset name cannot be empty'
            : null,
        inputFormatters: <TextInputFormatter>[CurrencyFormatter()],
        decoration: getDefaultInputDecoration(
          title: 'Price',
          suffix: const Text('VND'),
        ),
      ).padding(bottom: kDefaultPadding, right: kDefaultPadding).expanded();

  Widget _renderIsAssigned(BuildContext context) => Checkbox(
        checkColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
        value: _isAssigned,
        onChanged: (bool? value) {
          setState(() {
            _isAssigned = value!;
          });
        },
      ).padding(right: kDefaultPadding);

  Widget _renderUserAssigned(BuildContext context) => FutureBuilder<List<User>>(
        future: users.fetchAll(),
        builder: (_, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            final List<User> data = snapshot.data!;
            return DropdownSearch<String>(
              dropDownButton: RotatedBox(
                quarterTurns: -1,
                child: LineIcon.search(
                  size: 24,
                  color: kGrayColor,
                ),
              ),
              mode: Mode.MENU,
              showSearchBox: true,
              showSelectedItems: true,
              dropdownSearchDecoration:
                  getDefaultInputDecoration(title: 'Category name'),
              items: data.map((User e) => '${e.id}    ${e.fullName}').toList(),
              label: 'User assigned',
              onChanged: (String? value) {
                _userController.text = value!;
                _assignedUserId =
                    int.parse(_userController.text.split(RegExp(r'\s+'))[0]);
              },
              selectedItem: _assignedUserId == 0
                  ? null
                  : '$_assignedUserId    ${data.firstWhere((User element) => element.id == _assignedUserId).fullName}',
            ).expanded();
          } else
            return const CircularProgressIndicator().center().expanded();
        },
      );

  Widget _renderImage(BuildContext context) => Container(
        child: _image.isEmpty || !File(_image).existsSync()
            ? <Widget>[
                LineIcon.plusCircle(
                  size: 24,
                  color: kPrimaryColor,
                ),
                const Text(
                  'Add an image',
                ).padding(horizontal: kDefaultPadding)
              ]
                .toRow(mainAxisSize: MainAxisSize.min)
                .alignment(Alignment.centerLeft)
            : Image.file(
                File(_image),
              ).clipRRect(all: 20).constrained(
                  maxHeight: kMinScreenSize,
                  maxWidth: kMinScreenSize,
                ),
      ).gestures(
        onTap: () async {
          final XFile? file =
              await openFile(acceptedTypeGroups: <XTypeGroup>[imgGrp]);
          if (file != null) {
            setState(() => _image = file.path);
          }
        },
      );
}
