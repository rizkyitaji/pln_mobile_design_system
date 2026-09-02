import 'package:flutter/widgets.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppCarouselIndicator extends StatelessWidget {
  final List list;
  final int currentIndex;
  final Color? color;

  const AppCarouselIndicator({
    super.key,
    required this.list,
    required this.currentIndex,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: list.length > 1,
      child: Row(
        children: list.map((e) {
          int index = list.indexOf(e);
          return Container(
            width: index == currentIndex ? AppSizes.s16 : AppSizes.s4,
            height: AppSizes.s4,
            margin: EdgeInsets.only(
              left: index == AppSizes.zero ? AppSizes.s16 : AppSizes.zero,
              right: AppSizes.s4,
            ),
            decoration: BoxDecoration(
              color: (color ?? AppColors.primaryPressed).withValues(
                alpha: index == currentIndex ? 1 : 0.6,
              ),
              borderRadius: AppRadius.rounded32,
            ),
          );
        }).toList(),
      ),
    );
  }
}
