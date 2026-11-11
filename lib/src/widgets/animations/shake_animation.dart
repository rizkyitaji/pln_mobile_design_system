import 'dart:math';

import 'package:flutter/material.dart';

/// A widget that provides a horizontal shake animation effect.
///
/// Wrap any widget with [ShakeAnimation] and call [shake()] via the
/// [ShakeAnimationController] to trigger the shake effect.
///
/// Example:
/// ```dart
/// final shakeController = ShakeAnimationController();
///
/// ShakeAnimation(
///   controller: shakeController,
///   child: TextFormField(...),
/// )
///
/// // Trigger shake
/// shakeController.shake();
/// ```
class ShakeAnimation extends StatefulWidget {
  /// The widget to apply shake animation to.
  final Widget child;

  /// Controller to trigger the shake animation programmatically.
  final ShakeAnimationController? controller;

  /// Duration of the shake animation.
  /// Defaults to 500 milliseconds.
  final Duration duration;

  /// The maximum horizontal offset of the shake.
  /// Defaults to 10.0 pixels.
  final double shakeOffset;

  /// Number of shake oscillations.
  /// Defaults to 3.
  final int shakeCount;

  const ShakeAnimation({
    super.key,
    required this.child,
    this.controller,
    this.duration = const Duration(milliseconds: 500),
    this.shakeOffset = 10.0,
    this.shakeCount = 3,
  });

  @override
  State<ShakeAnimation> createState() => _ShakeAnimationState();
}

class _ShakeAnimationState extends State<ShakeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _offsetAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticIn,
      ),
    );

    widget.controller?._attach(this);
  }

  @override
  void didUpdateWidget(ShakeAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?._detach();
      widget.controller?._attach(this);
    }
  }

  @override
  void dispose() {
    widget.controller?._detach();
    _animationController.dispose();
    super.dispose();
  }

  void _shake() {
    _animationController.forward(from: 0.0);
  }

  double _calculateOffset(double animationValue) {
    // Creates a damped oscillation effect
    final progress = animationValue;
    final damping = 1.0 - progress;
    final sinValue =
        damping * sin(widget.shakeCount * 2 * 3.14159 * progress);
    return widget.shakeOffset * sinValue;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _offsetAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_calculateOffset(_offsetAnimation.value), 0),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

/// Controller for [ShakeAnimation] widget.
///
/// Call [shake()] to trigger the shake animation.
class ShakeAnimationController {
  _ShakeAnimationState? _state;

  void _attach(_ShakeAnimationState state) {
    _state = state;
  }

  void _detach() {
    _state = null;
  }

  /// Triggers the shake animation.
  void shake() {
    _state?._shake();
  }

  /// Returns true if the controller is attached to a [ShakeAnimation] widget.
  bool get isAttached => _state != null;
}


