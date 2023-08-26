import 'package:intl/intl.dart';

extension CustomDateFormatter on DateTime {
  String get formatDate {
    final dateAfterFormatter = DateFormat('yyyy/MM/dd').format(this);

    return dateAfterFormatter;
  }
}