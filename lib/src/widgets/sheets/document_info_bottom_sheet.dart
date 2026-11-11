import 'package:flutter/material.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppDocumentInfoBottomSheet extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final String instructionsTitle;
  final List<String> instructions;

  const AppDocumentInfoBottomSheet({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.instructionsTitle,
    required this.instructions,
  });

  @override
  Widget build(BuildContext context) {
    return AppSheetContainer(
      showDragHandle: false,
      borderRadius: AppRadius.topRounded16,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.s16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: context.textTheme.bodyLargeSemiBold.copyWith(
                        color: AppColors.textHeading,
                      ),
                    ),
                  ),
                  AppBackButton(icon: AppAssets.iconClose),
                ],
              ),
            ),
            AppSpacing.h16,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.s16),
              child: ClipRRect(
                borderRadius: AppRadius.rounded12,
                child: AspectRatio(
                  aspectRatio: 16 / 10,
                  child: AppImage(
                    asset: image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            AppSpacing.h16,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.s16),
              child: Text(
                description,
                style: context.textTheme.bodyMedium.copyWith(
                  color: AppColors.textBody,
                  height: 1.4,
                ),
              ),
            ),
            AppSpacing.h16,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.s16),
              child: Text(
                instructionsTitle,
                style: context.textTheme.bodyMediumSemiBold.copyWith(
                  color: AppColors.textHeading,
                ),
              ),
            ),
            AppSpacing.h8,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.s16),
              child: Column(
                children: [
                  for (var i = 0; i < instructions.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppSizes.s4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: AppSizes.s20,
                            child: Text(
                              '${i + 1}. ',
                              style: context.textTheme.bodyMedium.copyWith(
                                color: AppColors.textBody,
                                height: 1.4,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              instructions[i],
                              style: context.textTheme.bodyMedium.copyWith(
                                color: AppColors.textBody,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            AppSpacing.h24,
          ],
        ),
      ),
    );
  }

  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required String image,
    required String description,
    required String instructionsTitle,
    required List<String> instructions,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      builder: (context) {
        return AppDocumentInfoBottomSheet(
          title: title,
          image: image,
          description: description,
          instructionsTitle: instructionsTitle,
          instructions: instructions,
        );
      },
    );
  }

  static Future<T?> showKtp<T>(BuildContext context) {
    return show<T>(
      context,
      title: 'Foto KTP',
      image: AppAssets.imageIllustrationKtp,
      description:
          'Foto KTP diperlukan untuk memastikan keabsahan identitas calon pelanggan, mencegah penyalahgunaan data serta memenuhi ketentuan administrasi dan regulasi layanan.',
      instructionsTitle: 'Tata Cara Foto KTP',
      instructions: [
        'Gunakan KTP asli, bukan hasil fotokopi.',
        'Upload foto KTP di bagian upload dokumen KTP dan foto Anda terlihat dengan jelas.',
        'Pastikan seluruh bagian KTP tidak terpotong.',
        'Data KTP harus sama dengan data pemohon.',
      ],
    );
  }

  static Future<T?> showSelfieKtp<T>(BuildContext context) {
    return show<T>(
      context,
      title: 'Foto Diri Dengan KTP',
      image: AppAssets.imageIllustrationSelfieKtp,
      description:
          'Foto diri dengan KTP diperlukan untuk memastikan keabsahan identitas calon pelanggan, mencegah penyalahgunaan data serta memenuhi ketentuan administrasi dan regulasi layanan.',
      instructionsTitle: 'Tata Cara Foto KTP',
      instructions: [
        'KTP terbaca, tidak menutupi mata.',
        'Foto Selfie & KTP terlihat jelas.',
        'KTP milik Anda sendiri.',
        'Foto diambil langsung dari kamera HP Anda.',
      ],
    );
  }

  static Future<T?> showKartuKeluarga<T>(BuildContext context) {
    return show<T>(
      context,
      title: 'Foto Kartu Keluarga',
      image: AppAssets.imageIllustrationKartuKeluarga,
      description:
          'Foto Kartu Keluarga diperlukan untuk memastikan keabsahan identitas calon pelanggan, mencegah penyalahgunaan data serta memenuhi ketentuan administrasi dan regulasi layanan.',
      instructionsTitle: 'Tata Cara Foto Kartu Keluarga',
      instructions: [
        'Gunakan Kartu Keluarga asli, bukan hasil fotokopi.',
        'Upload foto Kartu Keluarga dan pastikan terlihat dengan jelas.',
        'Pastikan seluruh bagian Kartu Keluarga tidak terpotong.',
        'Data Kartu Keluarga harus sama dengan data pemohon.',
      ],
    );
  }

  static Future<T?> showBuilding<T>(BuildContext context) {
    return show<T>(
      context,
      title: 'Foto Bangunan Tampak Depan',
      image: AppAssets.imageIllustrationBangunan,
      description:
          'Foto tampak depan bangunan diperlukan untuk memastikan bahwa bangunan tersebut sudah dibangun.',
      instructionsTitle: 'Tata Cara Foto Bangunan Tampak Depan',
      instructions: [
        'Pastikan seluruh bagian depan bangunan masuk ke dalam frame kamera dan tidak terpotong.',
        'Bangunan harus terlihat jelas.',
        'Pastikan pencahayaan cukup terang agar bentuk dan kondisi fisik bangunan terlihat dengan jelas.',
      ],
    );
  }
}
