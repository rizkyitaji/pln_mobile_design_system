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
      case 'mmmsd':
        return '${minutes}m ${seconds}d';
      case 'mm:ss':
        return '$minutes : $seconds';
      default:
        return '$hours : $minutes : $seconds';
    }
  }
}
