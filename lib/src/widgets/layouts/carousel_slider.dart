import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppCarouselSlider extends StatefulWidget {
  final int itemCount;
  final ValueChanged<int>? onPageChanged;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final double viewportFraction, spacing, paddingHorizontal;
  final bool autoSlide;
  final Duration autoSlideDuration;

  const AppCarouselSlider({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.onPageChanged,
    this.viewportFraction = 0.88,
    this.spacing = AppSizes.s16,
    this.paddingHorizontal = AppSizes.s16,
    this.autoSlide = false,
    this.autoSlideDuration = const Duration(seconds: 2),
  });

  @override
  State<AppCarouselSlider> createState() => _AppCarouselSliderState();
}

class _AppCarouselSliderState extends State<AppCarouselSlider> {
  late ScrollController _scrollController;
  int _currentIndex = 0;
  Timer? _autoSlideTimer;
  double _currentScrollStep = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _stopAutoSlide();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    if (!widget.autoSlide || widget.itemCount <= 1) return;

    _stopAutoSlide();

    _autoSlideTimer = Timer.periodic(widget.autoSlideDuration, (timer) {
      if (!_scrollController.hasClients) return;

      final nextIndex = (_currentIndex + 1) % widget.itemCount;

      _scrollController.animateTo(
        nextIndex * _currentScrollStep,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  void _stopAutoSlide() {
    _autoSlideTimer?.cancel();
    _autoSlideTimer = null;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth =
            constraints.maxWidth - (widget.paddingHorizontal * 2);

        final baseWidth = availableWidth * widget.viewportFraction;
        final scrollStep = baseWidth + widget.spacing;
        _currentScrollStep = scrollStep;

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            if (notification is ScrollStartNotification) {
              _stopAutoSlide();
            } else if (notification is ScrollEndNotification) {
              _startAutoSlide();
            }

            if (notification is ScrollUpdateNotification) {
              final metrics = notification.metrics;
              final exactPage = metrics.pixels / scrollStep;
              final newIndex = exactPage.round().clamp(0, widget.itemCount - 1);

              if (newIndex != _currentIndex) {
                _currentIndex = newIndex;
                widget.onPageChanged?.call(newIndex);
              }
            }
            return false;
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            physics: SnappingScrollPhysics(snapSize: scrollStep),
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

class SnappingScrollPhysics extends ScrollPhysics {
  final double snapSize;

  const SnappingScrollPhysics({required this.snapSize, super.parent});

  @override
  SnappingScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return SnappingScrollPhysics(
      snapSize: snapSize,
      parent: buildParent(ancestor),
    );
  }

  @override
  Simulation? createBallisticSimulation(
    ScrollMetrics position,
    double velocity,
  ) {
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }

    final double currentExactPage = position.pixels / snapSize;

    int currentPage = currentExactPage.round();
    int targetPage = currentPage;

    if (velocity > 400.0) {
      targetPage = currentExactPage.floor() + 1;
    } else if (velocity < -400.0) {
      targetPage = currentExactPage.ceil() - 1;
    } else {
      targetPage = currentPage;
    }

    final int maxPage = (position.maxScrollExtent / snapSize).round();
    targetPage = targetPage.clamp(0, maxPage);

    final double targetPixels = targetPage * snapSize;

    if (targetPixels != position.pixels) {
      return ScrollSpringSimulation(
        spring,
        position.pixels,
        targetPixels,
        velocity,
      );
    }

    return null;
  }
}
