import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppGeneralPage extends StatelessWidget {
  final VoidCallback? onBackPressed;
  final EdgeInsetsGeometry? padding;
  final List<Widget>? children, actionsAppBar;
  final Widget child;
  final Widget? leadingAppBar,
      titleAppBar,
      floatingActionButton,
      persistentSheet;
  final PreferredSizeWidget? bottomAppBar;
  final Future<void> Function()? onRefresh;
  final String? backgroundImage, backgroundNetworkImage, title;
  final Color? backgroundColor, appBarColor, backButtonColor, titleColor;
  final double? initialChildSize,
      minChildSize,
      maxChildSize,
      paddingTop,
      backgroundImageHeight,
      titleSpacing;
  final bool extendBodyBehindAppBar,
      automaticallyImplyLeading,
      showDragHandle,
      isLoadingMore;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final ScrollPhysics? physics;
  final ScrollController? scrollController;
  final bool? useSafeArea,
      topSafeArea,
      bottomSafeArea,
      leftSafeArea,
      rightSafeArea;

  const AppGeneralPage({
    super.key,
    this.title,
    this.padding,
    this.extendBodyBehindAppBar = false,
    this.backgroundImage,
    this.backgroundNetworkImage,
    this.children,
    this.child = const SizedBox(),
    this.persistentSheet,
    this.backgroundColor,
    this.appBarColor,
    this.titleColor,
    this.backButtonColor,
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
    this.titleSpacing,
    this.scrollController,
    this.isLoadingMore = false,
    this.useSafeArea = false,
    this.topSafeArea = false,
    this.bottomSafeArea = false,
    this.leftSafeArea = false,
    this.rightSafeArea = false,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: bottomSafeArea ?? useSafeArea ?? false,
      top: topSafeArea ?? useSafeArea ?? false,
      left: leftSafeArea ?? useSafeArea ?? false,
      right: rightSafeArea ?? useSafeArea ?? false,
      child: Scaffold(
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: titleSpacing,
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
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        body: Stack(
          children: [
            Visibility(
              visible: backgroundNetworkImage != null,
              replacement: Visibility(
                visible: backgroundImage != null,
                child: AppImage(
                  asset: backgroundImage ?? '',
                  width: double.infinity,
                  height: backgroundImageHeight,
                  fit: BoxFit.fill,
                  size: null,
                ),
              ),
              child: AppNetworkImage(
                url: backgroundNetworkImage,
                height: backgroundImageHeight,
                errorImage: backgroundImage,
                fit: BoxFit.fill,
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
                    padding: padding,
                    showDragHandle: showDragHandle,
                    controller: scrollController,
                    children: children ?? [],
                  );
                },
              ),
            ),
            if (persistentSheet != null)
              Positioned(bottom: 0, left: 0, right: 0, child: persistentSheet!),
          ],
        ),
      ),
    );
  }

  Widget get _content {
    return ListView(
      controller: scrollController,
      padding:
          padding ??
          EdgeInsets.only(
            top: AppSizes.s16,
            right: AppSizes.s16,
            left: AppSizes.s16,
            bottom: persistentSheet != null ? AppSizes.s120 : AppSizes.s16,
          ),
      physics: physics ?? AlwaysScrollableScrollPhysics(),
      children: [
        child,
        if (isLoadingMore)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.s16),
            child: Center(child: AppLoadingIndicator(size: AppSizes.s40)),
          ),
      ],
    );
  }
}
