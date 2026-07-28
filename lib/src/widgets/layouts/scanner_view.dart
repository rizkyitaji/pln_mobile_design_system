import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:pln_mobile_design_system/pln_mobile_design_system.dart';

class AppScannerView extends StatefulWidget {
  final Function(String code, MobileScannerController controller) onDetect;
  final VoidCallback? onBackPressed;
  final String instructionText;

  const AppScannerView({
    super.key,
    this.onBackPressed,
    required this.onDetect,
    required this.instructionText,
  });

  @override
  State<AppScannerView> createState() => _AppScannerViewState();
}

class _AppScannerViewState extends State<AppScannerView>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController _animationController;
  late Animation<double> _animation;

  final MobileScannerController _controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    facing: CameraFacing.back,
  );

  bool _isTorchOn = false;
  bool get isTorchOn => _isTorchOn;
  set isTorchOn(bool value) {
    setState(() {
      _isTorchOn = value;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!_controller.value.isInitialized) return;

    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      _controller.stop();
    } else if (state == AppLifecycleState.resumed) {
      _controller.start();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _animationController.dispose();
    _stopAndDispose();
    super.dispose();
  }

  Future<void> _stopAndDispose() async {
    try {
      await _controller.stop();
    } catch (_) {}
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double scanBoxSize = context.screenWidth - AppSizes.s48;

    return Scaffold(
      backgroundColor: AppColors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: AppBackButton(
          color: AppColors.iconOnColor,
          onPressed: widget.onBackPressed,
        ),
        actions: [
          Visibility(
            visible: kDebugMode,
            child: InkWell(
              onTap: () async {
                try {
                  var image = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );
                  if (image != null) {
                    var barcode = await _controller.analyzeImage(image.path);
                    var code = barcode?.barcodes.firstOrNull?.rawValue;
                    if (code != null) {
                      widget.onDetect(code, _controller);
                    }
                  }
                } catch (e) {
                  debugPrint(e.toString());
                }
              },
              child: const Icon(
                Icons.photo_library_outlined,
                color: AppColors.iconOnColor,
              ),
            ),
          ),
          AppSpacing.w16,
          InkWell(
            onTap: () {
              _controller.toggleTorch();
              isTorchOn = !_isTorchOn;
            },
            child: AppImage(
              asset: isTorchOn
                  ? AppAssets.iconLightning
                  : AppAssets.iconLightningOutlined,
              color: AppColors.iconOnColor,
            ),
          ),
          AppSpacing.w16,
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: MobileScanner(
              controller: _controller,
              onDetect: (capture) {
                String? code = capture.barcodes.firstOrNull?.rawValue;
                if (code != null) {
                  widget.onDetect(code, _controller);
                }
              },
            ),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: ScannerOverlayPainter(
                boxSize: scanBoxSize,
                borderRadius: AppSizes.s4,
              ),
            ),
          ),
          Center(
            child: Container(
              height: scanBoxSize,
              width: scanBoxSize,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primaryPressed,
                  width: AppSizes.s2,
                ),
                borderRadius: AppRadius.rounded4,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: scanBoxSize,
              width: scanBoxSize,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  final currentTop = _animation.value * (scanBoxSize - 2);
                  final maxGradientHeight = scanBoxSize - currentTop;
                  final calculatedHeight =
                      (scanBoxSize * 0.4) * (1 - _animation.value * 0.5);
                  final gradientHeight = calculatedHeight > maxGradientHeight
                      ? maxGradientHeight
                      : calculatedHeight;

                  return Stack(
                    children: [
                      Positioned(
                        top: currentTop,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: AppSizes.s2,
                          color: AppColors.primaryPressed,
                        ),
                      ),
                      Positioned(
                        top: currentTop,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: gradientHeight,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.primaryPressed.withValues(alpha: 0.2),
                                AppColors.primaryPressed.withValues(alpha: 0.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AppPersistentSheet(
              asset: AppAssets.imageBackgroundHeaderScan,
              border: const Border(top: BorderSide.none),
              child: Row(
                spacing: AppSizes.s12,
                children: [
                  const AppImage(
                    asset: AppAssets.iconCharge,
                    color: AppColors.iconOnColor,
                  ),
                  Expanded(
                    child: Text(
                      widget.instructionText,
                      style: context.textTheme.bodyMediumSemiBold.copyWith(
                        color: AppColors.textOnColorHeading,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScannerOverlayPainter extends CustomPainter {
  final double boxSize;
  final double borderRadius;
  ScannerOverlayPainter({required this.boxSize, required this.borderRadius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black;
    final backgroundPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final centerOffset = Offset(size.width / 2, size.height / 2);
    final holeRect = Rect.fromCenter(
      center: centerOffset,
      width: boxSize,
      height: boxSize,
    );
    final holePath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(holeRect, Radius.circular(borderRadius)),
      );
    final path = Path.combine(
      PathOperation.difference,
      backgroundPath,
      holePath,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
