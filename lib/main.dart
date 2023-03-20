import 'package:flutter/material.dart';
import 'package:property_management/screen/home/bottom_bar_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_management/screen/splash_screen.dart';
import 'package:property_management/test.dart';

import 'app_confiq/app_colors.dart';
import 'controller/bottom_bar_controller.dart';
import 'controller/dashboard_controller.dart';
import 'controller/home_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
 final homeController= Get.put(HomeController());
 final dashboardController= Get.put(DashboardController());
 BottomBarController bottomBarController=Get.put(BottomBarController());
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Obx(
          ()=> GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Property Management',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              primarySwatch: homeController.isRentPrimaryColor.value?homeController.redColor:homeController. purpleColor,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          ),
        );
      },
      child: const  SplashScreen(),
      //Test()

    );
  }
}

