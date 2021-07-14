import 'dart:ui';

import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:lsv_ams/config/constansts.dart';
import 'package:styled_widget/styled_widget.dart';

void showTopFlash(
  BuildContext context,
  String title,
  String content, {
  bool isError = false,
}) {
  showFlash<dynamic>(
    context: context,
    duration: const Duration(seconds: 3),
    persistent: true,
    builder: (_, FlashController<dynamic> controller) => Flash<dynamic>(
      margin: const EdgeInsets.all(kDefaultPadding),
      controller: controller,
      backgroundColor: kBgLightColor,
      brightness: Brightness.light,
      barrierBlur: 3.0,
      barrierColor: Colors.black.withAlpha(80),
      borderRadius: BorderRadius.circular(8.0),
      barrierDismissible: true,
      alignment: Alignment.bottomRight,
      boxShadows: kElevationToShadow[8],
      backgroundGradient: RadialGradient(
        colors: <Color>[
          if (isError) kBadgeColor else kPrimaryColor,
          kBgDarkColor,
          kSecondaryColor,
          kBgLightColor,
        ],
        center: Alignment.topLeft,
        radius: 7,
      ),
      onTap: () => controller.dismiss(),
      useSafeArea: true,
      child: DefaultTextStyle(
        style: GoogleFonts.montserratAlternates(color: kTextColor),
        child: FlashBar(
          title: Text(
            title,
            style: const TextStyle(
              color: kTitleTextColor,
              fontSize: 18,
            ),
          ),
          content: Text(content),
          icon: LineIcon.infoCircle(
            color: isError ? kBadgeColor : kPrimaryColor,
            size: 24,
          ),
          primaryAction: TextButton(
            onPressed: () => controller.dismiss(),
            child: const Text(
              'OK',
              style: TextStyle(color: kTextColor),
            ),
          ),
        ),
      ).width(kMinScreenSize),
    ),
  );
}
