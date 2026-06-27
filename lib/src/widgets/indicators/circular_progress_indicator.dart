import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  final double progress;
  final double size;
  final double strokeWidth;
  final Color? color;
  final List<Color>? gradientColors;

  const AppCircularProgressIndicator({
    super.key,
    required this.progress,
    this.size = AppSizes.s24,
    this.strokeWidth = AppSizes.s6,
    this.color,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _GradientCircularProgressPainter(
          progress: progress,
          strokeWidth: strokeWidth,
          color: color,
          gradientColors: gradientColors,
        ),
      ),
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color? color;
  final List<Color>? gradientColors;

  _GradientCircularProgressPainter({
    required this.progress,
    required this.strokeWidth,
    this.color,
    this.gradientColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final paint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    if (gradientColors != null && gradientColors!.isNotEmpty) {
      paint.shader = SweepGradient(
        colors: gradientColors!,
        startAngle: 0.0,
        endAngle: pi * 2,
        transform: const GradientRotation(-pi / 2),
      ).createShader(rect);
    } else if (color != null) {
      paint.color = color!;
    }

    canvas.drawArc(
      rect,
      -pi / 2,
      pi * 2 * progress.clamp(0.0, 1.0),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _GradientCircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.gradientColors != gradientColors;
  }
}
