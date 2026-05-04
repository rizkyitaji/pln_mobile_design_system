import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

extension DurationExt on Duration {
  String format([String? format]) {
    var d = this;

    // We want to round up the remaining time to the nearest second
    d += const Duration(microseconds: 999999);

    switch (format) {
      case 'h':
        return "${d.inHours % 60}";
      case 'm':
        return "${d.inMinutes % 60}";
      case 's':
        return "${d.inSeconds % 60}";
      case 'hh':
        return (d.inHours % 60).zeroPadding;
      case 'mm':
        return (d.inMinutes % 60).zeroPadding;
      case 'ss':
        return (d.inSeconds % 60).zeroPadding;
      case 'mm:ss':
        return "${(d.inMinutes % 60).zeroPadding}:${(d.inSeconds % 60).zeroPadding}";
      case 'hh:mm':
        return "${(d.inHours % 60).zeroPadding}:${(d.inMinutes % 60).zeroPadding}";
      default:
        return "${(d.inHours % 60).zeroPadding}:${(d.inMinutes % 60).zeroPadding}:${(d.inSeconds % 60).zeroPadding}";
    }
  }
}
