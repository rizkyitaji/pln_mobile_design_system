import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';
import 'package:pln_mobile_design_system/src/constants/colors/app_palette.dart';

/// Displays a modal bottom sheet allowing the user to select time (hour and minute)
/// using interactive scrollable wheels and/or direct manual keyboard input.
Future<DateTime?> showAppTimePickerSheet({
  required BuildContext context,
  required DateTime date,
  DateTime? selectedDateTime,
  String title = 'Pilih Jam Mulai Pelaksanaan',
  String buttonText = 'Pilih',
  String? infoText,
  bool isDismissible = true,
  bool enableDrag = true,
}) {
  return showModalBottomSheet<DateTime>(
    context: context,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => AppTimePickerSheet(
      date: date,
      selectedDateTime: selectedDateTime,
      title: title,
      buttonText: buttonText,
      infoText: infoText,
    ),
  );
}

class AppTimePickerSheet extends StatefulWidget {
  final DateTime date;
  final DateTime? selectedDateTime;
  final String title;
  final String buttonText;
  final String? infoText;

  const AppTimePickerSheet({
    super.key,
    required this.date,
    this.selectedDateTime,
    this.title = 'Pilih Jam Mulai Pelaksanaan',
    this.buttonText = 'Pilih',
    this.infoText,
  });

  @override
  State<AppTimePickerSheet> createState() => _AppTimePickerSheetState();
}

class _AppTimePickerSheetState extends State<AppTimePickerSheet> {
  late int _selectedHour;
  late int _selectedMinute;
  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minuteController;
  late TextEditingController _hourTextController;
  late TextEditingController _minuteTextController;
  late FocusNode _hourFocusNode;
  late FocusNode _minuteFocusNode;

  bool _isEditingHour = false;
  bool _isEditingMinute = false;

  static const double _itemExtent = 56.0;
  static const double _pickerHeight = 280.0; // 5 visible rows * 56.0
  static const double _columnWidth = 68.0;
  static const double _separatorWidth = 24.0;
  static const double _centerTop = 112.0; // 2 * 56.0 (row index 2)

  @override
  void initState() {
    super.initState();
    final initial = widget.selectedDateTime ?? widget.date;
    _selectedHour = initial.hour.clamp(0, 23);
    _selectedMinute = initial.minute.clamp(0, 59);

    _hourController = FixedExtentScrollController(initialItem: _selectedHour);
    _minuteController = FixedExtentScrollController(
      initialItem: _selectedMinute,
    );

    _hourTextController = TextEditingController(
      text: _selectedHour.toString().padLeft(2, '0'),
    );
    _minuteTextController = TextEditingController(
      text: _selectedMinute.toString().padLeft(2, '0'),
    );

    _hourFocusNode = FocusNode();
    _minuteFocusNode = FocusNode();

    _hourFocusNode.addListener(_onHourFocusChange);
    _minuteFocusNode.addListener(_onMinuteFocusChange);
  }

  void _onHourFocusChange() {
    if (!_hourFocusNode.hasFocus && mounted) {
      if (_hourTextController.text.isNotEmpty) {
        final val = int.tryParse(_hourTextController.text) ?? _selectedHour;
        final clamped = val.clamp(0, 23);
        _selectedHour = clamped;
        if (_hourController.hasClients &&
            _hourController.selectedItem != _selectedHour) {
          _hourController.jumpToItem(_selectedHour);
        }
      }
      setState(() {
        _isEditingHour = false;
        _hourTextController.text = _selectedHour.toString().padLeft(2, '0');
      });
    }
  }

  void _onMinuteFocusChange() {
    if (!_minuteFocusNode.hasFocus && mounted) {
      if (_minuteTextController.text.isNotEmpty) {
        final val = int.tryParse(_minuteTextController.text) ?? _selectedMinute;
        final clamped = val.clamp(0, 59);
        _selectedMinute = clamped;
        if (_minuteController.hasClients &&
            _minuteController.selectedItem != _selectedMinute) {
          _minuteController.jumpToItem(_selectedMinute);
        }
      }
      setState(() {
        _isEditingMinute = false;
        _minuteTextController.text = _selectedMinute.toString().padLeft(2, '0');
      });
    }
  }

