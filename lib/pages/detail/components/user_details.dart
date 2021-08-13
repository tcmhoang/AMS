import 'dart:io';

import 'package:animations/animations.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../components/flash.dart';
import '../../../components/form_utils.dart';
import '../../../config/constants.dart';
import '../../../config/responsive.dart';
import '../../../domains/user_repository/src/user_model.dart';
import '../../../domains/user_repository/user_repository.dart';
import '../../../providers/main_screen_provider.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key, this.data}) : super(key: key);

  @override
  UserDetailsState createState() => UserDetailsState();
  final User? data;
}

class UserDetailsState extends State<UserDetails> {
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
        if (Responsive.isMobile(context) && _data == null)
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
        _dobController.text =
            dateFormatter.format(DateTime.fromMillisecondsSinceEpoch(tmp.dob));
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
          await _saveData();
          Provider.of<MainScreenProvider>(context, listen: false).listData =
              fetchAll();
          showTopFlash(
            context,
            'Update Status',
            'Your modifications have been saved',
          );
        } else {
          showTopFlash(
            context,
            'Update Status',
            'An errror occurred. Please try again!',
            isError: true,
          );
        }
      },
      icon: LineIcon.save(),
      label: Text(_data == null ? 'SAVE' : 'UPDATE'),
    );
  }

  Future<void> _saveData() async {
    if (_data == null) {
      _avatar = await saveImage(_avatar, 'avatar');
      await create(
        User(
          1,
          _fnameController.text,
          dateFormatter.parse(_dobController.text).millisecondsSinceEpoch,
          _gender.index,
          _addrController.text,
          _avatar,
        ),
      );
    } else {
      await update(
        _data!.id,
        _data!.copyWith(
          fullName: _fnameController.text,
          dob: dateFormatter.parse(_dobController.text).millisecondsSinceEpoch,
          address: _addrController.text,
          gender: _gender.index,
        ),
      );
    }
  }

  Widget _renderFullName(BuildContext context) =>
      renderDefaultFieldForm(_fnameController, 'full name');

  Widget _renderDob(BuildContext context) => DateTimeField(
        controller: _dobController,
        format: DateFormat('MM-dd-yyyy'),
        onShowPicker: (BuildContext context, DateTime? currentValue) {
          return showModal(
            context: context,
            builder: (BuildContext context) => DatePickerDialog(
              initialDate: currentValue ?? validDate,
              firstDate: DateTime(1975),
              lastDate: validDate,
            ).backgroundBlur(7.0),
            configuration: FadeScaleTransitionConfiguration(
              barrierColor: Colors.black.withAlpha(80),
              barrierDismissible: false,
              reverseTransitionDuration: kDefaultDuration,
              transitionDuration: kDefaultDuration,
            ),
          );
        },
        decoration: getDefaultInputDecoration(title: 'Date Of Birth '),
      ).padding(vertical: kDefaultPadding, right: kDefaultPadding);

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
            onChanged: _onClickGender,
          ),
        ).expanded(),
        ListTile(
          title: const Text('Female'),
          leading: Radio<Gender>(
            value: Gender.FEMALE,
            groupValue: _gender,
            onChanged: _onClickGender,
          ),
        ).expanded(),
      ]
          .toRow(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
          )
          .padding(bottom: kDefaultPadding);

  void _onClickGender(Gender? value) {
    setState(() {
      _gender = value!;
    });
  }

  Widget _renderAddress(BuildContext context) =>
      renderDefaultFieldForm(_addrController, 'address');

  Widget _renderAvatar(BuildContext context) => CircleAvatar(
        radius: 70,
        foregroundImage: _avatar.isEmpty || !File(_avatar).existsSync()
            ? null
            : FileImage(File(_avatar)),
        backgroundColor: kBgLightColor,
      )
          .elevation(
            11,
            borderRadius: BorderRadius.circular(70),
            shadowColor: kBgDarkColor,
          )
          .gestures(
            onTap: () async {
              final XFile? file =
                  await openFile(acceptedTypeGroups: <XTypeGroup>[imgGrp]);

              if (file != null) {
                setState(() {
                  _avatar = file.path;
                });
              }
            },
          )
          .alignment(FractionalOffset.center)
          .padding(bottom: kDefaultPadding);
}

enum Gender { MALE, FEMALE }
