import 'package:get/get.dart';
import 'package:moe_qr_scanner/features/scan/screens/barcode_scanner.dart';
import 'package:moe_qr_scanner/features/scan/screens/result.dart';
import 'app_pages.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: AppPages.scan,
      page: () => const ScanPage(),
    ),
    GetPage(
      name: AppPages.result,
      page: () => ResultPage(),
    ),

  ];
}
