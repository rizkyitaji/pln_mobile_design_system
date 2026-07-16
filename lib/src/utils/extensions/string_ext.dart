extension StringExt on String? {
  DateTime? get toDateTime {
    if (this == null || this == 'null' || this!.trim().isEmpty) return null;

    String cleanedDate = this!.trim();

    if (cleanedDate.contains('+')) {
      cleanedDate = cleanedDate.split('+').first;
    }

    cleanedDate = cleanedDate
        .replaceAll('Z', '')
        .replaceAll('z', '')
        .replaceAll('T', ' ');

    return DateTime.tryParse(cleanedDate);
  }

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

  String get toCamelCase {
    if (this == null || this!.isEmpty) return '';
    return this!
        .split(' ')
        .map(
          (word) => word.isEmpty
              ? word
              : word[0].toUpperCase() + word.substring(1).toLowerCase(),
        )
        .join(' ');
  }
}
