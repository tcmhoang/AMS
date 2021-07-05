import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:styled_widget/styled_widget.dart';

class CategoryCreationModal extends StatefulWidget {
  @override
  CategoryCreationModalState createState() => CategoryCreationModalState();
}

class CategoryCreationModalState extends State<CategoryCreationModal> {
  late Color screenPickerColor;

  // Define custom colors. The 'guide' color values are from
  // https://material.io/design/color/the-color-system.html#color-theme-creation
  static const Color guidePrimary = Color(0xFF6200EE);
  static const Color guidePrimaryVariant = Color(0xFF3700B3);
  static const Color guideSecondary = Color(0xFF03DAC6);
  static const Color guideSecondaryVariant = Color(0xFF018786);
  static const Color guideError = Color(0xFFB00020);
  static const Color guideErrorDark = Color(0xFFCF6679);
  static const Color blueBlues = Color(0xFF174378);

  final Map<ColorSwatch<Object>, String> colorsNameMap =
      <ColorSwatch<Object>, String>{
    ColorTools.createPrimarySwatch(guidePrimary): 'Guide Purple',
    ColorTools.createPrimarySwatch(guidePrimaryVariant): 'Guide Purple Variant',
    ColorTools.createAccentSwatch(guideSecondary): 'Guide Teal',
    ColorTools.createAccentSwatch(guideSecondaryVariant): 'Guide Teal Variant',
    ColorTools.createPrimarySwatch(guideError): 'Guide Error',
    ColorTools.createPrimarySwatch(guideErrorDark): 'Guide Error Dark',
    ColorTools.createPrimarySwatch(blueBlues): 'Blue blues',
  };

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

    return <Widget>[
      Text(
        'Color',
        style: Theme.of(context).textTheme.headline6,
      ),
      ColorPicker(
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

        materialNameTextStyle: Theme.of(context).textTheme.caption,
        colorNameTextStyle: Theme.of(context).textTheme.caption,
        colorCodeTextStyle: Theme.of(context).textTheme.caption,
        pickersEnabled: const <ColorPickerType, bool>{
          ColorPickerType.both: false,
          ColorPickerType.primary: true,
          ColorPickerType.accent: true,
          ColorPickerType.bw: false,
          ColorPickerType.custom: true,
          ColorPickerType.wheel: true,
        },
        customColorSwatchesAndNames: colorsNameMap,
      ),
    ]
        .toColumn(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .padding(all: 6)
        .width(double.infinity);
  }
}