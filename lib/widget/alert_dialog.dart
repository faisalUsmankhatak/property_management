import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../app_confiq/app_colors.dart';
import '../app_confiq/app_style.dart';
import 'form_button.dart';
import 'myFloatingButton.dart';


  @override
  GetMyDialoge() {
    return Get.dialog(Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          children: [
            GestureDetector(
              onTap:() {
                Get.back();
              },
              child: Container(
                color: Colors.transparent,
                width: Get.width,
                height: Get.height,

              ),
            ),
            Center(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.w),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      height: 373.h,
                      width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xffFFFFFF)),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 10.sp,),
                            Stack(
                              children: [
                                Container(
                                  height: 125.sp,
                                  width: 125.sp,
                                  decoration:   const BoxDecoration(

                                      image: DecorationImage(
                                          image: AssetImage("asset/icon/alert_icon.png"),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                ),
                                Positioned(
                                  left: 40.w,
                                  top: 35.h,
                                  child: Container(
                                    height: 50.sp,
                                    width: 50.sp,
                                    decoration:   const BoxDecoration(

                                        image: DecorationImage(
                                            image: AssetImage("asset/icon/delete.png"),
                                            fit: BoxFit.cover
                                        )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40.h,),
                            Text('Are you Sure!',style: TextStyle(color: AppColors.purPleGradientOneColor,fontFamily: 'Roboto-Black'), ),
                            SizedBox(height: 10.h,),
                            Text('You want to Delete this Services',style: AppStyles.highlightsTextStyle(), ),
                            SizedBox(height: 25.h,),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                child:Row(
                                  children: [
                                    Expanded(child:ElevatedButton(
                                        onPressed: (){
                                //Get.to(FillProfile());
                            },
                                        style: ElevatedButton.styleFrom(padding: EdgeInsets.all(15.sp),
                                          primary: AppColors.whiteColor,
                                        shape: RoundedRectangleBorder(side: BorderSide(color: AppColors.redColor,),borderRadius:BorderRadius.circular(100.sp) )
                                        ),
                                        child:  Text("No",style: TextStyle(color: AppColors.redColor,fontFamily: 'Roboto-Black'),)), ),
                                    SizedBox(width: 10.w,),
                                    Expanded(child:ElevatedButton(
                                        onPressed: (){
                                          //Get.to(FillProfile());
                                        },
                                        style: ElevatedButton.styleFrom(padding: EdgeInsets.all(15.sp),
                                       primary: AppColors.purPleGradientTwoColor,
                                            shape: RoundedRectangleBorder(side: BorderSide(color:AppColors.purPleGradientTwoColor ),borderRadius:BorderRadius.circular(100.sp) )
                                        ),
                                        child:  Text("Yes",style: TextStyle(color: AppColors.whiteColor,fontFamily: 'Roboto-Black'),)), ),
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

