import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:property_management/controller/home_controller.dart';

import '../app_confiq/app_colors.dart';
class AlertButton extends StatelessWidget {
   AlertButton({required this.label,this.onTap,this.backGroundColor}) ;
   HomeController homeController=Get.find();
String label;
Color? backGroundColor;
   GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child:
         Container(
          padding: EdgeInsets.symmetric(vertical: 20.sp,horizontal: 5.sp),
          width: double.infinity,
          decoration: BoxDecoration(
              color:backGroundColor,
              border: Border.all(color:AppColors.greyColor,
             // homeController.isRentPrimaryColor.value?AppColors.redGradientOneColor: AppColors.purPleGradientOneColor,width: 1.sp
              ),
              borderRadius: BorderRadius.circular(100.sp),
              gradient:
               backGroundColor==AppColors.purPleGradientOneColor?
              LinearGradient(
                  colors: [homeController.isRentPrimaryColor.value?AppColors.redGradientOneColor:AppColors.purPleGradientOneColor,
                   homeController.isRentPrimaryColor.value?AppColors.redGradientTwoColor: AppColors.purPleGradientTwoColor

                  ],
                  begin: Alignment.bottomCenter,
                  end:Alignment.topCenter
              ):null
                  //:null
          ),
          child: Center(child: Text(label,style: TextStyle(color:AppColors.whiteColor),)),
        ),

    );
  }
}
