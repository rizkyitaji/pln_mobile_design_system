import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

Future<DateTime?> showAppDatePickerSheet({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime minDate,
  required DateTime maxDate,
}) {
  return showModalBottomSheet<DateTime>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => AppDatePickerSheet(
      initialDate: initialDate,
      minDate: minDate,
      maxDate: maxDate,
    ),
  );
}

Future<DateTime?> showAppTimePickerSheet({
  required BuildContext context,
  required DateTime date,
  DateTime? selectedDateTime,
  String infoText =
      'Zona waktu yang dipilih adalah Waktu Indonesia Barat (WIB)',
}) {
  return showModalBottomSheet<DateTime>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => AppTimePickerSheet(
      date: date,
      selectedDateTime: selectedDateTime,
      infoText: infoText,
    ),
  );
}

class AppDatePickerSheet extends StatefulWidget {
  final DateTime initialDate;
  final DateTime minDate;
  final DateTime maxDate;

  const AppDatePickerSheet({
    super.key,
    required this.initialDate,
    required this.minDate,
    required this.maxDate,
  });

  @override
  State<AppDatePickerSheet> createState() => _AppDatePickerSheetState();
}

class _AppDatePickerSheetState extends State<AppDatePickerSheet> {
  late DateTime _focusedMonth;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime(
      widget.initialDate.year,
      widget.initialDate.month,
      widget.initialDate.day,
    );
    _focusedMonth = DateTime(_selectedDate.year, _selectedDate.month);
  }

  bool _isSelectable(DateTime date) {
    final onlyDate = DateTime(date.year, date.month, date.day);
    final min = DateTime(
      widget.minDate.year,
      widget.minDate.month,
      widget.minDate.day,
    );
    final max = DateTime(
      widget.maxDate.year,
      widget.maxDate.month,
      widget.maxDate.day,
    );
    return !onlyDate.isBefore(min) && !onlyDate.isAfter(max);
  }

  List<DateTime> _calendarDates() {
    final firstOfMonth = DateTime(_focusedMonth.year, _focusedMonth.month, 1);
    final startOffset = (firstOfMonth.weekday + 6) % 7;
    final startDate = firstOfMonth.subtract(Duration(days: startOffset));
    return List.generate(35, (index) => startDate.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final dates = _calendarDates();
    final monthText = DateFormat('MMMM yyyy').format(_focusedMonth);
    const days = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Ming'];

    return AppSheetContainer(
      padding: const EdgeInsets.fromLTRB(
        AppSizes.s16,
        AppSizes.s16,
        AppSizes.s16,
        AppSizes.s20,
      ),
      children: [
        Row(
          children: [
            _AppCircleIconButton(
              icon: Icons.chevron_left,
              onTap: () {
                setState(() {
                  _focusedMonth = DateTime(
                    _focusedMonth.year,
                    _focusedMonth.month - 1,
                  );
                });
              },
            ),
            Expanded(
              child: Center(
                child: Text(
                  monthText,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            _AppCircleIconButton(
              icon: Icons.chevron_right,
              onTap: () {
                setState(() {
                  _focusedMonth = DateTime(
                    _focusedMonth.year,
                    _focusedMonth.month + 1,
                  );
                });
              },
            ),
          ],
        ),
        const SizedBox(height: AppSizes.s20),
        Row(
          children: days
              .map(
                (day) => Expanded(
                  child: Center(
                    child: Text(
                      day,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: AppSizes.s12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dates.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final date = dates[index];
            final inMonth = date.month == _focusedMonth.month;
            final selectable = _isSelectable(date);
            final selected = DateUtils.isSameDay(date, _selectedDate);

            return InkWell(
              borderRadius: AppRadius.rounded,
              onTap: selectable
                  ? () => setState(() {
                      _selectedDate = DateTime(date.year, date.month, date.day);
                    })
                  : null,
              child: Center(
                child: Container(
                  width: 44,
                  height: 44,
                  alignment: Alignment.center,
                  decoration: selected
                      ? const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        )
                      : null,
                  child: Text(
                    '${date.day}',
                    style: textTheme.bodyLarge?.copyWith(
                      color: !inMonth
                          ? AppColors.textDisabled
                          : !selectable
                          ? AppColors.textOnDisabled
                          : selected
                          ? AppColors.textOnColorHeading
                          : AppColors.textHeading,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: AppSizes.s20),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Batal'),
              ),
            ),
            const SizedBox(width: AppSizes.s12),
            Expanded(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context, _selectedDate),
                child: const Text('Lanjutkan'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AppTimePickerSheet extends StatefulWidget {
  final DateTime date;
  final DateTime? selectedDateTime;
  final String infoText;

  const AppTimePickerSheet({
    super.key,
    required this.date,
    this.selectedDateTime,
    this.infoText =
        'Zona waktu yang dipilih adalah Waktu Indonesia Barat (WIB)',
  });

  @override
  State<AppTimePickerSheet> createState() => _AppTimePickerSheetState();
}

class _AppTimePickerSheetState extends State<AppTimePickerSheet> {
  late List<DateTime> _times;
  late int _selectedIndex;
  FixedExtentScrollController? _controller;

  @override
  void initState() {
    super.initState();
    _times = _buildTimes();
    _selectedIndex = _initialIndex();
    _controller = FixedExtentScrollController(initialItem: _selectedIndex);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  List<DateTime> _buildTimes() {
    final base = DateTime(widget.date.year, widget.date.month, widget.date.day);
    final now = DateTime.now();
    final isToday = DateUtils.isSameDay(base, now);
    final start = isToday
        ? DateTime(
            now.year,
            now.month,
            now.day,
            now.hour,
            now.minute,
          ).add(const Duration(minutes: 61))
        : base;

    final first = DateTime(
      base.year,
      base.month,
      base.day,
      isToday ? start.hour : 0,
      isToday ? start.minute : 0,
    );

    final values = <DateTime>[];
    var current = first;
    final end = DateTime(base.year, base.month, base.day, 23, 59);
    while (!current.isAfter(end)) {
      values.add(current);
      current = current.add(const Duration(minutes: 1));
    }
    return values;
  }

  int _initialIndex() {
    final selected = widget.selectedDateTime;
    if (selected == null || _times.isEmpty) return 0;
    final index = _times.indexWhere(
      (element) =>
          element.hour == selected.hour && element.minute == selected.minute,
    );
    return index < 0 ? 0 : index;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppSheetContainer(
      padding: const EdgeInsets.fromLTRB(
        AppSizes.s16,
        AppSizes.s12,
        AppSizes.s16,
        AppSizes.s20,
      ),
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSizes.s12),
          decoration: BoxDecoration(
            color: AppColors.secondarySubtle,
            borderRadius: AppRadius.rounded12,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.info_rounded,
                size: AppSizes.s16,
                color: AppColors.iconInfo,
              ),
              const SizedBox(width: AppSizes.s8),
              Expanded(
                child: Text(
                  widget.infoText,
                  style: textTheme.bodySmall?.copyWith(
                    color: AppColors.textInfo,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.s16),
        SizedBox(
          height: 280,
          child: _times.isEmpty
              ? Center(
                  child: Text(
                    'Tidak ada slot waktu tersedia',
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.textDisabled,
                    ),
                  ),
                )
              : ListWheelScrollView.useDelegate(
                  controller: _controller,
                  itemExtent: 56,
                  diameterRatio: 2.4,
                  physics: const FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (index) {
                    setState(() => _selectedIndex = index);
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: _times.length,
                    builder: (context, index) {
                      final time = _times[index];
                      final selected = index == _selectedIndex;
                      final value =
                          '${time.hour.toString().padLeft(2, '0')} : ${time.minute.toString().padLeft(2, '0')}';

                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: AppSizes.s16,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: selected
                              ? AppColors.primarySubtle
                              : AppColors.transparent,
                          borderRadius: AppRadius.rounded12,
                        ),
                        child: Text(
                          value,
                          style: textTheme.titleLarge?.copyWith(
                            color: AppColors.textHeading,
                            fontWeight: selected
                                ? FontWeight.w700
                                : FontWeight.w400,
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ),
        const SizedBox(height: AppSizes.s12),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Batal'),
              ),
            ),
            const SizedBox(width: AppSizes.s12),
            Expanded(
              child: ElevatedButton(
                onPressed: _times.isEmpty
                    ? null
                    : () => Navigator.pop(context, _times[_selectedIndex]),
                child: const Text('Simpan'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _AppCircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _AppCircleIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.backgroundSecondary,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 40,
          height: 40,
          child: Icon(icon, color: AppColors.iconPrimary),
        ),
      ),
    );
  }
}
