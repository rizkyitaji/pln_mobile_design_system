import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppSelectionSheet<T> extends StatefulWidget {
  final String title;
  final String searchHint;
  final String sectionTitle;
  final List<T> items;
  final T? selectedItem;
  final bool loading;
  final String Function(T item) itemLabel;
  final bool Function(T? selected, T item) isSelected;
  final VoidCallback? onRetry;

  const AppSelectionSheet({
    super.key,
    required this.title,
    required this.searchHint,
    required this.sectionTitle,
    required this.items,
    required this.itemLabel,
    required this.isSelected,
    this.selectedItem,
    this.loading = false,
    this.onRetry,
  });

  @override
  State<AppSelectionSheet<T>> createState() => _AppSelectionSheetState<T>();
}

class _AppSelectionSheetState<T> extends State<AppSelectionSheet<T>> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final query = _searchController.text.trim().toLowerCase();
    final filteredItems = widget.items.where((item) {
      final label = widget.itemLabel(item).toLowerCase();
      return query.isEmpty || label.contains(query);
    }).toList();

    final bodyHeight =
        MediaQuery.sizeOf(context).height -
        MediaQuery.paddingOf(context).top -
        kToolbarHeight;

    return AppGeneralPage(
      title: widget.title,
      appBarColor: AppColors.white,
      backgroundColor: AppColors.white,
      titleColor: AppColors.textHeading,
      padding: EdgeInsets.zero,
      child: SizedBox(
        height: bodyHeight,
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSizes.s16,
              AppSizes.s8,
              AppSizes.s16,
              AppSizes.s16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _searchController,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: widget.searchHint,
                    prefixIcon: const Icon(Icons.search_rounded),
                    filled: true,
                    fillColor: AppColors.backgroundSecondary,
                    border: OutlineInputBorder(
                      borderRadius: AppRadius.rounded48,
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: AppRadius.rounded48,
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: AppRadius.rounded48,
                      borderSide: const BorderSide(
                        color: AppColors.borderPrimary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.s20),
                if (widget.selectedItem != null) ...[
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Lokasi Terpilih',
                          style: textTheme.titleMedium.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.textHeading,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.s12),
                  AppListTile(
                    title: widget.itemLabel(widget.selectedItem as T),
                    titleTextStyle: textTheme.bodyLarge.copyWith(
                      color: AppColors.textHeading,
                      fontWeight: FontWeight.w600,
                    ),
                    trailing: const Icon(
                      Icons.check_circle_rounded,
                      color: AppColors.iconSuccess,
                    ),
                    border: Border.all(color: AppColors.textPrimary),
                    backgroundColor: AppColors.successSubtle,
                    onTap: () => Navigator.pop(context, widget.selectedItem),
                  ),
                  const SizedBox(height: AppSizes.s24),
                ],
                Text(
                  widget.sectionTitle,
                  style: textTheme.titleMedium.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textHeading,
                  ),
                ),
                const SizedBox(height: AppSizes.s12),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (widget.loading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (filteredItems.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Data tidak ditemukan',
                                style: textTheme.titleMedium.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: AppSizes.s8),
                              Text(
                                query.isEmpty
                                    ? 'Coba muat ulang daftar pilihan.'
                                    : 'Ubah kata kunci pencarian untuk melihat hasil lain.',
                                textAlign: TextAlign.center,
                                style: textTheme.bodyMedium.copyWith(
                                  color: AppColors.textCaption,
                                ),
                              ),
                              if (query.isEmpty && widget.onRetry != null) ...[
                                const SizedBox(height: AppSizes.s16),
                                OutlinedButton(
                                  onPressed: widget.onRetry,
                                  child: const Text('Muat ulang'),
                                ),
                              ],
                            ],
                          ),
                        );
                      }

                      return ListView.separated(
                        itemCount: filteredItems.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: AppSizes.s12),
                        itemBuilder: (context, index) {
                          final item = filteredItems[index];
                          final active = widget.isSelected(
                            widget.selectedItem,
                            item,
                          );

                          return AppListTile(
                            title: widget.itemLabel(item),
                            titleTextStyle: textTheme.bodyLarge.copyWith(
                              color: AppColors.textHeading,
                              fontWeight: active
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                            ),
                            trailing: AppRadioButton(selected: active),
                            border: Border.all(
                              color: active
                                  ? AppColors.borderPrimary
                                  : AppColors.border,
                            ),
                            backgroundColor: active
                                ? AppColors.primarySubtle
                                : AppColors.white,
                            onTap: () => Navigator.pop(context, item),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
