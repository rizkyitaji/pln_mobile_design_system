import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppGeneralPage extends StatelessWidget {
  final VoidCallback? onBackPressed;
  final EdgeInsetsGeometry? padding;
  final List<Widget>? children, actionsAppBar;
  final Widget child, persistentSheet;
  final Widget? leadingAppBar, titleAppBar;
  final PreferredSizeWidget? bottomAppBar;
  final Future<void> Function()? onRefresh;
  final String? backgroundImage, title, refreshIndicatorIcon;
  final Color? backgroundColor, appBarColor, backButtonColor, titleColor;
  final double? initialChildSize,
      minChildSize,
      maxChildSize,
      paddingTop,
      backgroundImageHeight;
  final bool extendBodyBehindAppBar, automaticallyImplyLeading, showDragHandle;
  final ScrollPhysics? physics;

  const AppGeneralPage({
    super.key,
    this.title,
    this.padding,
    this.extendBodyBehindAppBar = false,
    this.backgroundImage,
    this.children,
    this.child = const SizedBox(),
    this.persistentSheet = const SizedBox(),
    this.backgroundColor,
    this.appBarColor,
    this.titleColor,
    this.backButtonColor,
    this.refreshIndicatorIcon,
    this.onRefresh,
    this.onBackPressed,
    this.leadingAppBar,
    this.titleAppBar,
    this.bottomAppBar,
    this.actionsAppBar,
    this.automaticallyImplyLeading = true,
    this.initialChildSize,
    this.minChildSize,
    this.maxChildSize,
    this.showDragHandle = false,
    this.physics,
    this.paddingTop,
    this.backgroundImageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:
            leadingAppBar ??
            (automaticallyImplyLeading
                ? AppBackButton(
                    color: backButtonColor,
                    onPressed: onBackPressed,
                  )
                : null),
        backgroundColor: appBarColor,
        title: titleAppBar ?? Text(title ?? ''),
        titleTextStyle: context.textTheme.headingSmall.copyWith(
          color: titleColor,
        ),
        bottom: bottomAppBar,
        actions: actionsAppBar,
      ),
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Visibility(
            visible: backgroundImage != null,
            child: Container(
              height: backgroundImageHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backgroundImage ?? ''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top:
                  paddingTop ??
                  (extendBodyBehindAppBar
                      ? context.paddingTop + kToolbarHeight
                      : 0),
            ),
            child: Visibility(
              visible: onRefresh != null,
              replacement: _content,
              child: AppRefreshIndicator(
                icon: refreshIndicatorIcon,
                onRefresh: onRefresh != null ? onRefresh! : () async {},
                child: _content,
              ),
            ),
          ),
          Visibility(
            visible: children != null,
            child: DraggableScrollableSheet(
              initialChildSize: initialChildSize ?? 0.2,
              minChildSize: minChildSize ?? 0.2,
              maxChildSize: maxChildSize ?? 0.88,
              builder: (context, scrollController) {
                return AppSheetContainer(
                  expand: true,
                  physics: physics,
                  showDragHandle: showDragHandle,
                  controller: scrollController,
                  children: children ?? [],
                );
              },
            ),
          ),
          Positioned(bottom: 0, left: 0, right: 0, child: persistentSheet),
        ],
      ),
    );
  }

  Widget get _content {
    return ListView(
      padding: padding ?? EdgeInsets.all(AppSizes.s16),
      physics: physics ?? AlwaysScrollableScrollPhysics(),
      children: [child],
    );
  }
}
