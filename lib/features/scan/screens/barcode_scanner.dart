import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:moe_qr_scanner/common/routes/app_pages.dart';
import 'package:moe_qr_scanner/features/scan/screens/scanner_overlay.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  void initState() {
    cameraController.stop();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: (barcodeCapture) {
              final String code =
                  barcodeCapture.barcodes.first.rawValue ?? "___";
              Get.toNamed(
                AppPages.result,
                arguments: code,
              );
            },
            scanWindow: Rect.fromCenter(
              center: Offset(Get.size.width / 2, Get.size.height / 2),
              width: 295.h,
              height: 295.h,
            ),
          ),
          const ScannerOverlay(),
        ],
      ),
    );
  }
}
