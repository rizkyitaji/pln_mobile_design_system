import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppSliderButton extends StatefulWidget {
  final String text;
  final String? completedText;
  final VoidCallback onCompleted;
  final Color backgroundColor;
  final Color activeBackgroundColor;
  final Color handleColor;
  final Color iconColor;
  final TextStyle? textStyle;

  const AppSliderButton({
    super.key,
    required this.text,
    required this.onCompleted,
    this.completedText,
    this.backgroundColor = AppColors.primary,
    this.activeBackgroundColor = AppColors.primaryPressed,
    this.handleColor = AppColors.white,
    this.iconColor = AppColors.iconPrimary,
    this.textStyle,
  });

  @override
  State<AppSliderButton> createState() => _AppSliderButtonState();
}

class _AppSliderButtonState extends State<AppSliderButton>
    with SingleTickerProviderStateMixin {
  double _dragPosition = 0.0;
  bool _isCompleted = false;

  late AnimationController _animController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0.0, end: 0.0).animate(_animController);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _animateReset(double fromPosition) {
    _animation =
        Tween<double>(begin: fromPosition, end: 0.0).animate(
          CurvedAnimation(parent: _animController, curve: Curves.easeOutCubic),
        )..addListener(() {
          setState(() {
            _dragPosition = _animation.value;
          });
        });

    setState(() {
      _isCompleted = false;
    });

    _animController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    const double buttonHeight = 56.0;
    const double handleSize = 44.0;
    const double paddingValue = 6.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxDragDistance =
            constraints.maxWidth - handleSize - (paddingValue * 2);

        final String currentText = _isCompleted
            ? (widget.completedText ?? widget.text)
            : widget.text;

        final double currentActiveWidth = _isCompleted
            ? constraints.maxWidth
            : (_dragPosition + handleSize + (paddingValue * 2));

        return Container(
          height: buttonHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(buttonHeight / 2),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                width: currentActiveWidth,
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.activeBackgroundColor,
                    borderRadius: BorderRadius.circular(buttonHeight / 2),
                  ),
                ),
              ),
              Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: Text(
                    currentText,
                    key: ValueKey<String>(currentText),
                    style:
                        widget.textStyle ??
                        context.textTheme.bodyMediumSemiBold.copyWith(
                          color: AppColors.textOnColorHeading,
                        ),
                  ),
                ),
              ),
              Positioned(
                left: _dragPosition + paddingValue,
                top: paddingValue,
                bottom: paddingValue,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    if (_isCompleted || _animController.isAnimating) return;
                    setState(() {
                      _dragPosition += details.delta.dx;
                      if (_dragPosition < 0) _dragPosition = 0;
                      if (_dragPosition > maxDragDistance) {
                        _dragPosition = maxDragDistance;
                      }
                    });
                  },
                  onHorizontalDragEnd: (details) async {
                    if (_isCompleted || _animController.isAnimating) return;

                    if (_dragPosition >= maxDragDistance * 0.85) {
                      setState(() {
                        _dragPosition = maxDragDistance;
                        _isCompleted = true;
                      });

                      widget.onCompleted();

                      await Future.delayed(const Duration(milliseconds: 500));
                      if (mounted && _isCompleted) {
                        _animateReset(maxDragDistance);
                      }
                    } else {
                      _animateReset(_dragPosition);
                    }
                  },
                  child: Container(
                    width: handleSize,
                    height: handleSize,
                    decoration: BoxDecoration(
                      color: widget.handleColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: AppImage(
                          asset: _isCompleted
                              ? AppAssets.iconCheck
                              : AppAssets.iconArrowShortRight,
                          key: ValueKey<bool>(_isCompleted),
                          color: _isCompleted
                              ? widget.activeBackgroundColor
                              : widget.iconColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
