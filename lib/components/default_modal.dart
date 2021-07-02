import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lsv_ams/config/constansts.dart';
import 'package:styled_widget/styled_widget.dart';

class DefaultModal extends StatelessWidget {
  const DefaultModal({Key? key, this.data}) : super(key: key);

  final Widget? data;
  @override
  Widget build(BuildContext context) {
    return (data ??
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text('(　´･‿･｀)'),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                )
              ],
            ))
        .padding(all: 16)
        .card(
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: kBgDarkColor,
        );
  }
}
