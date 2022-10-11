import 'package:intl/intl.dart';

bool _isInteger(num value) => (value % 1) == 0;

String formatPrice(num val) {
  if (_isInteger(val)) {
    return val.toInt().toString();
  } else {
    return val.toStringAsFixed(2);
  }
}

String formatRealPrice(String price) {
  final formatCurrency = new NumberFormat.simpleCurrency(
    decimalDigits: price.contains(".") ? 2 : 0,
  );
  String priceFormat = formatCurrency.format(num.parse(price));
  return priceFormat.substring(1, priceFormat.length);
}

String priceFormat(num val) {
  String priceFormat = formatRealPrice(formatPrice(val));
  return priceFormat;
}
