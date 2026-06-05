import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppCarouselSlider extends StatefulWidget {
  final int itemCount;
  final ValueChanged<int>? onPageChanged;
  final Widget Function(BuildContext context, int index) itemBuilder;
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
  late ScrollController _scrollController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    setState(() {
                      _currentIndex = newIndex;
                    });
                    widget.onPageChanged?.call(newIndex);
                  }
                });
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

  double _getTargetPixels(
    ScrollMetrics metrics,
    double velocity,
    double targetPixels,
  ) {
    double page = targetPixels / snapSize;
    if (velocity < -500.0) {
      page = page.floorToDouble();
    } else if (velocity > 500.0) {
      page = page.ceilToDouble();
    } else {
      page = page.roundToDouble();
    }

    final computedTarget = page * snapSize;

    if (computedTarget >= metrics.maxScrollExtent) {
      return metrics.maxScrollExtent;
    }

    return computedTarget;
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

    final Simulation? simulation = super.createBallisticSimulation(
      position,
      velocity,
    );

    if (simulation != null) {
      final double targetPixels = simulation.x(double.infinity);
      final double snapPixels = _getTargetPixels(
        position,
        velocity,
        targetPixels,
      );

      if (snapPixels != targetPixels) {
        return ScrollSpringSimulation(
          spring,
          position.pixels,
          snapPixels,
          velocity,
        );
      }
    }
    return simulation;
  }
}
