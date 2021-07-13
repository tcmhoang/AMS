import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyFormatter extends TextInputFormatter {
  static final NumberFormat formatter =
      NumberFormat.currency(locale: 'vi_VN', symbol: '');
  static final RegExp _onlyNumregExp = RegExp(r'\D+');

  static double getValue(String formatted) =>
      double.parse(formatted.split(_onlyNumregExp).join());
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String onlyNumbers = newValue.text.split(_onlyNumregExp).join();

    final String res = onlyNumbers.isEmpty
        ? '0'
        : onlyNumbers.length >= 16
            ? oldValue.text
            : formatter.format(double.parse(onlyNumbers)).trim();
    return TextEditingValue(
      text: res,
      selection: TextSelection.collapsed(offset: res.length),
    );
  }
}
