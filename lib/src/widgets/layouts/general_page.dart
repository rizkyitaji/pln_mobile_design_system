import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppGeneralPage extends StatelessWidget {
  final bool extendBodyBehindAppBar;
  final String? backgroundImage, title;
  final List<Widget> children, scrollableContent;
  final Widget child, persistentSheet;
  final Color? backgroundColor, appBarColor, backButtonColor;
  final Future<void> Function()? onRefresh;
  final VoidCallback? onBackPressed;
  final double initialChildSize, minChildSize, maxChildSize;

  const AppGeneralPage({
    super.key,
    this.extendBodyBehindAppBar = false,
    this.backgroundImage,
    this.children = const [],
    this.scrollableContent = const [],
    this.child = const SizedBox(),
    this.persistentSheet = const SizedBox(),
    this.backgroundColor,
    this.appBarColor,
    this.backButtonColor,
    this.title,
    this.onRefresh,
    this.onBackPressed,
    this.initialChildSize = 0.2,
    this.minChildSize = 0.2,
    this.maxChildSize = 0.88,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: DSAppBar(
        title: title,
        backgroundColor: appBarColor,
        backButtonColor: backButtonColor,
        onBackPressed: onBackPressed,
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
                onRefresh: onRefresh != null ? onRefresh! : () async {},
                child: _content,
              ),
            ),
          ),
          Visibility(
            visible: scrollableContent.isNotEmpty,
            child: DraggableScrollableSheet(
              initialChildSize: initialChildSize,
              minChildSize: minChildSize,
              maxChildSize: maxChildSize,
              builder: (context, scrollController) {
                return AppSheetContainer(
                  scrollController: scrollController,
                  children: scrollableContent,
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
      padding: EdgeInsets.all(AppSizes.s16),
      physics: AlwaysScrollableScrollPhysics(),
      children: [child, ...children],
    );
  }
}
