import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String toCustomString() {
    return DateFormat('yyyy-MM-dd HH:mm').format(this);
  }
}
