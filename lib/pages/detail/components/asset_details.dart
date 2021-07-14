import 'dart:io';
import 'dart:typed_data';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:lsv_ams/config/responsive.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../components/flash.dart';
import '../../../config/constansts.dart';
import '../../../config/currency_formatter.dart';
import '../../../domains/asset_repository/asset_repository.dart' as assets;
import '../../../domains/asset_repository/src/asset_model.dart';
import '../../../domains/asset_type_repository/asset_type_repository.dart'
    as asset_types;
import '../../../domains/asset_type_repository/src/asset_type_model.dart';
import '../../../domains/user_repository/src/user_model.dart';
import '../../../domains/user_repository/user_repository.dart' as users;

class AssetDetails extends StatefulWidget {
  const AssetDetails({this.data});
  final Asset? data;

  @override
  AssetDetailsState createState() => AssetDetailsState();
}

class AssetDetailsState extends State<AssetDetails> {
  static const List<String> _kConditions = <String>['New', 'Used', 'Broken'];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _tagController = TextEditingController();
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _manufacturerController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _conditionController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _userController = TextEditingController();

  bool _isAssigned = false;
  int _selectedCategoryId = 0;
  int _assignedUserId = 0;

  String _image = '';

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
          const Text('Is Assigned:').padding(all: kDefaultPadding),
          _renderIsAssigned(context),
          if (_isAssigned == true) _renderUserAssigned(context),
        ].toRow(),
        _renderImage(context).padding(all: kDefaultPadding),
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

  void _bindVals() {
    if (widget.data != _data) {
      _data = widget.data;
      if (widget.data != null) {
        final Asset tmp = widget.data!;
        _tagController.text = tmp.tag;
        _fNameController.text = tmp.name;
        _manufacturerController.text = tmp.make;
        _priceController.text =
            CurrencyFormatter.formatter.format(tmp.originalPrice);
        _conditionController.text = tmp.condition;
        _typeController.text = tmp.typeId.toString();
        _selectedCategoryId = tmp.typeId;
        _isAssigned = tmp.isAssigned != 0;
        _assignedUserId = tmp.userId;
      } else {
        _tagController.text = '';
        _fNameController.text = '';
        _manufacturerController.text = '';
        _conditionController.text = 'New';
        _priceController.text = '';
        _typeController.text = '';
        _selectedCategoryId = 0;
        _isAssigned = false;
        _assignedUserId = 0;
      }
    }
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
        if (_formKey.currentState!.validate()) {
          await assets.create(
            Asset(
              _tagController.text,
              _fNameController.text,
              _selectedCategoryId,
              _isAssigned == true ? _assignedUserId : 0,
              _manufacturerController.text,
              DateTime.now().microsecondsSinceEpoch,
              DateTime.now().microsecondsSinceEpoch,
              _conditionController.text,
              _image,
              1,
              CurrencyFormatter.getValue(_priceController.text),
              _isAssigned == true ? 1 : 0,
            ),
          );
        }
        showTopFlash(
          context,
          'Update Status',
          'Your modifications have been saved',
        );
      },
      icon: LineIcon.save(),
      label: const Text('SAVE'),
    );
  }

  Widget _renderTag(BuildContext context) => TextFormField(
        controller: _tagController,
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
        controller: _fNameController,
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
    return FutureBuilder<List<AssetType>>(
      future: asset_types.fetchAll(),
      builder: (_, AsyncSnapshot<List<AssetType>> snapshot) {
        if (snapshot.hasData) {
          final List<AssetType> data = snapshot.data!;
          return DropdownButtonFormField<int>(
            value: _data == null || _data!.typeId == 0 ? null : _data!.typeId,
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
            onChanged: (int? id) => _selectedCategoryId = id!,
            items: data
                .map<DropdownMenuItem<int>>(
                  (AssetType as) => DropdownMenuItem<int>(
                    value: as.typeId,
                    child: Text(as.typeName),
                  ),
                )
                .toList(),
          )
              .height(51)
              .padding(bottom: kDefaultPadding, right: kDefaultPadding)
              .expanded();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget _renderCondition(BuildContext context) =>
      DropdownButtonFormField<String>(
        value: _conditionController.text.isEmpty
            ? null
            : _conditionController.text,
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
            _conditionController.text = value!;
          });
        },
        items: _kConditions.map<DropdownMenuItem<String>>((String value) {
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
        controller: _manufacturerController,
        decoration: const InputDecoration(
          labelText: 'Manufacture',
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: kGrayColor),
          ),
        ),
      ).padding(bottom: kDefaultPadding).expanded();

  Widget _renderPrice(BuildContext context) => TextFormField(
        controller: _priceController,
        validator: (String? price) => price != null && price.isEmpty
            ? 'The asset name cannot be empty'
            : null,
        inputFormatters: <TextInputFormatter>[CurrencyFormatter()],
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
                child: LineIcon.search(),
              ),
              mode: Mode.MENU,
              showSearchBox: true,
              showSelectedItem: true,
              dropdownSearchDecoration: const InputDecoration(
                labelText: 'Category name',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: kGrayColor),
                ),
                contentPadding: EdgeInsets.all(10),
              ),
              items:
                  data.map((User e) => '${e.userId}    ${e.fullName}').toList(),
              label: 'User assigned',
              onChanged: (String? value) {
                setState(() {
                  _userController.text = value!;
                  _assignedUserId =
                      int.parse(_userController.text.split(RegExp(r'\s+'))[0]);
                });
              },
              selectedItem: _assignedUserId == 0
                  ? null
                  : '$_assignedUserId    ${data.firstWhere((User element) => element.userId == _assignedUserId).fullName}',
            ).expanded();
          } else
            return const CircularProgressIndicator();
        },
      );

  Widget _renderImage(BuildContext context) => Container(
        child: _image.isEmpty
            ? <Widget>[
                LineIcon.plusCircle(
                  size: 24,
                  color: kPrimaryColor,
                ),
                Text(
                  'Add an image',
                  style: GoogleFonts.poppins(),
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
              _image = img.path;
            });
          }
        },
      );
}
