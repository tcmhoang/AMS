import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luban/flutter_luban.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../config/constants.dart';
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
  bool enable = true,
}) =>
    TextFormField(
      controller: controller,
      validator: (String? val) => _isFieldEmpty(val)
          ? 'The ${name.toLowerCase()} cannot be empty'
          : null,
      decoration: getDefaultInputDecoration(title: name.inCaps, suffix: suffix),
      enabled: enable,
    ).padding(bottom: kDefaultPadding, right: kDefaultPadding);

Future<String> saveImage(String src, String pre) async {
  try {
    if (src.isEmpty) {
      throw const StdinException('Path is empty');
    }
    final File srcImg = File(src);
    final Directory tmp = await getApplicationDocumentsDirectory();
    final String path = p.join(tmp.path, kAppDir, 'images');
    await Directory(path).create(recursive: true);
    final File img = File(
      p.join(path, '${pre}_${DateTime.now().microsecondsSinceEpoch}.png'),
    );
    final CompressObject compressObject = CompressObject(
      imageFile: srcImg,
      path: path,
      quality: 85,
      step: 9,
      mode: CompressMode.LARGE2SMALL, //default AUTO
    );
    String res = img.path;
    await Luban.compressImage(compressObject).then((String? value) async {
      if (value != null) {
        await File(value).rename(img.path);
      } else
        res = '';
    });
    return res;
  } catch (_) {
    return '';
  }
}

bool deleteImage(String path) {
  try {
    final File img = File(path);
    if (path.isEmpty || !img.existsSync()) {
      throw const StdinException('Image path is empty');
    }
    img.deleteSync();
    return true;
  } catch (_) {
    return false;
  }
}
