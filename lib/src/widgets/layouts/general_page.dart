import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppGeneralPage extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final List<Widget>? children, actionsAppBar;
  final Widget child, persistentSheet;
  final Widget? leadingAppBar, titleAppBar;
  final String? backgroundImage, title, refreshIndicatorIcon;
  final Color? backgroundColor, appBarColor, backButtonColor, titleColor;
  final Future<void> Function()? onRefresh;
  final VoidCallback? onBackPressed;
  final PreferredSizeWidget? bottomAppBar;
  final double? initialChildSize, minChildSize, maxChildSize;
  final bool extendBodyBehindAppBar, automaticallyImplyLeading, showDragHandle;

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
    this.automaticallyImplyLeading = false,
    this.initialChildSize,
    this.minChildSize,
    this.maxChildSize,
    this.showDragHandle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        leading:
            leadingAppBar ??
            (automaticallyImplyLeading
                ? null
                : AppBackButton(
                    color: backButtonColor,
                    onPressed: onBackPressed,
                  )),
        backgroundColor: appBarColor,
        title: titleAppBar ?? Text(title ?? ''),
        titleTextStyle: AppTextStyles.headingSmall.copyWith(color: titleColor),
        bottom: bottomAppBar,
        actions: actionsAppBar,
      ),
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Visibility(
            visible: backgroundImage != null,
            child: Container(
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
              top: MediaQuery.of(context).padding.top + kToolbarHeight,
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
      physics: AlwaysScrollableScrollPhysics(),
      children: [child],
    );
  }
}
