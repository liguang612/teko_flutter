import 'package:intl/intl.dart';

class StringUtils {
  static String numberToCurrency(int number) {
    var f = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');
    return f.format(number);
  }
}
