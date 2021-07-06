import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:lsv_ams/config/constansts.dart';
import 'package:styled_widget/styled_widget.dart';

class UserCreationModal extends StatefulWidget {
  @override
  UserCreationModalState createState() => UserCreationModalState();
}

class UserCreationModalState extends State<UserCreationModal> {
  late String fullName;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late Gender _radio = Gender.MALE;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: <Widget>[
        Text(
          'Full Name',
          style: Theme.of(context).textTheme.headline6,
        ),
        _renderFullName(context),
        Text(
          'Date of birth',
          style: Theme.of(context).textTheme.headline6,
        ),
        _renderDob(context),
        Text(
          'Gender',
          style: Theme.of(context).textTheme.headline6,
        ),
        _renderGerder(context),
        Text(
          'Address',
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          'Avatar',
          style: Theme.of(context).textTheme.headline6,
        ),
        _renderAddUserBtn(context),
      ]
          .toColumn(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .padding(all: 6)
          .width(double.infinity),
    );
  }

  Widget _renderAddUserBtn(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 40),
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
          // ignore: flutter_style_todos
          //TODO(mytv): Update list of cat
          // final MainScreenProvider val =
          //     Provider.of<MainScreenProvider>(ctx, listen: false);

          Navigator.pop(context);
        }
      },
      icon: LineIcon.plus(),
      label: const Text('ADD USER'),
    );
  }

  Widget _renderFullName(BuildContext context) => TextFormField(
        validator: (String? fullName) => fullName != null && fullName.isNotEmpty
            ? 'The fullname cannot be empty'
            : null,
        onChanged: (String value) => setState(() {
          fullName = value;
        }),
      ).padding(bottom: kDefaultPadding);

  Widget _renderDob(BuildContext context) => DateTimeField(
        format: DateFormat('yyyy-MM-dd'),
        onShowPicker: (BuildContext context, DateTime? currentValue) {
          return showDatePicker(
            context: context,
            initialDate: currentValue ?? DateTime.now(),
            firstDate: DateTime(1975),
            lastDate: DateTime(2100),
          );
        },
      );

  Widget _renderGerder(BuildContext context) => <Widget>[
        ListTile(
          title: const Text('Male'),
          leading: Radio<Gender>(
            value: Gender.MALE,
            groupValue: _radio,
            onChanged: (Gender? value) {
              setState(() {
                _radio = value!;
              });
            },
          ),
        )
      ].toRow();
}

enum Gender { MALE, FEMALE }
