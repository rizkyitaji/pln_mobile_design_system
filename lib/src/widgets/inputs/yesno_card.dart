import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppYesNoCard<T> extends StatelessWidget {
  final String label;
  final bool required;
  final List<OptionModelYesNo<T>> items;
  final T? selected;
  final ValueChanged<T?> onChanged;
  final VoidCallback? onInfoTap;
  final String? errorText;
  final bool? isRequired;
  final bool? isColumn;
  final TextStyle? labelStyle;
  final Key? infoKey;

  const AppYesNoCard({
    super.key,
    required this.label,
    this.required = false,
    required this.items,
    required this.selected,
    required this.onChanged,
    this.onInfoTap,
    this.errorText,
    this.isRequired,
    this.isColumn,
    this.labelStyle,
    this.infoKey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AppFieldLabel(
                label: label,
                required: isRequired ?? false,
                style: labelStyle,
              ),
            ),
            if (onInfoTap != null) ...[
              const SizedBox(width: AppSizes.s8),
              GestureDetector(
                key: infoKey,
                onTap: onInfoTap,
                child: const Icon(
                  Icons.info_outline_rounded,
                  color: AppColors.iconInfo,
                  size: AppSizes.s20,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: AppSizes.s16),
        if (isColumn ?? false) ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final item in items) ...[
                _YesNoOptionTile<T>(
                  item: item,
                  isSelected: selected == item.value,
                  onTap: () {
                    final active = selected == item.value;
                    onChanged(active ? null : item.value);
                  },
                ),
                AppSpacing.h8,
              ],
            ],
          ),
        ] else ...[
          Row(
            children: [
              for (int i = 0; i < items.length; i++) ...[
                if (i > 0) const SizedBox(width: AppSizes.s12),
                Expanded(
                  child: _YesNoOptionTile<T>(
                    item: items[i],
                    isSelected: selected == items[i].value,
                    onTap: () {
                      final active = selected == items[i].value;
                      onChanged(active ? null : items[i].value);
                    },
                  ),
                ),
              ],
            ],
          ),
        ],
        if (errorText != null && errorText!.isNotEmpty) ...[
          const SizedBox(height: AppSizes.s4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.s4),
            child: Text(
              errorText!,
              style: context.textTheme.bodySmall.copyWith(
                color: AppColors.textError,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class OptionModelYesNo<T> {
  final T value;
  final String label;

  const OptionModelYesNo({required this.value, required this.label});
}

class _YesNoOptionTile<T> extends StatelessWidget {
  final OptionModelYesNo<T> item;
  final bool isSelected;
  final VoidCallback onTap;

  const _YesNoOptionTile({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = isSelected ? AppColors.borderPrimary : AppColors.border;
    final backgroundColor = AppColors.white;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: AppRadius.rounded12,
        border: Border.all(color: borderColor, width: isSelected ? 2 : 1),
      ),
      child: InkWell(
        borderRadius: AppRadius.rounded12,
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.s16,
            vertical: AppSizes.s12,
          ),
          child: Row(
            children: [
              AppRadioButton(selected: isSelected),
              const SizedBox(width: AppSizes.s12),
              Expanded(
                child: Text(
                  item.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodyMedium.copyWith(
                    color: AppColors.textHeading,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