  @override
  void dispose() {
    _hourFocusNode.removeListener(_onHourFocusChange);
    _minuteFocusNode.removeListener(_onMinuteFocusChange);
    _hourFocusNode.dispose();
    _minuteFocusNode.dispose();
    _hourTextController.dispose();
    _minuteTextController.dispose();
    _hourController.dispose();
    _minuteController.dispose();
    super.dispose();
  }

  void _startEditingHour() {
    setState(() {
      _isEditingHour = true;
      _isEditingMinute = false;
      _hourTextController.clear();
    });
    _hourFocusNode.requestFocus();
  }

  void _startEditingMinute() {
    setState(() {
      _isEditingHour = false;
      _isEditingMinute = true;
      _minuteTextController.clear();
    });
    _minuteFocusNode.requestFocus();
  }

  void _onHourInputChanged(String text) {
    if (text.isEmpty) return;
    if (text.length >= 2) {
      final val = int.tryParse(text) ?? _selectedHour;
      final clamped = val.clamp(0, 23);
      setState(() {
        _selectedHour = clamped;
        _hourTextController.text = clamped.toString().padLeft(2, '0');
      });
      if (_hourController.hasClients &&
          _hourController.selectedItem != clamped) {
        _hourController.jumpToItem(clamped);
      }
      _startEditingMinute();
    }
  }

  void _onMinuteInputChanged(String text) {
    if (text.isEmpty) return;
    if (text.length >= 2) {
      final val = int.tryParse(text) ?? _selectedMinute;
      final clamped = val.clamp(0, 59);
      setState(() {
        _selectedMinute = clamped;
        _minuteTextController.text = clamped.toString().padLeft(2, '0');
        _isEditingMinute = false;
      });
      if (_minuteController.hasClients &&
          _minuteController.selectedItem != clamped) {
        _minuteController.jumpToItem(clamped);
      }
      FocusScope.of(context).unfocus();
    }
  }

  void _onHourWheelChanged(int index) {
    if (!_hourFocusNode.hasFocus && !_isEditingHour) {
      setState(() {
        _selectedHour = index;
        _hourTextController.text = index.toString().padLeft(2, '0');
      });
    }
  }

  void _onMinuteWheelChanged(int index) {
    if (!_minuteFocusNode.hasFocus && !_isEditingMinute) {
      setState(() {
        _selectedMinute = index;
        _minuteTextController.text = index.toString().padLeft(2, '0');
      });
    }
  }

