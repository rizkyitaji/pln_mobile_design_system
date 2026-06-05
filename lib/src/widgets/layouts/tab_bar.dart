import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppTabBar extends StatelessWidget {
  final List<String> tabs;
  final EdgeInsetsGeometry? margin;

  const AppTabBar({super.key, required this.tabs, this.margin});

  @override
  Widget build(BuildContext context) {
    final tabController = DefaultTabController.of(context);

    return Container(
      margin: margin,
      child: AnimatedBuilder(
        animation: tabController,
        builder: (context, child) {
          return TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            dividerColor: AppColors.transparent,
            indicatorPadding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            labelColor: AppColors.textPrimary,
            unselectedLabelColor: AppColors.textCaption,
            labelStyle: context.textTheme.bodyCaptionSemiBold,
            unselectedLabelStyle: context.textTheme.bodyCaptionSemiBold,
            indicator: const BoxDecoration(),
            splashFactory: NoSplash.splashFactory,
            splashBorderRadius: AppRadius.rounded32,
            overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (states.contains(WidgetState.pressed)) {
                return AppColors.transparent;
              }
              return null;
            }),
            tabs: List.generate(tabs.length, (index) {
              final bool isActive = tabController.index == index;

              return Tab(
                child: AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 200),
                  margin: EdgeInsets.only(
                    right: index == tabs.length - 1 ? 0 : AppSizes.s8,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSizes.s8,
                    horizontal: AppSizes.s16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: AppRadius.rounded32,
                    color: isActive
                        ? AppColors.primarySubtle
                        : AppColors.transparent,
                    border: Border.all(
                      color: isActive
                          ? AppColors.borderPrimary
                          : AppColors.border,
                    ),
                  ),
                  child: Text(tabs[index]),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
