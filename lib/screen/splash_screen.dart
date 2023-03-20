import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../app_confiq/app_colors.dart';
import 'home/bottom_bar_screen.dart';
import 'home/home_screen.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navigat();
    return Scaffold(
      backgroundColor:AppColors.whiteColor,
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 170.w,
            height: 170.h,
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("asset/icon/property_logo.jpg"))),
          )
        ],
      ),),
    );
  }
  navigat(){
    Future.delayed(const Duration(seconds: 2),(){
      Get.to( HomeScreen());
    });
  }
}
