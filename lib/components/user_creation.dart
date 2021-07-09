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
import 'package:lsv_ams/config/constansts.dart';
import 'package:lsv_ams/config/responsive.dart';
import 'package:lsv_ams/domains/user_repository/src/user_model.dart';
import 'package:lsv_ams/domains/user_repository/user_repository.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:styled_widget/styled_widget.dart';

class UserCreation extends StatefulWidget {
  @override
  UserCreationState createState() => UserCreationState();
}

class UserCreationState extends State<UserCreation> {
  late String fullName;
  late DateTime currentValue;
  late String address;
  Gender _character = Gender.MALE;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String avatar = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
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
        if (formKey.currentState!.validate()) {
          await create(
            User(
              1,
              fullName,
              currentValue.millisecondsSinceEpoch,
              _character.index,
              address,
              avatar,
            ),
          );
        }
        _showTopFlash();
      },
      icon: LineIcon.save(),
      label: const Text('SAVE'),
    );
  }

  Widget _renderFullName(BuildContext context) => TextFormField(
        validator: (String? fullName) => fullName != null && fullName.isEmpty
            ? 'The fullname cannot be empty'
            : null,
        onChanged: (String value) => setState(() {
          fullName = value;
        }),
        decoration: const InputDecoration(
          labelText: 'Full Name',
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: kGrayColor),
          ),
        ),
      ).padding(vertical: kDefaultPadding);

  Widget _renderDob(BuildContext context) => DateTimeField(
        format: DateFormat('yyyy-MM-dd'),
        onChanged: (DateTime? value) {
          currentValue = value!;
        },
        onShowPicker: (BuildContext context, DateTime? currentValue) {
          return showDatePicker(
            context: context,
            initialDate: currentValue ?? DateTime.now(),
            firstDate: DateTime(1975),
            lastDate: DateTime(2100),
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
            groupValue: _character,
            onChanged: (Gender? value) {
              setState(() {
                _character = value!;
              });
            },
          ),
        ).expanded(),
        ListTile(
          title: const Text('Female'),
          leading: Radio<Gender>(
            value: Gender.FEMALE,
            groupValue: _character,
            onChanged: (Gender? value) {
              setState(() {
                _character = value!;
              });
            },
          ),
        ).expanded(),
        ListTile(
          title: const Text('Other'),
          leading: Radio<Gender>(
            value: Gender.OTHER,
            groupValue: _character,
            onChanged: (Gender? value) {
              setState(() {
                _character = value!;
              });
            },
          ),
        ).expanded(),
      ].toRow(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
      );

  Widget _renderAddress(BuildContext context) => TextFormField(
        validator: (String? address) => address != null && address.isEmpty
            ? 'The address cannot be empty'
            : null,
        onChanged: (String value) => setState(() {
          address = value;
        }),
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
        foregroundImage: avatar.isEmpty ? null : FileImage(File(avatar)),
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
              avatar = img.path;
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

enum Gender { MALE, FEMALE, OTHER }
