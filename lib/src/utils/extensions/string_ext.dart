extension StringExt on String? {
  DateTime? get toDateTime {
    String date = this ?? '';
    if (date.isEmpty || date == 'null') return null;

    String cleanedDate = date.trim();

    if (cleanedDate.contains('+')) {
      cleanedDate = cleanedDate.split('+').first;
    }

    cleanedDate = cleanedDate.replaceAll('Z', '').replaceAll('z', '');

    cleanedDate = cleanedDate.replaceAll('T', ' ');

    return DateTime.tryParse(cleanedDate);
  }
}
