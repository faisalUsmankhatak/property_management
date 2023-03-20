import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:property_management/controller/home_controller.dart';

import '../app_confiq/app_colors.dart';

HomeController homeController=Get.find();

class MyFloationButton extends StatelessWidget {
  double? width;
  double? height;
  String label;
  GestureTapCallback? onPressFloating;

  MyFloationButton(
      {this.width, this.height, required this.label, this.onPressFloating});

  @override
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressFloating,

      child: Container(
        width: width ?? 60.w,
        height: height ?? 60.h,
        decoration: BoxDecoration(
         // borderRadius: BorderRadius.circular(25.w),
          color:homeController.isRentPrimaryColor.value? AppColors.redGradientOneColor:AppColors.purPleGradientTwoColor,
          shape: BoxShape.circle
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 26.w,
                height: 26.h,
                decoration:  BoxDecoration(
                    shape: BoxShape.circle, color: homeController.isRentPrimaryColor.value? AppColors.redGradientOneColor:AppColors.purPleGradientTwoColor),
                child: Center(child: Icon(Icons.add, size: 22, color: AppColors.whiteColor))
                )
            ],
          ),
        ),
      ),
    );
  }
}
