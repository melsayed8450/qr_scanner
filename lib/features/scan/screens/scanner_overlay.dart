import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moe_qr_scanner/common/utils/app_colors.dart';
import 'package:moe_qr_scanner/common/utils/assets.dart';

class ScannerOverlay extends StatelessWidget {
  const ScannerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    double scanArea = 295.sp;
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
              AppColors.primaryColor.withOpacity(0.9), BlendMode.srcOut),
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  backgroundBlendMode: BlendMode.dstOut,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: scanArea,
                  width: scanArea,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: CustomPaint(
            foregroundPainter: BorderPainter(),
            child: SizedBox(
              width: scanArea + 10,
              height: scanArea + 10,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 85.h),
            child: SvgPicture.asset(
              AppAssets.logo,
              height: 66.6.h,
              width: 141.w,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              left: 40.w,
              right: 40.w,
              bottom: 123.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Scannen Sie den QR-Code',
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 25.sp,
                    height: 1.17,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Scannen Sie den QR-Code auf der Unterseite des Gateways, um die Installation fortzusetzen',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    color: const Color.fromRGBO(137, 137, 137, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    height: 1.17,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const width = 5.0;
    double radius = 30.r;
    double tRadius = 2 * radius;
    final rect = Rect.fromLTWH(
      width,
      width,
      size.width - 2 * width,
      size.height - 2 * width,
    );
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    Rect clippingRect0 = Rect.fromLTWH(
      0,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect1 = Rect.fromLTWH(
      size.width - tRadius,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect2 = Rect.fromLTWH(
      0,
      size.height - tRadius,
      tRadius,
      tRadius,
    );
    final clippingRect3 = Rect.fromLTWH(
      size.width - tRadius,
      size.height - tRadius,
      tRadius,
      tRadius,
    );

    final path = Path()
      ..addRect(clippingRect0)
      ..addRect(clippingRect1)
      ..addRect(clippingRect2)
      ..addRect(clippingRect3);

    canvas.clipPath(path);
    canvas.drawRRect(
      rrect,
      Paint()
        ..color = const Color.fromRGBO(61, 61, 62, 1)
        ..style = PaintingStyle.stroke
        ..strokeWidth = width,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
