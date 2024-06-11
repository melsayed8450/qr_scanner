import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'common/routes/app_pages.dart';
import 'common/routes/app_routes.dart';

class MOEApp extends StatelessWidget {
  const MOEApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        builder: (_, child) {
          return GetMaterialApp(
            title: 'MOE QR Scanner',
            useInheritedMediaQuery: true,
            debugShowCheckedModeBanner: false,
            getPages: AppRoutes.routes,
            initialRoute: AppPages.scan,
          );
        });
  }
}
