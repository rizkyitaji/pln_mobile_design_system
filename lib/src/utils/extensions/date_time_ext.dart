import 'package:intl/intl.dart';

extension DateTimeExt on DateTime? {
  /// Output: 1 Januari 2026 09:10:11
  String get formatdMMMMyHHmmss {
    var date = this;
    if (date == null) return '-';
    return DateFormat('d MMMM y HH:mm:ss', 'id_ID').format(date);
  }

  /// Output: 01 Januari 2026, 09:10
  String get formatddMMMMyHHmm {
    var date = this;
    if (date == null) return '-';
    return DateFormat('dd MMMM y, HH:mm', 'id_ID').format(date);
  }

  /// 09:10
  String get formatHHmm {
    var date = this;
    if (date == null) return '-';
    return DateFormat('HH:mm', 'id_ID').format(date);
  }
}
