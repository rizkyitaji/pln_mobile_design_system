import 'package:flutter/widgets.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

enum ContentItemType { row, column }

class AppContentItem extends StatefulWidget {
  final String? label, value;
  final ContentItemType type;
  final TextStyle? labelStyle, valueStyle;
  final Widget? labelTrailing, valueTrailing;
  final int flex;
  final List<Widget>? children;
  final bool initiallyExpanded;
  final TextAlign? textAlign;

  const AppContentItem({
    super.key,
    this.label,
    this.value,
    this.flex = 1,
    this.labelStyle,
    this.valueStyle,
    this.labelTrailing,
    this.valueTrailing,
    this.type = ContentItemType.row,
    this.children,
    this.initiallyExpanded = false,
    this.textAlign,
  });

  @override
  State<AppContentItem> createState() => _AppContentItemState();
}

class _AppContentItemState extends State<AppContentItem>
    with TickerProviderStateMixin {
  late bool _isExpanded;
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _sizeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    );

    if (_isExpanded) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    if (widget.children == null || widget.children!.isEmpty) return;

    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final hasChildren = widget.children != null && widget.children!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: hasChildren ? _toggleExpand : null,
          behavior: HitTestBehavior.opaque,
          child: _buildMainContent,
        ),
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return SizeTransition(
              sizeFactor: _sizeAnimation,
              axisAlignment: -1.0,
              child: Visibility(
                visible: _animationController.value > 0.0 || _isExpanded,
                maintainState: true,
                child: child!,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(top: AppSizes.s8),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: AppSizes.s4,
                    decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: AppRadius.leftRounded4,
                    ),
                  ),
                  AppSpacing.w8,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: AppSizes.s8,
                      children: widget.children ?? [],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget get _buildMainContent {
    final labelTrailing = widget.labelTrailing;
    final valueTrailing = widget.valueTrailing;
    final children = widget.children ?? [];

    switch (widget.type) {
      case ContentItemType.row:
        return Row(
          spacing: AppSizes.s8,
          children: [
            Expanded(
              child: Wrap(
                spacing: AppSizes.s4,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    widget.label ?? '-',
                    style:
                        widget.labelStyle ??
                        context.textTheme.bodyCaptionMedium,
                  ),
                  if (labelTrailing != null) labelTrailing,
                  if (children.isNotEmpty)
                    AnimatedRotation(
                      turns: _isExpanded ? 0.5 : 0.0,
                      duration: const Duration(milliseconds: 250),
                      child: AppImage(
                        asset: AppAssets.iconChevronDown,
                        color: AppColors.iconSubtle,
                        size: AppSizes.s14,
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: widget.flex,
              child: Row(
                spacing: AppSizes.s4,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.value ?? '-',
                    textAlign: widget.textAlign ?? TextAlign.end,
                    style:
                        widget.valueStyle ??
                        context.textTheme.bodyCaptionSemiBold,
                  ),
                  if (valueTrailing != null) valueTrailing,
                ],
              ),
            ),
          ],
        );
      case ContentItemType.column:
        return Column(
          spacing: AppSizes.s4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: AppSizes.s4,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  widget.label ?? '-',
                  style: widget.labelStyle ?? context.textTheme.bodyCaption,
                ),
                if (labelTrailing != null) labelTrailing,
                if (children.isNotEmpty)
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 250),
                    child: AppImage(
                      asset: AppAssets.iconChevronDown,
                      color: AppColors.iconSubtle,
                      size: AppSizes.s14,
                    ),
                  ),
              ],
            ),
            Row(
              spacing: AppSizes.s4,
              children: [
                Expanded(
                  child: Text(
                    widget.value ?? '-',
                    style:
                        widget.valueStyle ??
                        context.textTheme.bodyMediumSemiBold,
                  ),
                ),
                if (valueTrailing != null) valueTrailing,
                if (children.isNotEmpty)
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 250),
                    child: AppImage(
                      asset: AppAssets.iconChevronDown,
                      color: AppColors.iconSubtle,
                      size: AppSizes.s14,
                    ),
                  ),
              ],
            ),
          ],
        );
    }
  }
}
