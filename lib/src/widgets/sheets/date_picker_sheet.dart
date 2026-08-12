import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

Future<DateTime?> showAppDatePickerSheet({
  required BuildContext context,
  DateTime? initialDate,
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

class AppDatePickerSheet extends StatefulWidget {
  final DateTime? initialDate;
  final DateTime minDate;
  final DateTime maxDate;

  const AppDatePickerSheet({
    super.key,
    this.initialDate,
    required this.minDate,
    required this.maxDate,
  });

  @override
  State<AppDatePickerSheet> createState() => _AppDatePickerSheetState();
}

class _AppDatePickerSheetState extends State<AppDatePickerSheet> {
  late DateTime _focusedMonth;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    if (widget.initialDate != null) {
      _selectedDate = DateTime(
        widget.initialDate!.year,
        widget.initialDate!.month,
        widget.initialDate!.day,
      );
    }

    DateTime focusRef = _selectedDate ?? now;
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
      _selectedDate = DateTime(date.year, date.month, date.day);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final dates = _calendarDates();
    final monthText = DateFormat('MMMM yyyy').format(_focusedMonth);
    const days = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Ming'];

    return AppSheetContainer(
      showDragHandle: true,
      padding: const EdgeInsets.only(bottom: AppSizes.s20),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.s16),
          child: Column(
            children: [
              const SizedBox(height: AppSizes.s16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              const SizedBox(height: AppSizes.s24),
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
                  final isSelected =
                      _selectedDate != null &&
                      DateUtils.isSameDay(date, _selectedDate);

                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: selectable ? () => _onDateTap(date) : null,
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
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: AppSizes.s24),
            ],
          ),
        ),
        AppPersistentSheet(
          // padding: const EdgeInsets.symmetric(
          //   horizontal: AppSizes.s16,
          //   vertical: AppSizes.s16,
          // ),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Batal'),
                ),
              ),
              const SizedBox(width: AppSizes.s16),
              Expanded(
                child: ElevatedButton(
                  onPressed: _selectedDate != null
                      ? () => Navigator.pop(context, _selectedDate)
                      : null,
                  child: const Text('Lanjutkan'),
                ),
              ),
            ],
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
      color: AppColors.transparent,
      shape: const CircleBorder(side: BorderSide(color: AppColors.border)),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 44,
          height: 44,
          child: Icon(icon, color: AppColors.iconPrimary, size: 20),
        ),
      ),
    );
  }
}
