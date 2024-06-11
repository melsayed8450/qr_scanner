import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          Get.arguments ?? 'Error',
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
            height: 1.17,
          ),
        ),
      ),
    );
  }
}
