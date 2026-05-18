import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppBackButton extends StatelessWidget {
  final Color? color;
  final String? asset;
  final VoidCallback? onPressed;

  const AppBackButton({super.key, this.color, this.asset, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () => context.safePop(),
      icon: SvgPicture.asset(
        asset ?? AppAssets.iconArrowShortLeft,
        width: AppSizes.s24,
        height: AppSizes.s24,
        colorFilter: color != null
            ? ColorFilter.mode(color ?? AppColors.icon, BlendMode.srcIn)
            : null,
      ),
    );
  }
}
