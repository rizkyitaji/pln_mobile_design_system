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

  @override
  void didUpdateWidget(covariant AppCountdownBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Jika timer berubah atau di-reset jadi null, reset flag _hasStopped
    if (oldWidget.timer != widget.timer) {
      _hasStopped = false;
    }
  }

  void _triggerStop() {
    // Jika timer null, DILARANG TRIGGER onStop!
    if (_hasStopped || !mounted || widget.timer == null) return;
    _hasStopped = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && widget.timer != null) {
        widget.onStop?.call();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final timer = widget.timer;

    // Jika timer yg dipasang null, matikan widget & hilangkan dari tree
    if (timer == null) return const SizedBox();

    final now = DateTime.now();
    final remaining = timer.difference(now);

    // Cek jika saat dibuka, timer memang sudah kedaluwarsa
    if (remaining <= Duration.zero) {
      _triggerStop();
      return _countdown(hours: '00', minutes: '00', seconds: '00');
    }

    return TimerBuilder.scheduled(
      [timer],
      builder: (context) {
        final current = DateTime.now();
        final currentRemaining = timer.difference(current);

        if (currentRemaining <= Duration.zero) {
          _triggerStop();
          return _countdown(hours: '00', minutes: '00', seconds: '00');
        }

        return TimerBuilder.periodic(
          const Duration(seconds: 1),
          alignment: Duration.zero,
          builder: (context) {
            final periodicCurrent = DateTime.now();
            final periodicRemaining = timer.difference(periodicCurrent);

            if (periodicRemaining <= Duration.zero) {
              _triggerStop();
              return _countdown(hours: '00', minutes: '00', seconds: '00');
            }

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
