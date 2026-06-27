import 'package:flutter/material.dart';
// Asumsikan semua core component design system di-import dari sini
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

/// Komponen Design System untuk Coach Mark Stepper
class AppCoachMarkStepper extends StatelessWidget {
  final String title;
  final String description;
  final int currentStep;
  final int totalSteps;

  /// Callback actions
  final VoidCallback? onTapButtonSkip;
  final VoidCallback? onTapButtonLeft;
  final VoidCallback? onTapButtonRight;

  /// Konfigurasi Segitiga (Pointer)
  final Alignment? trianglePosition;
  final double? paddingLeftTriangle;
  final double? paddingRightTriangle;

  /// Customisasi teks (mendukung lokalisasi/konteks berbeda)
  final String skipText;
  final String nextText;
  final String doneText;
  final Color backgroundColor;

  const AppCoachMarkStepper({
    super.key,
    required this.title,
    required this.description,
    required this.currentStep,
    required this.totalSteps,
    this.onTapButtonLeft,
    this.onTapButtonRight,
    this.onTapButtonSkip,
    this.trianglePosition = Alignment.topCenter,
    this.paddingLeftTriangle,
    this.paddingRightTriangle,
    this.skipText = 'Tutup',
    this.nextText = 'Selanjutnya',
    this.doneText = 'Selesai',
    this.backgroundColor =
        Colors.white, // Sesuaikan dengan AppColors.white jika ada
  });

  // Ukuran standar segitiga coach mark
  Size get _triangleSize => const Size(20.0, 8.0);

  Widget _buildTextButton({
    required String text,
    VoidCallback? onTap,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: onTap,
      radius: AppRadius.sm, // Pastikan ada di DS Anda
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.s16,
          vertical: AppSizes.s6,
        ),
        decoration: BoxDecoration(
          borderRadius: AppRadius.rounded,
          border: Border.all(color: AppColors.borderPrimary),
        ),
        child: Text(
          text,
          textScaler: TextScaler.noScaling,
          style: AppTextTheme.lightTextTheme.bodyCaptionSemiBold.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }

  Widget _buildTrianglePointer(Alignment position) {
    Widget triangleWidget;

    // Tentukan apakah segitiga mengarah ke atas atau ke bawah
    if (position.y < 0) {
      triangleWidget = CustomPaint(
        size: _triangleSize,
        painter: _TrianglePainterTop(color: backgroundColor),
      );
    } else if (position.y > 0) {
      triangleWidget = CustomPaint(
        size: _triangleSize,
        painter: _TrianglePainterBottom(color: backgroundColor),
      );
    } else {
      return const SizedBox.shrink(); // Hide jika tidak ada posisi Y (center)
    }

    return Container(
      padding: EdgeInsets.only(
        left: paddingLeftTriangle ?? (position.x < 0 ? 32.0 : 0),
        right: paddingRightTriangle ?? (position.x > 0 ? 32.0 : 0),
      ),
      alignment: position,
      child: triangleWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final stepProgressText = '$currentStep dari $totalSteps';
    final isLastStep = currentStep >= totalSteps;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Segitiga Atas
        if (trianglePosition != null && trianglePosition!.y <= 0)
          _buildTrianglePointer(trianglePosition!),

        // Kotak Konten Coach Mark
        Container(
          padding: const EdgeInsets.all(AppSizes.s12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: AppRadius.rounded12,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textScaler: TextScaler.noScaling,
                style: context.textTheme.bodySmallMedium.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              AppSpacing.h4,
              Text(
                description,
                textScaler: TextScaler.noScaling,
                style: context.textTheme.bodyMediumMed,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSizes.s12),
                child: const Divider(
                  color: AppColors.border,
                  height: AppSizes.zero,
                  thickness: AppSizes.s2,
                ),
              ),

              // Bagian Bawah: Indikator & Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      stepProgressText,
                      textScaler: TextScaler.noScaling,
                      style: context.textTheme.bodySmallMedium,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Visibility(
                        visible: onTapButtonSkip != null,
                        child: TextButton(
                          onPressed: onTapButtonSkip,
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            skipText,
                            textScaler: TextScaler.noScaling,
                            style: context.textTheme.bodyCaptionSemiBold
                                .copyWith(color: AppColors.textPrimary),
                          ),
                        ),
                      ),
                      AppSpacing.w12,
                      _buildTextButton(
                        context: context,
                        text: isLastStep ? doneText : nextText,
                        onTap: onTapButtonRight,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        // Segitiga Bawah
        if (trianglePosition != null && trianglePosition!.y > 0)
          _buildTrianglePointer(trianglePosition!),
      ],
    );
  }
}

// --- Internal Painters (Disembunyikan dengan underscore agar eksklusif di file ini) ---

class _TrianglePainterTop extends CustomPainter {
  final Color color;
  _TrianglePainterTop({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, 0); // Titik atas
    path.lineTo(0, size.height); // Titik kiri bawah
    path.lineTo(size.width, size.height); // Titik kanan bawah
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _TrianglePainterTop oldDelegate) {
    return oldDelegate.color != color;
  }
}

class _TrianglePainterBottom extends CustomPainter {
  final Color color;
  _TrianglePainterBottom({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, size.height); // Titik bawah
    path.lineTo(0, 0); // Titik kiri atas
    path.lineTo(size.width, 0); // Titik kanan atas
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _TrianglePainterBottom oldDelegate) {
    return oldDelegate.color != color;
  }
}
