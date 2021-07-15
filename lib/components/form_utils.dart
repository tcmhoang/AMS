import 'dart:io';
import 'dart:typed_data';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../config/constansts.dart';
import '../config/extensions.dart';

final DateFormat dateFormatter = DateFormat('MM-dd-yyyy');
final XTypeGroup imgGrp = XTypeGroup(
  label: 'images',
  extensions: <String>['jpg', 'png'],
);

InputDecoration getDefaultInputDecoration({
  required String title,
  Widget? suffix,
}) =>
    InputDecoration(
      labelText: title,
      suffix: suffix,
      border: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: kGrayColor),
      ),
      contentPadding: const EdgeInsets.all(10),
    );
bool _isFieldEmpty(String? val) => val != null && val.isEmpty;

Widget renderDefaultFieldForm(
  TextEditingController controller,
  String name, {
  Widget? suffix,
}) =>
    TextFormField(
      controller: controller,
      validator: (String? val) => _isFieldEmpty(val)
          ? 'The ${name.toLowerCase()} cannot be empty'
          : null,
      decoration: getDefaultInputDecoration(title: name.inCaps, suffix: suffix),
    ).padding(bottom: kDefaultPadding, right: kDefaultPadding);

Future<File> saveImage(Uint8List binaries) async {
  final Directory tmp = await getApplicationDocumentsDirectory();
  final String path = p.join(tmp.path, kAppDir, 'images');
  await Directory(path).create(recursive: true);
  final File img = File(
    p.join(path, '${DateTime.now().microsecondsSinceEpoch}.png'),
  );
  await img.create();
  await img.writeAsBytes(binaries);
  return img;
}
