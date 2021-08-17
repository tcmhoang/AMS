import 'dart:io';

import 'package:animations/animations.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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

class UserDetails extends StatelessWidget {
  UserDetails({Key? key, this.data}) : super(key: key);

  static final DateTime validDate =
      DateTime.now().subtract(const Duration(days: 364 * 18));

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final User? data;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      initialValue: <String, dynamic>{
        'id': data?.id.toString(),
        'avatar': data?.urlImage,
        'fullName': data?.fullName,
        'dob': data?.dob ?? validDate.millisecondsSinceEpoch,
        'gender': data?.gender,
        'address': data?.address,
      },
      child: <Widget>[
        if (Responsive.isMobile(context) && data == null)
          Text(
            'Create a new user',
            style: Theme.of(context).textTheme.headline5,
          ).alignment(Alignment.centerLeft),
        _renderAvatar(context),
        FormBuilderTextField(
          name: 'id',
          validator: FormBuilderValidators.integer(context),
          decoration: getDefaultInputDecoration(title: 'ID'),
        ),
        FormBuilderTextField(
          name: 'fullName',
          decoration: getDefaultInputDecoration(title: 'Full Name'),
        ),

        //TODO(tuanhm): Decompose these
        _renderDob(context),
        // _renderGender(context),
        FormBuilderTextField(
          name: 'address',
          decoration: getDefaultInputDecoration(title: 'Address'),
        ),

        const SizedBox(
          height: 10,
        ),
        _renderAddUserBtn(context),
      ]
          .map((Widget e) => e.padding(
                bottom: kDefaultPadding,
                horizontal: kDefaultPadding,
              ))
          .toList()
          .toColumn(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
          )
          .padding(all: 6)
          .width(double.infinity),
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
        if (_formKey.currentState!.validate()) {
          // await _saveData();
          Provider.of<MainScreenProvider>(context, listen: false).listData =
              fetchAll();
          showTopFlash(
            context,
            'Update Status',
            'Your modifications have been saved',
          );
          _formKey.currentState?.reset();
        } else {
          showTopFlash(
            context,
            'Update Status',
            'An error occurred. Please try again!',
            isError: true,
          );
        }
        FocusScope.of(context).unfocus();
      },
      icon: LineIcon.save(),
      label: Text(data == null ? 'SAVE' : 'UPDATE'),
    );
  }

  // Future<void> _saveData() async {
  //   if (_data == null) {
  //     _avatar = await saveImage(_avatar, 'avatar');
  //     await create(
  //       User(
  //         1,
  //         _fnameController.text,
  //         dateFormatter.parse(_dobController.text).millisecondsSinceEpoch,
  //         _gender.index,
  //         _addrController.text,
  //         _avatar,
  //       ),
  //     );
  //   } else {
  //     await update(
  //       _data!.id,
  //       _data!.copyWith(
  //         fullName: _fnameController.text,
  //         dob: dateFormatter.parse(_dobController.text).millisecondsSinceEpoch,
  //         address: _addrController.text,
  //         gender: _gender.index,
  //       ),
  //     );
  //   }
  // }

  Widget _renderDob(BuildContext context) => FormBuilderField<int>(
        name: 'dob',
        builder: (FormFieldState<int?> field) => DateTimeField(
          initialValue: DateTime.fromMillisecondsSinceEpoch(
              field.value ?? validDate.millisecondsSinceEpoch),
          format: DateFormat('MM-dd-yyyy'),
          onChanged: (DateTime? data) =>
              field.didChange(data!.millisecondsSinceEpoch),
          decoration: getDefaultInputDecoration(title: 'Date Of Birth '),
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
        ),
      ).padding(vertical: kDefaultPadding, right: kDefaultPadding);

  // Widget _renderGender(BuildContext context) => <Widget>[
  //       const Text(
  //         'Gender:',
  //         style: TextStyle(fontSize: 18, color: kTextColor),
  //       ).expanded(),
  //       ListTile(
  //         title: const Text('Male'),
  //         leading: Radio<Gender>(
  //           value: Gender.MALE,
  //           groupValue: _gender,
  //           onChanged: _onClickGender,
  //         ),
  //       ).expanded(),
  //       ListTile(
  //         title: const Text('Female'),
  //         leading: Radio<Gender>(
  //           value: Gender.FEMALE,
  //           groupValue: _gender,
  //           onChanged: _onClickGender,
  //         ),
  //       ).expanded(),
  //     ]
  //         .toRow(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           mainAxisSize: MainAxisSize.min,
  //         )
  //         .padding(bottom: kDefaultPadding);

  // void _onClickGender(Gender? value) {
  //   setState(() {
  //     _gender = value!;
  //   });
  // }

  Widget _renderAvatar(BuildContext context) => FormBuilderField<String>(
        name: 'avatar',
        builder: (FormFieldState<String?> field) => CircleAvatar(
          radius: 70,
          foregroundImage: field.value?.isEmpty ??
                  false || !File(field.value ?? '').existsSync()
              ? null
              : FileImage(File(field.value!)),
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
                  field.didChange(file.path);
                }
              },
            )
            .alignment(FractionalOffset.center)
            .padding(bottom: kDefaultPadding),
      );
}

enum Gender { MALE, FEMALE }
