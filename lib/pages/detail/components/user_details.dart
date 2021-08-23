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
import 'package:lsv_ams/providers/domain/detail_types.dart';
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
        'urlImage': data?.urlImage ?? '',
        'fullName': data?.fullName,
        'dob': data?.dob ?? validDate.millisecondsSinceEpoch,
        'gender': data?.gender ?? 1,
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
        _renderDob(context),
        _renderGender(context),
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
        FocusScope.of(context).unfocus();
        if (_formKey.currentState!.saveAndValidate() && await _saveData()) {
          Provider.of<MainScreenProvider>(context, listen: false)
            ..listData = fetchAll()
            ..currentCategory = const DetailTypes.empty();
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
      },
      icon: LineIcon.save(),
      label: Text(data == null ? 'SAVE' : 'UPDATE'),
    );
  }

  Future<bool> _saveData() async {
    final String savedPath = await saveImage(
        _formKey.currentState!.fields['urlImage']!.value as String, 'urlImage');
    _formKey.currentState!.fields['urlImage']!.didChange(savedPath);

    if (savedPath.isNotEmpty) {
      _formKey.currentState!.save();
    }
    _formKey.currentState!.setInternalFieldValue(
        'id', int.parse(_formKey.currentState!.value['id'] as String));
    if (data == null) {
      return create(User.fromJson(_formKey.currentState!.value));
    } else {
      if (data!.urlImage != _formKey.currentState!.fields['urlImage']!.value)
        deleteImage(data!.urlImage);
      return update(data!.id, User.fromJson(_formKey.currentState!.value));
    }
  }

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
      );

  Widget _renderGender(BuildContext context) => <Widget>[
        Text(
          'Gender',
          style: Theme.of(context).textTheme.bodyText1,
        ).expanded(),
        FormBuilderRadioGroup<int>(
          name: 'gender',
          decoration: const InputDecoration(
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
          ),
          wrapSpacing: 50,
          orientation: OptionsOrientation.wrap,
          options: const <FormBuilderFieldOption<int>>[
            FormBuilderFieldOption<int>(
              value: 1,
              child: Text('Male'),
            ),
            FormBuilderFieldOption<int>(
              value: 0,
              child: Text('Female'),
            ),
          ],
        ).expanded(),
      ].toRow();

  Widget _renderAvatar(BuildContext context) => FormBuilderField<String>(
        name: 'urlImage',
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
