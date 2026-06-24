import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppExpansionTile extends StatefulWidget {
  /// Creates a single-line tile with a trailing button that expands or collapses
  /// the tile to reveal or hide the [children]. The [initiallyExpanded] property must
  /// be non-null.
  const AppExpansionTile({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    this.backgroundColor,
    this.iconColor,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing,
    this.initiallyExpanded = false,
    this.crossAxisAlignmentTitle = CrossAxisAlignment.center,
    this.alignment = Alignment.center,
    this.padding,
    this.value,
    this.decorationTitle,
    this.decorationChildren,
  });

  final bool? value;

  /// A widget to display before the title.
  final Widget? leading;

  /// The primary content of the list item.
  ///
  /// Typically a [Text] widget.
  final Widget title;

  /// Additional content displayed below the title.
  ///
  /// Typically a [Text] widget.
  final Widget? subtitle;

  /// Called when the tile expands or collapses.
  ///
  /// When the tile starts expanding, this function is called with the value
  /// true. When the tile starts collapsing, this function is called with
  /// the value false.
  final ValueChanged<bool>? onExpansionChanged;

  /// The widgets that are displayed when the tile expands.
  final List<Widget> children;

  /// The color to display behind the sublist when expanded.
  final Color? backgroundColor;

  /// The color to display expand icon.
  final Color? iconColor;

  /// A widget to display instead of a rotating arrow icon.
  final Widget? trailing;

  /// Specifies if the list tile is initially expanded (true) or collapsed (false, the default).
  final bool initiallyExpanded;

  final CrossAxisAlignment crossAxisAlignmentTitle;

  final EdgeInsetsGeometry? padding;

  final Alignment alignment;

  /// A decoration for title widget
  final Decoration? decorationTitle;

  final Decoration? decorationChildren;

  @override
  State<AppExpansionTile> createState() => _AppExpansionTileState();
}

class _AppExpansionTileState extends State<AppExpansionTile>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween = CurveTween(
    curve: Curves.easeOut,
  );
  static final Animatable<double> _easeInTween = CurveTween(
    curve: Curves.easeIn,
  );
  static final Animatable<double> _halfTween = Tween<double>(
    begin: 0.0,
    end: 0.5,
  );

  final ColorTween _borderColorTween = ColorTween();
  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();
  final ColorTween _backgroundColorTween = ColorTween();

  late AnimationController _controller;
  late Animation<double> _heightFactor;
  late Animation<Color?> _backgroundColor;
  late Animation<double> _iconTurns;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _heightFactor = _controller.drive(_easeInTween);
    _backgroundColor = _controller.drive(
      _backgroundColorTween.chain(_easeOutTween),
    );

    _isExpanded =
        PageStorage.of(context).readState(context) ?? widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AppExpansionTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != null) {
      if (oldWidget.value != widget.value) {
        _handleTap();
      }
    }
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.of(context).writeState(context, _isExpanded);
    });
    if (widget.onExpansionChanged != null) {
      widget.onExpansionChanged!(_isExpanded);
    }
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    return Container(
      decoration: BoxDecoration(
        color: _backgroundColor.value ?? AppColors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
            onTap: _handleTap,
            child: Container(
              width: double.infinity,
              padding:
                  widget.padding ?? const EdgeInsets.only(right: AppSizes.s6),
              decoration: widget.decorationTitle,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: widget.crossAxisAlignmentTitle,
                children: <Widget>[
                  Flexible(
                    child: Row(
                      children: [
                        if (widget.leading != null) widget.leading!,
                        Flexible(child: widget.title),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      if (widget.trailing != null) widget.trailing!,
                      RotationTransition(
                        turns: _iconTurns,
                        child: SvgPicture.asset(
                          width: AppSizes.s24,
                          height: AppSizes.s24,
                          AppAssets.iconChevronDown,
                          colorFilter: ColorFilter.mode(
                            widget.iconColor ?? AppColors.iconSubtle,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      AppSpacing.w12,
                    ],
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: !_isExpanded,
            child: widget.subtitle ?? const SizedBox(),
          ),
          ClipRect(
            child: Align(
              alignment: widget.alignment,
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    _borderColorTween.end = theme.dividerColor;
    _headerColorTween
      ..begin = theme.textTheme.titleMedium?.color
      ..end = theme.colorScheme.secondary;
    _iconColorTween
      ..begin = theme.unselectedWidgetColor
      ..end = theme.colorScheme.secondary;
    _backgroundColorTween.end = widget.backgroundColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: closed
          ? null
          : Container(
              decoration: widget.decorationChildren,
              margin: widget.decorationChildren != null
                  ? const EdgeInsets.only(bottom: AppSizes.s16)
                  : null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.children,
              ),
            ),
    );
  }
}
