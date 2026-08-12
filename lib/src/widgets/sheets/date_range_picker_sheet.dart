import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

Future<DateTimeRange?> showAppDateRangePickerSheet({
  required BuildContext context,
  DateTime? initialStartDate,
  DateTime? initialEndDate,
  required DateTime minDate,
  required DateTime maxDate,
}) {
  return showModalBottomSheet<DateTimeRange>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => AppDateRangePickerSheet(
      initialStartDate: initialStartDate,
      initialEndDate: initialEndDate,
      minDate: minDate,
      maxDate: maxDate,
    ),
  );
}

class AppDateRangePickerSheet extends StatefulWidget {
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;
  final DateTime minDate;
  final DateTime maxDate;

  const AppDateRangePickerSheet({
    super.key,
    this.initialStartDate,
    this.initialEndDate,
    required this.minDate,
    required this.maxDate,
  });

  @override
  State<AppDateRangePickerSheet> createState() =>
      _AppDateRangePickerSheetState();
}

class _AppDateRangePickerSheetState extends State<AppDateRangePickerSheet> {
  late DateTime _focusedMonth;
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    if (widget.initialStartDate != null) {
      _startDate = DateTime(
        widget.initialStartDate!.year,
        widget.initialStartDate!.month,
        widget.initialStartDate!.day,
      );
    }
    if (widget.initialEndDate != null) {
      _endDate = DateTime(
        widget.initialEndDate!.year,
        widget.initialEndDate!.month,
        widget.initialEndDate!.day,
      );
    }

    DateTime focusRef = _startDate ?? now;
    _focusedMonth = DateTime(focusRef.year, focusRef.month);
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
    final startOffset = (firstOfMonth.weekday + 6) % 7; // Monday as first day
    final startDate = firstOfMonth.subtract(Duration(days: startOffset));
    return List.generate(35, (index) => startDate.add(Duration(days: index)));
  }

  void _onDateTap(DateTime date) {
    setState(() {
      final selected = DateTime(date.year, date.month, date.day);
      if (_startDate == null && _endDate == null) {
        _startDate = selected;
      } else if (_startDate != null && _endDate == null) {
        if (selected.isBefore(_startDate!)) {
          _startDate = selected;
        } else {
          _endDate = selected;
        }
      } else {
        // Both exist, restart selection
        _startDate = selected;
        _endDate = null;
      }
    });
  }

  bool _isDateInRange(DateTime date) {
    if (_startDate != null && _endDate != null) {
      return date.isAfter(_startDate!) && date.isBefore(_endDate!);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final dates = _calendarDates();
    final monthText = DateFormat('MMMM yyyy').format(_focusedMonth);
    const days = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Ming'];

    final startStr = _startDate != null
        ? DateFormat('dd MMMM yyyy').format(_startDate!)
        : '-';
    final endStr =
        _endDate != null ? DateFormat('dd MMMM yyyy').format(_endDate!) : '-';

    return AppSheetContainer(
      showDragHandle: false,
      padding: const EdgeInsets.fromLTRB(
        AppSizes.s16,
        AppSizes.s16,
        AppSizes.s16,
        AppSizes.s20,
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pilih Tanggal',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textHeading,
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close_rounded, color: AppColors.icon),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.s24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tanggal Mulai',
                  style: textTheme.bodyMedium?.copyWith(
                    color: AppColors.textDisabled,
                  ),
                ),
                const SizedBox(height: AppSizes.s4),
                Text(
                  startStr,
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textHeading,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tanggal Selesai',
                  style: textTheme.bodyMedium?.copyWith(
                    color: AppColors.textDisabled,
                  ),
                ),
                const SizedBox(height: AppSizes.s4),
                Text(
                  endStr,
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textHeading,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: AppSizes.s16),
        const Divider(),
        const SizedBox(height: AppSizes.s16),
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
            final isStart =
                _startDate != null && DateUtils.isSameDay(date, _startDate);
            final isEnd =
                _endDate != null && DateUtils.isSameDay(date, _endDate);
            final inRange = _isDateInRange(date);

            final isSelected = isStart || isEnd;

            BorderRadius? rangeRadius;
            if (inRange) {
              rangeRadius = BorderRadius.zero;
            } else if (isStart && _endDate != null) {
              rangeRadius = const BorderRadius.only(
                topLeft: Radius.circular(22),
                bottomLeft: Radius.circular(22),
              );
            } else if (isEnd && _startDate != null) {
              rangeRadius = const BorderRadius.only(
                topRight: Radius.circular(22),
                bottomRight: Radius.circular(22),
              );
            }

            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: selectable ? () => _onDateTap(date) : null,
              child: Container(
                decoration: inRange || (isSelected && _endDate != null)
                    ? BoxDecoration(
                        color: AppColors.primarySubtle,
                        borderRadius: rangeRadius,
                      )
                    : null,
                child: Center(
                  child: Container(
                    width: 44,
                    height: 44,
                    alignment: Alignment.center,
                    decoration: isSelected
                        ? const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          )
                        : null,
                    child: Text(
                      '${date.day}',
                      style: textTheme.bodyLarge?.copyWith(
                        color: isSelected
                            ? AppColors.textOnColorHeading
                            : !selectable
                                ? AppColors.textOnDisabled
                                : !inMonth
                                    ? AppColors.textDisabled
                                    : AppColors.textHeading,
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: AppSizes.s24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: (_startDate != null && _endDate != null)
                ? () {
                    Navigator.pop(
                      context,
                      DateTimeRange(start: _startDate!, end: _endDate!),
                    );
                  }
                : null,
            child: const Text('Pilih'),
          ),
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
