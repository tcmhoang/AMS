import 'dart:io';
import 'dart:typed_data';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../config/constansts.dart';
import '../config/responsive.dart';
import '../domains/user_repository/src/user_model.dart';

class UserCreation extends StatefulWidget {
  const UserCreation({Key? key, this.data}) : super(key: key);

  @override
  UserCreationState createState() => UserCreationState();
  final User? data;
}

class UserCreationState extends State<UserCreation> {
  static final DateFormat _kDateFormatter = DateFormat('MM-dd-yyyy');
  static final DateTime validDate =
      DateTime.now().subtract(const Duration(days: 365 * 18));

  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _addrController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  User? _data;
  String _avatar = '';
  Gender _gender = Gender.MALE;

  @override
  Widget build(BuildContext context) {
    _bindVals();
    return Form(
      key: _formKey,
      child: <Widget>[
        if (Responsive.isMobile(context))
          Text(
            'Create a new user',
            style: Theme.of(context).textTheme.headline5,
          ).alignment(Alignment.centerLeft),
        _renderAvatar(context),
        _renderFullName(context),
        _renderDob(context),
        _renderGender(context),
        _renderAddress(context),
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
    );
  }

  void _bindVals() {
    if (widget.data != _data) {
      _data = widget.data;
      if (_data != null) {
        final User tmp = widget.data!;
        _fnameController.text = tmp.fullName;
        _dobController.text = _kDateFormatter
            .format(DateTime.fromMillisecondsSinceEpoch(tmp.dob));
        _addrController.text = tmp.address;
        _avatar = tmp.urlImage;
        _gender = tmp.gender == 0 ? Gender.MALE : Gender.FEMALE;
      } else {
        _fnameController.text = '';
        _dobController.text = '';
        _addrController.text = '';
        _avatar = '';
        _gender = Gender.MALE;
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
          print(_kDateFormatter.parse(_dobController.text));
          // if (_data == null)
          //   await create(
          //     User(
          //       1,
          //       _fnameController.text,
          //       _kDateFormatter
          //           .parse(_dobController.text)
          //           .millisecondsSinceEpoch,
          //       _gender.index,
          //       _addrController.text,
          //       _avatar,
          //     ),
          //   );
          // else
          //   await update(
          //     _data!.userId,
          //     _data!.copyWith(
          //       fullName: _fnameController.text,
          //       dob: _kDateFormatter
          //           .parse(_dobController.text)
          //           .millisecondsSinceEpoch,
          //       address: _addrController.text,
          //     ),
          //   );
        }
        _showTopFlash();
      },
      icon: LineIcon.save(),
      label: Text(_data == null ? 'SAVE' : 'UPDATE'),
    );
  }

  Widget _renderFullName(BuildContext context) => TextFormField(
        controller: _fnameController,
        validator: (String? fullName) => fullName != null && fullName.isEmpty
            ? 'The fullname cannot be empty'
            : null,
        decoration: const InputDecoration(
          labelText: 'Full Name',
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: kGrayColor),
          ),
        ),
      ).padding(vertical: kDefaultPadding);

  Widget _renderDob(BuildContext context) => DateTimeField(
        controller: _dobController,
        format: DateFormat('MM-dd-yyyy'),
        onShowPicker: (BuildContext context, DateTime? currentValue) {
          return showDatePicker(
            context: context,
            initialDate: currentValue ?? validDate,
            firstDate: DateTime(1975),
            lastDate: validDate,
          );
        },
        decoration: const InputDecoration(
          labelText: 'Date Of Birth ',
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: kGrayColor),
          ),
        ),
      ).padding(vertical: kDefaultPadding);

  Widget _renderGender(BuildContext context) => <Widget>[
        const Text(
          'Gender:',
          style: TextStyle(fontSize: 18, color: kTextColor),
        ).expanded(),
        ListTile(
          title: const Text('Male'),
          leading: Radio<Gender>(
            value: Gender.MALE,
            groupValue: _gender,
            onChanged: (Gender? value) {
              setState(() {
                _gender = value!;
              });
            },
          ),
        ).expanded(),
        ListTile(
          title: const Text('Female'),
          leading: Radio<Gender>(
            value: Gender.FEMALE,
            groupValue: _gender,
            onChanged: (Gender? value) {
              setState(() {
                _gender = value!;
              });
            },
          ),
        ).expanded(),
      ].toRow(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
      );

  Widget _renderAddress(BuildContext context) => TextFormField(
        controller: _addrController,
        validator: (String? address) => address != null && address.isEmpty
            ? 'The address cannot be empty'
            : null,
        decoration: const InputDecoration(
          labelText: 'Address',
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: kGrayColor),
          ),
        ),
      ).padding(vertical: kDefaultPadding);

  Widget _renderAvatar(BuildContext context) => CircleAvatar(
        radius: 70,
        foregroundImage: _avatar.isEmpty ? null : FileImage(File(_avatar)),
        backgroundColor: Colors.blueGrey,
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
              _avatar = img.path;
            });
          }
        },
      ).alignment(FractionalOffset.center);

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

enum Gender { MALE, FEMALE }
