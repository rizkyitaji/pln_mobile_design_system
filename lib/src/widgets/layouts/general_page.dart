import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppGeneralPage extends StatelessWidget {
  final bool extendBodyBehindAppBar;
  final String? backgroundImage, title;
  final List<Widget> children;
  final Widget child, bottomSheet;
  final Color? backgroundColor, appBarColor, backButtonColor;
  final Future<void> Function()? onRefresh;
  final VoidCallback? onBackPressed;

  const AppGeneralPage({
    super.key,
    this.extendBodyBehindAppBar = false,
    this.backgroundImage,
    this.children = const [],
    this.child = const SizedBox(),
    this.bottomSheet = const SizedBox(),
    this.backgroundColor,
    this.appBarColor,
    this.backButtonColor,
    this.title,
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
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top + kToolbarHeight,
              ),
              Expanded(
                child: Visibility(
                  visible: onRefresh != null,
                  replacement: _content,
                  child: AppRefreshIndicator(
                    onRefresh: onRefresh != null ? onRefresh! : () async {},
                    child: _content,
                  ),
                ),
              ),
              bottomSheet,
            ],
          ),
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
