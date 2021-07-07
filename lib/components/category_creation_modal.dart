import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icon.dart';
import 'package:lsv_ams/config/constansts.dart';
import 'package:lsv_ams/config/responsive.dart';
import 'package:lsv_ams/domains/asset_type_repository/asset_type_repository.dart';
import 'package:lsv_ams/domains/asset_type_repository/src/asset_type_model.dart';

import 'package:styled_widget/styled_widget.dart';

class CategoryCreationModal extends StatefulWidget {
  @override
  CategoryCreationModalState createState() => CategoryCreationModalState();
}

class CategoryCreationModalState extends State<CategoryCreationModal> {
  late Color screenPickerColor;
  late String categoryName;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    screenPickerColor = Colors.blue; // Material blue.
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    double colorSize = width / 30;
    if (colorSize > 50) {
      colorSize = 50;
    } else if (colorSize < 15) {
      colorSize = 15;
    }

    return Form(
      key: formKey,
      child: <Widget>[
        _renderFormContent(context),
        Text(
          'Color',
          style: Theme.of(context).textTheme.headline6,
        ),
        _renderColorPicker(context, colorSize),
        const SizedBox(
          height: 70,
        ),
        _renderAddCategoryBtn(context),
      ]
          .toColumn(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .padding(all: 6)
          .width(double.infinity),
    );
  }

  Widget _renderAddCategoryBtn(BuildContext ctx) {
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
          await create(AssetType(1, categoryName, screenPickerColor.hex));

          Navigator.pop(context);
        }
      },
      icon: LineIcon.plus(),
      label: const Text('ADD CATEGORY'),
    );
  }

  Widget _renderColorPicker(BuildContext context, double colorSize) {
    return ColorPicker(
      // Use the screenPickerColor as start color.
      color: screenPickerColor,
      // Update the screenPickerColor using the callback.
      onColorChanged: (Color color) =>
          setState(() => screenPickerColor = color),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      showMaterialName: true,
      showColorName: true,
      showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      borderRadius: 50,
      subheading: Text(
        'Select color shade',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      wheelDiameter: 155,
      width: colorSize,
      height: colorSize,
      columnSpacing: kDefaultPadding * .8,
      materialNameTextStyle: Theme.of(context).textTheme.caption,
      colorNameTextStyle: Theme.of(context).textTheme.caption,
      colorCodeTextStyle: Theme.of(context).textTheme.caption,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.wheel: true,
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: false,
        ColorPickerType.bw: false,
        ColorPickerType.custom: false,
      },
    ).constrained(height: 450);
  }

  Widget _renderFormContent(BuildContext context) => TextFormField(
        validator: (String? categoryName) =>
            categoryName != null && categoryName.isEmpty
                ? 'The category name cannot be empty'
                : null,
        onChanged: (String value) => setState(() {
          categoryName = value;
        }),
        decoration: const InputDecoration(
          labelText: 'Category Name',
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: kGrayColor),
          ),
        ),
      ).padding(vertical: kDefaultPadding);
}