  void _onConfirm() {
    if (_isEditingHour && _hourTextController.text.isNotEmpty) {
      final val = int.tryParse(_hourTextController.text) ?? _selectedHour;
      _selectedHour = val.clamp(0, 23);
    }
    if (_isEditingMinute && _minuteTextController.text.isNotEmpty) {
      final val = int.tryParse(_minuteTextController.text) ?? _selectedMinute;
      _selectedMinute = val.clamp(0, 59);
    }
    FocusScope.of(context).unfocus();
    final result = DateTime(
      widget.date.year,
      widget.date.month,
      widget.date.day,
      _selectedHour,
      _selectedMinute,
    );
    Navigator.pop(context, result);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: AppSheetContainer(
        showDragHandle: false,
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.s16,
                AppSizes.zero,
                AppSizes.s16,
                AppSizes.s8,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: context.textTheme.bodyLargeSemiBold,
                    ),
                  ),
                  AppBackButton(
                    icon: AppAssets.iconClose,
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            if (widget.infoText != null && widget.infoText!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSizes.s16,
                  AppSizes.s4,
                  AppSizes.s16,
                  AppSizes.s12,
                ),
                child: Container(
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
                          widget.infoText!,
                          style: textTheme.bodySmall?.copyWith(
                            color: AppColors.textInfo,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: AppSizes.s8),
            Center(
              child: SizedBox(
                width: (_columnWidth * 2) + _separatorWidth,
                height: _pickerHeight,
                child: Stack(
                  children: [
                    // Layer 1: Background Columns
                    Row(
                      children: [
                        Container(
                          width: _columnWidth,
                          height: _pickerHeight,
                          decoration: BoxDecoration(
                            color: AppColors.primarySubtle,
                            borderRadius: AppRadius.rounded8,
                          ),
                        ),
                        const SizedBox(width: _separatorWidth),
                        Container(
                          width: _columnWidth,
                          height: _pickerHeight,
                          decoration: BoxDecoration(
                            color: AppColors.primarySubtle,
                            borderRadius: AppRadius.rounded8,
                          ),
                        ),
                      ],
                    ),

                    // Layer 2: Middle Colon Column (5 rows)
                    Positioned(
                      left: _columnWidth,
                      width: _separatorWidth,
                      top: 0,
                      bottom: 0,
                      child: IgnorePointer(
                        child: Column(
                          children: List.generate(5, (index) {
                            final isCenter = index == 2;
                            return SizedBox(
                              height: _itemExtent,
                              child: Center(
                                child: Text(
                                  ':',
                                  style: TextStyle(
                                    fontFamily: AppFonts.primary,
                                    fontSize: isCenter ? 26 : 20,
                                    fontWeight: isCenter
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                    color: isCenter
                                        ? AppColors.textPrimary
                                        : AppColors.textCaption,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),

                    // Layer 3: Center Selected Item Backgrounds (Hour & Minute)
                    Positioned(
                      left: 0,
                      top: _centerTop,
                      width: _columnWidth,
                      height: _itemExtent,
                      child: IgnorePointer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: AppRadius.rounded12,
                            border: Border.all(
                              color: AppColors.borderPrimary,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: _columnWidth + _separatorWidth,
                      top: _centerTop,
                      width: _columnWidth,
                      height: _itemExtent,
                      child: IgnorePointer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: AppRadius.rounded12,
                            border: Border.all(
                              color: AppColors.borderPrimary,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Layer 4: Scrollable Wheels (Hours and Minutes)
                    Row(
                      children: [
                        // Hour Wheel
                        SizedBox(
                          width: _columnWidth,
                          height: _pickerHeight,
                          child: NotificationListener<ScrollStartNotification>(
                            onNotification: (notification) {
                              if (notification.dragDetails != null) {
                                FocusScope.of(context).unfocus();
                              }
                              return false;
                            },
                            child: ListWheelScrollView.useDelegate(
                              controller: _hourController,
                              itemExtent: _itemExtent,
                              perspective: 0.002,
                              diameterRatio: 10,
                              physics: const FixedExtentScrollPhysics(),
                              onSelectedItemChanged: _onHourWheelChanged,
                              childDelegate: ListWheelChildBuilderDelegate(
                                childCount: 24,
                                builder: (context, index) {
                                  final isSelected = index == _selectedHour;
                                  return GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      if (isSelected) {
                                        _startEditingHour();
                                      } else {
                                        _hourController.animateToItem(
                                          index,
                                          duration: const Duration(
                                            milliseconds: 300,
                                          ),
                                          curve: Curves.easeOut,
                                        );
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        index.toString().padLeft(2, '0'),
                                        style: TextStyle(
                                          fontFamily: AppFonts.primary,
                                          fontSize: isSelected ? 26 : 16,
                                          fontWeight: isSelected
                                              ? FontWeight.w600
                                              : FontWeight.w400,
                                          color: isSelected
                                              ? AppColors.textPrimary
                                              : AppColors.textCaption,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: _separatorWidth),
                        // Minute Wheel
                        SizedBox(
                          width: _columnWidth,
                          height: _pickerHeight,
                          child: NotificationListener<ScrollStartNotification>(
                            onNotification: (notification) {
                              if (notification.dragDetails != null) {
                                FocusScope.of(context).unfocus();
                              }
                              return false;
                            },
                            child: ListWheelScrollView.useDelegate(
                              controller: _minuteController,
                              itemExtent: _itemExtent,
                              perspective: 0.002,
                              diameterRatio: 10,
                              physics: const FixedExtentScrollPhysics(),
                              onSelectedItemChanged: _onMinuteWheelChanged,
                              childDelegate: ListWheelChildBuilderDelegate(
                                childCount: 60,
                                builder: (context, index) {
                                  final isSelected = index == _selectedMinute;
                                  return GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      if (isSelected) {
                                        _startEditingMinute();
                                      } else {
                                        _minuteController.animateToItem(
                                          index,
                                          duration: const Duration(
                                            milliseconds: 300,
                                          ),
                                          curve: Curves.easeOut,
                                        );
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        index.toString().padLeft(2, '0'),
                                        style: TextStyle(
                                          fontFamily: AppFonts.primary,
                                          fontSize: isSelected ? 26 : 16,
                                          fontWeight: isSelected
                                              ? FontWeight.w600
                                              : FontWeight.w400,
                                          color: isSelected
                                              ? AppColors.textPrimary
                                              : AppColors.textCaption,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Layer 5: Manual Input TextFields when editing
                    if (_isEditingHour)
                      Positioned(
                        left: 0,
                        top: _centerTop,
                        width: _columnWidth,
                        height: _itemExtent,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: AppRadius.rounded12,
                            border: Border.all(
                              color: AppColors.primary,
                              width: 2.0,
                            ),
                          ),
                          child: Center(
                            child: TextField(
                              controller: _hourTextController,
                              focusNode: _hourFocusNode,
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              cursorColor: AppColors.primary,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: AppFonts.primary,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: AppPalette.teal900,
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(2),
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                hintText: _selectedHour.toString().padLeft(
                                  2,
                                  '0',
                                ),
                                hintStyle: TextStyle(
                                  fontFamily: AppFonts.primary,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: AppPalette.teal900.withValues(
                                    alpha: 0.35,
                                  ),
                                ),
                              ),
                              onChanged: _onHourInputChanged,
                              onSubmitted: (_) {
                                if (_hourTextController.text.isNotEmpty) {
                                  final val =
                                      int.tryParse(_hourTextController.text) ??
                                      _selectedHour;
                                  final clamped = val.clamp(0, 23);
                                  _selectedHour = clamped;
                                  _hourTextController.text = clamped
                                      .toString()
                                      .padLeft(2, '0');
                                  if (_hourController.hasClients) {
                                    _hourController.jumpToItem(clamped);
                                  }
                                }
                                _startEditingMinute();
                              },
                            ),
                          ),
                        ),
                      ),

                    if (_isEditingMinute)
                      Positioned(
                        left: _columnWidth + _separatorWidth,
                        top: _centerTop,
                        width: _columnWidth,
                        height: _itemExtent,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: AppRadius.rounded12,
                            border: Border.all(
                              color: AppColors.primary,
                              width: 2.0,
                            ),
                          ),
                          child: Center(
                            child: TextField(
                              controller: _minuteTextController,
                              focusNode: _minuteFocusNode,
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              cursorColor: AppColors.primary,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: AppFonts.primary,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: AppPalette.teal900,
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(2),
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                hintText: _selectedMinute.toString().padLeft(
                                  2,
                                  '0',
                                ),
                                hintStyle: TextStyle(
                                  fontFamily: AppFonts.primary,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: AppPalette.teal900.withValues(
                                    alpha: 0.35,
                                  ),
                                ),
                              ),
                              onChanged: _onMinuteInputChanged,
                              onSubmitted: (_) {
                                if (_minuteTextController.text.isNotEmpty) {
                                  final val =
                                      int.tryParse(
                                        _minuteTextController.text,
                                      ) ??
                                      _selectedMinute;
                                  final clamped = val.clamp(0, 59);
                                  _selectedMinute = clamped;
                                  _minuteTextController.text = clamped
                                      .toString()
                                      .padLeft(2, '0');
                                  if (_minuteController.hasClients) {
                                    _minuteController.jumpToItem(clamped);
                                  }
                                }
                                FocusScope.of(context).unfocus();
                              },
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSizes.s16),
            AppPersistentSheet(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onConfirm,
                  child: Text(widget.buttonText),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
