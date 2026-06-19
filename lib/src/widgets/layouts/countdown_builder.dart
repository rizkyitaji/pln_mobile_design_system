import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';
import 'package:timer_builder/timer_builder.dart';

class AppCountdownBuilder extends StatefulWidget {
  final DateTime? timer;
  final VoidCallback? onStop;
  final String? type, format;
  final TextStyle? textStyle;

  const AppCountdownBuilder({
    super.key,
    this.timer,
    this.onStop,
    this.type,
    this.format,
    this.textStyle,
  });

  @override
  State<AppCountdownBuilder> createState() => _AppCountdownBuilderState();
}

class _AppCountdownBuilderState extends State<AppCountdownBuilder> {
  bool _hasStopped = false;
  bool _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  void _triggerStop() {
    if (_hasStopped || _disposed) return;
    _hasStopped = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_disposed) widget.onStop?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_disposed) return const SizedBox();

    final timer = widget.timer;
    if (timer == null) return const SizedBox();

    return TimerBuilder.scheduled(
      [timer],
      builder: (context) {
        if (_disposed) return const SizedBox();

        final now = DateTime.now();
        final remaining = timer.difference(now);
        final stop = remaining <= Duration.zero;

        if (stop) {
          _triggerStop();
          return _countdown(hours: '00', minutes: '00', seconds: '00');
        }

        return TimerBuilder.periodic(
          const Duration(seconds: 1),
          alignment: Duration.zero,
          builder: (context) {
            if (_disposed) return const SizedBox();

            final current = DateTime.now();
            final periodicRemaining = timer.difference(current);

            return _countdown(
              hours: periodicRemaining.format('hh'),
              minutes: periodicRemaining.format('mm'),
              seconds: periodicRemaining.format('ss'),
            );
          },
        );
      },
    );
  }

  Widget _countdown({
    required String hours,
    required String minutes,
    required String seconds,
  }) {
    switch (widget.type) {
      case 'box':
        return Row(
          spacing: AppSizes.s4,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: AppSizes.s6,
                horizontal: AppSizes.s8,
              ),
              decoration: BoxDecoration(
                borderRadius: AppRadius.rounded4,
                color: AppColors.warningSubtle,
              ),
              child: Text(
                minutes,
                style: context.textTheme.bodyCaptionSemiBold.copyWith(
                  color: AppColors.textWarning,
                ),
              ),
            ),
            Text(
              ':',
              style: context.textTheme.bodyCaptionSemiBold.copyWith(
                color: AppColors.textWarning,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: AppSizes.s6,
                horizontal: AppSizes.s8,
              ),
              decoration: BoxDecoration(
                borderRadius: AppRadius.rounded4,
                color: AppColors.warningSubtle,
              ),
              child: Text(
                seconds,
                style: context.textTheme.bodyCaptionSemiBold.copyWith(
                  color: AppColors.textWarning,
                ),
              ),
            ),
          ],
        );
      case 'text':
        return Text(
          _formattedText(hours: hours, minutes: minutes, seconds: seconds),
          style:
              widget.textStyle ??
              context.textTheme.bodyCaptionSemiBold.copyWith(
                color: AppColors.textWarning,
              ),
        );
      default:
        return const SizedBox();
    }
  }

  String _formattedText({
    required String hours,
    required String minutes,
    required String seconds,
  }) {
    switch (widget.format) {
      case 'mm:ss':
        return '$minutes : $seconds';
      default:
        return '$hours : $minutes : $seconds';
    }
  }
}
