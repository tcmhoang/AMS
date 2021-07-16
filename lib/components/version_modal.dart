import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lsv_ams/config/constansts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class VersionModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (_, AsyncSnapshot<PackageInfo?> snapshot) {
          if (snapshot.hasData) {
            final PackageInfo data = snapshot.data!;
            return <Widget>[
              Text(
                'Code name: ${data.appName}',
                style: GoogleFonts.firaMono(),
              ),
              Text(
                'Version: ${data.version}_pre',
                style: GoogleFonts.firaMono(),
              ),
              Text(
                'Build date: 2021.16.7.338857',
                style: GoogleFonts.firaMono(),
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Author: ',
                      style: GoogleFonts.firaMono(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'tcmhoang',
                      style: GoogleFonts.firaMono(color: kPrimaryColor),
                      mouseCursor: MaterialStateMouseCursor.clickable,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launch('https://github.com/tcmhoang/AMS');
                        },
                    )
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Contributor: ',
                      style: GoogleFonts.firaMono(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'vanmy5198',
                      style: GoogleFonts.firaMono(color: kPrimaryColor),
                      mouseCursor: MaterialStateMouseCursor.clickable,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launch('https://github.com/vanmy5198');
                        },
                    )
                  ],
                ),
              ),
              Text(
                '''
Copyright 2021 tcmh

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

              ''',
                style: GoogleFonts.firaMono(),
              )
            ].toColumn(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
            );
          }
          return const CircularProgressIndicator().center();
        },
      )
    ].toColumn(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}
