import 'package:intl/intl.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

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

  /// Output: 01 Januari 2026, 09:10 WIB
  String get formatddMMMMyHHmmWIB {
    var date = this;
    if (date == null) return '-';
    return DateFormat('dd MMMM y, HH:mm WIB', 'id_ID').format(date);
  }

  /// Output: 09:10
  String get formatHHmm {
    var date = this;
    if (date == null) return '-';
    return DateFormat('HH:mm', 'id_ID').format(date);
  }

  /// Output: 01 Januari 2026
  String get formatddMMMMy {
    var date = this;
    if (date == null) return '-';
    return DateFormat('dd MMMM y', 'id_ID').format(date);
  }

  /// Output: 202601
  String get formatYearMonth {
    var date = this;
    if (date == null) return '-';
    return '${date.year}${date.month.zeroPadding}';
  }

  /// Output: Januari 2026
  String get formatMMMMy {
    var date = this;
    if (date == null) return '-';
    return DateFormat('MMMM y', 'id_ID').format(date);
  }

  String get toDayTimeline {
    var date = this;
    if (date == null) return '-';
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final dateToCheck = DateTime(date.year, date.month, date.day);

    if (dateToCheck == today) return 'Hari Ini';
    if (dateToCheck == yesterday) return 'Kemarin';

    return date.formatddMMMMy;
  }
}
