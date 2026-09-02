extension StringExt on String? {
  bool get isStandardImage {
    final str = this ?? '';
    final lowerCasePath = str.toLowerCase();

    return lowerCasePath.endsWith('.png') ||
        lowerCasePath.endsWith('.jpg') ||
        lowerCasePath.endsWith('.jpeg') ||
        lowerCasePath.endsWith('.webp') ||
        lowerCasePath.endsWith('.gif') ||
        lowerCasePath.endsWith('.bmp');
  }

  String get toTitleCase {
    var str = this ?? '';
    if (str.trim().isEmpty) return '';

    String textWithSpaces = str.replaceAll('_', ' ');

    return textWithSpaces
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .map((word) {
          final firstLetterMatch = RegExp(r'[a-zA-Z]').firstMatch(word);

          if (firstLetterMatch == null) return word;

          final index = firstLetterMatch.start;

          return word.substring(0, index) +
              word[index].toUpperCase() +
              word.substring(index + 1).toLowerCase();
        })
        .join(' ');
  }

  String get toCamelCase {
    var str = this ?? '';
    if (str.trim().isEmpty) return '';

    String cleaned = str.replaceAll(RegExp(r'[^a-zA-Z0-9]'), ' ');

    List<String> words = cleaned
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .toList();

    if (words.isEmpty) return '';

    String result = words.first.toLowerCase();

    for (int i = 1; i < words.length; i++) {
      String word = words[i];
      result += word[0].toUpperCase() + word.substring(1).toLowerCase();
    }

    return result;
  }
}
