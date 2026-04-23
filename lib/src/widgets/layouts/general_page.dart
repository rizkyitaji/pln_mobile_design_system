import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppGeneralPage extends StatelessWidget {
  final bool extendBodyBehindAppBar;
  final EdgeInsetsGeometry? padding;
  final List<Widget> children;
  final Widget child, persistentSheet;
  final String? backgroundImage, title, refreshIndicatorIcon;
  final Color? backgroundColor, appBarColor, backButtonColor;
  final Future<void> Function()? onRefresh;
  final VoidCallback? onBackPressed;

  const AppGeneralPage({
    super.key,
    this.title,
    this.padding,
    this.extendBodyBehindAppBar = false,
    this.backgroundImage,
    this.children = const [],
    this.child = const SizedBox(),
    this.persistentSheet = const SizedBox(),
    this.backgroundColor,
    this.appBarColor,
    this.backButtonColor,
    this.refreshIndicatorIcon,
    this.onRefresh,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: AppBar(
        leading: AppBackButton(
          color: backButtonColor,
          onPressed: onBackPressed,
        ),
        backgroundColor: appBarColor,
        title: Text(title ?? ''),
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
          Positioned(bottom: 0, left: 0, right: 0, child: persistentSheet),
        ],
      ),
    );
  }

  Widget get _content {
    return ListView(
      padding: padding ?? EdgeInsets.all(AppSizes.s16),
      physics: AlwaysScrollableScrollPhysics(),
      children: [child, ...children],
    );
  }
}
