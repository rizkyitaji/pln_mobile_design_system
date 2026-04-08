import 'dart:io';

void main() {
  final bufferIcons = StringBuffer();
  final bufferImages = StringBuffer();
  final bufferAnimations = StringBuffer();
  final bufferSounds = StringBuffer();
  final bufferMainAssets = StringBuffer();

  const String outputRoot = 'lib/src/assets'; // Path baru di dalam src

  // 1. GENERATE SUB-CLASSES
  _generateSubClass(
    className: 'AppIcons',
    basePath: 'assets/icons/svg',
    folders: ['outlined', 'solid', 'colored', 'menu'],
    extensions: ['.svg'],
    buffer: bufferIcons,
    outputFile: '$outputRoot/icons/app_icons.dart',
  );

  _generateSubClass(
    className: 'AppImages',
    basePath: 'assets/images',
    folders: ['png', 'svg', 'png/mascot'],
    extensions: ['.png', '.svg'],
    buffer: bufferImages,
    outputFile: '$outputRoot/images/app_images.dart',
  );

  _generateSubClass(
    className: 'AppAnimations',
    basePath: 'assets/animations',
    folders: ['gif', 'lottie'],
    extensions: ['.gif', '.json'],
    buffer: bufferAnimations,
    outputFile: '$outputRoot/animations/app_animations.dart',
  );

  _generateSubClass(
    className: 'AppSounds',
    basePath: 'assets/sounds',
    folders: [],
    extensions: ['.wav', '.mp3'],
    buffer: bufferSounds,
    outputFile: '$outputRoot/sounds/app_sounds.dart',
  );

  // 2. GENERATE MAIN APP_ASSETS.DART
  bufferMainAssets.writeln("// GENERATED CODE - DO NOT MODIFY BY HAND");
  bufferMainAssets.writeln("import 'animations/app_animations.dart';");
  bufferMainAssets.writeln("import 'icons/app_icons.dart';");
  bufferMainAssets.writeln("import 'images/app_images.dart';");
  bufferMainAssets.writeln("import 'sounds/app_sounds.dart';\n");
  bufferMainAssets.writeln('abstract class AppAssets {');
  bufferMainAssets.writeln(
    '  AppAssets._();\n',
  ); // TAMBAHAN: Private constructor biar konsisten
  bufferMainAssets.writeln(
    "  static const _basePath = 'packages/pln_mobile_design_system';\n",
  );

  _writeMainMapping(bufferMainAssets, 'AppIcons', 'icon', outputRoot);
  _writeMainMapping(bufferMainAssets, 'AppImages', 'image', outputRoot);
  _writeMainMapping(bufferMainAssets, 'AppAnimations', 'animation', outputRoot);
  _writeMainMapping(bufferMainAssets, 'AppSounds', 'sound', outputRoot);

  bufferMainAssets.writeln('}');

  File(
    '$outputRoot/app_assets.dart',
  ).writeAsStringSync(bufferMainAssets.toString());

  // ignore: avoid_print
  print('✅ [PLN Mobile] All Assets Generated in lib/src/assets Successfully!');
}

void _generateSubClass({
  required String className,
  required String basePath,
  required List<String> folders,
  required List<String> extensions,
  required StringBuffer buffer,
  required String outputFile,
}) {
  buffer.writeln("// GENERATED CODE - DO NOT MODIFY BY HAND");
  buffer.writeln('abstract class $className {');
  buffer.writeln('  $className._();\n');

  final List<String> targetPaths = [
    basePath,
    ...folders.map((f) => '$basePath/$f'),
  ];
  final Set<String> processedFiles = {};

  for (var path in targetPaths) {
    final dir = Directory(path);
    if (!dir.existsSync()) continue;

    final files = dir.listSync().whereType<File>().where((f) {
      final extMatch = extensions.any(
        (ext) => f.path.toLowerCase().endsWith(ext),
      );
      final normalizedF = f.parent.path.replaceAll('\\', '/');
      final normalizedP = path.replaceAll('\\', '/');
      return extMatch && normalizedF == normalizedP;
    }).toList()..sort((a, b) => a.path.compareTo(b.path));

    if (files.isEmpty) continue;

    final groupName = path.split('/').last.toUpperCase();
    buffer.writeln('  // Group: $groupName');

    for (var file in files) {
      if (processedFiles.contains(file.path)) continue;
      processedFiles.add(file.path);

      final fileName = file.uri.pathSegments.last;
      String cleanName = fileName
          .split('.')
          .first
          .replaceAll('icon-', '')
          .replaceAll('ic-', '')
          .replaceAll('ic_', '')
          .replaceAll('img-', '')
          .replaceAll('animation-', '');

      String suffix = '';
      final currentFolder = file.parent.path.split(Platform.pathSeparator).last;

      if (currentFolder == 'outlined' &&
          !cleanName.toLowerCase().contains('outlined')) {
        suffix = 'Outlined';
      } else if (currentFolder == 'colored' &&
          !cleanName.toLowerCase().contains('colored')) {
        suffix = 'Colored';
      }

      final varName = _toCamelCase(cleanName) + suffix;
      final normalizedPath = file.path.replaceAll('\\', '/');

      buffer.writeln("  static const String $varName = '$normalizedPath';");
    }
    buffer.writeln('');
  }
  buffer.writeln('}');
  File(outputFile).createSync(recursive: true);
  File(outputFile).writeAsStringSync(buffer.toString());
}

void _writeMainMapping(
  StringBuffer buffer,
  String subClassName,
  String prefix,
  String outputRoot,
) {
  final file = File(
    '$outputRoot/${_getFolderByClass(subClassName)}/${_getFileNameByClass(subClassName)}',
  );
  if (!file.existsSync()) return;

  final lines = file.readAsLinesSync();
  buffer.writeln('  // --- $subClassName Mapping ---');
  for (var line in lines) {
    if (line.contains('static const String')) {
      final parts = line.split('String');
      if (parts.length < 2) continue;

      final varNameFromSubClass = parts[1].split('=')[0].trim();

      String finalVarName;
      if (varNameFromSubClass.toLowerCase().startsWith(prefix.toLowerCase())) {
        finalVarName = varNameFromSubClass;
      } else {
        finalVarName = '$prefix${_capitalize(varNameFromSubClass)}';
      }

      buffer.writeln(
        "  static const $finalVarName = '\$_basePath/\${$subClassName.$varNameFromSubClass}';",
      );
    }
  }
  buffer.writeln('');
}

String _getFolderByClass(String cls) =>
    cls.replaceFirst('App', '').toLowerCase();

String _getFileNameByClass(String cls) {
  if (cls == 'AppIcons') return 'app_icons.dart';
  if (cls == 'AppImages') return 'app_images.dart';
  if (cls == 'AppAnimations') return 'app_animations.dart';
  return 'app_sounds.dart';
}

String _toCamelCase(String input) {
  final parts = input.split(RegExp(r'[-_]'));
  var result = parts.first;
  for (var i = 1; i < parts.length; i++) {
    result += _capitalize(parts[i]);
  }
  return result;
}

String _capitalize(String input) {
  if (input.isEmpty) return '';
  return input[0].toUpperCase() + input.substring(1);
}
