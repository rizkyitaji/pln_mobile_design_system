import 'dart:io';

void main() {
  final baseDirSvg = Directory('assets/icons/svg');
  final baseDirPng = Directory('assets/icons/png');

  final folders = ['outline', 'solid', 'color', 'menu'];

  final buffer = StringBuffer();

  buffer.writeln('class AppIcons {');
  buffer.writeln(
    "  static const String _base = 'packages/pln_mobile_design_system/assets/icons';\n",
  );

  for (var folder in folders) {
    final dir = Directory('${baseDirSvg.path}/$folder');

    if (!dir.existsSync()) continue;

    final files =
        dir
            .listSync()
            .whereType<File>()
            .where((f) => f.path.endsWith('.svg'))
            .toList()
          ..sort((a, b) => a.path.compareTo(b.path));

    buffer.writeln('  // =====================');
    buffer.writeln('  // ${_capitalize(folder)} Icons');
    buffer.writeln('  // =====================\n');

    for (var file in files) {
      final name = file.uri.pathSegments.last;

      final cleanName = name.replaceAll('.svg', '').replaceAll('icon-', '');      

      final variableName = 'icon${_capitalize(_toCamelCase(cleanName))}';

      final path = "\$_base/svg/$folder/$name";

      buffer.writeln("  static const String $variableName = '$path';");
    }

    buffer.writeln('');
  }

  buffer.writeln('  // =====================');
  buffer.writeln('  // PNG Icons');
  buffer.writeln('  // =====================\n');

  final dir = Directory(baseDirPng.path);

  final files =
      dir
          .listSync()
          .whereType<File>()
          .where((f) => f.path.endsWith('.png'))
          .toList()
        ..sort((a, b) => a.path.compareTo(b.path));

  for (var file in files) {
    final name = file.uri.pathSegments.last;

    final cleanName = name.replaceAll('.png', '').replaceAll('icon-', '');

    final variableName = 'icon${_capitalize(_toCamelCase(cleanName))}';

    final path = "\$_base/png/$name";

    buffer.writeln("  static const String $variableName = '$path';");

    buffer.writeln('');

  }

  buffer.writeln('}');

  File('lib/assets/icons/app_icons.dart').writeAsStringSync(buffer.toString());

  // ignore: avoid_print
  print('✅ Icons generated with folder grouping!');
}

String _toCamelCase(String input) {
  final parts = input.split('-');

  return parts.first +
      parts.skip(1).map((e) => e[0].toUpperCase() + e.substring(1)).join();
}

String _capitalize(String input) {
  return input[0].toUpperCase() + input.substring(1);
}
