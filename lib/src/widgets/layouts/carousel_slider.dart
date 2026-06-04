import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppCarouselSlider extends StatefulWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final ValueChanged<int>? onPageChanged;
  final double viewportFraction, spacing, paddingHorizontal;

  const AppCarouselSlider({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.onPageChanged,
    this.viewportFraction = 0.88,
    this.spacing = AppSizes.s16,
    this.paddingHorizontal = AppSizes.s16,
  });

  @override
  State<AppCarouselSlider> createState() => _AppCarouselSliderState();
}

class _AppCarouselSliderState extends State<AppCarouselSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth =
            constraints.maxWidth - (widget.paddingHorizontal * 2);
        final baseWidth = availableWidth * widget.viewportFraction;

        final scrollStep = baseWidth + widget.spacing;

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            if (notification is ScrollUpdateNotification) {
              final metrics = notification.metrics;

              final exactPage = metrics.pixels / scrollStep;
              final newIndex = exactPage.round().clamp(0, widget.itemCount - 1);

              if (newIndex != _currentIndex) {
                setState(() {
                  _currentIndex = newIndex;
                });
                if (widget.onPageChanged != null) {
                  widget.onPageChanged?.call(newIndex);
                }
              }
            }
            return false;
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const PageScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: widget.paddingHorizontal),
            child: Row(
              children: List.generate(widget.itemCount, (index) {
                return Container(
                  width: baseWidth,
                  margin: EdgeInsets.only(
                    right: index == widget.itemCount - 1 ? 0 : widget.spacing,
                  ),
                  child: widget.itemBuilder(context, index),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
