import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/app_colors.dart';
class CommentsRepaly extends StatelessWidget {
   CommentsRepaly({required this.comments}) ;
String comments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffEDF0F6),
        elevation: 4.sp,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(
                20.sp,
              ),
              bottomLeft: Radius.circular(20.sp),
            ),
            borderSide: BorderSide(color: Color(0xffEDF0F6))),
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Container(
            width: 16.w,
            height: 14.h,
            decoration: const BoxDecoration(

                image: DecorationImage(image: AssetImage('asset/icon/back.png',))),
          ),
        ),

        title: Text("Faisal Usman",
            style: TextStyle(color: Color(0xff7A539C), fontSize: 20.sp)),
      ),

      body:Column(
        children: [
          SizedBox(height: 30.h,),
          Container(

            margin: EdgeInsets.symmetric(horizontal: 25.w),
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.purPleGradientOneColor,
              borderRadius: BorderRadius.only(topRight:Radius.circular(20.sp),bottomLeft: Radius.circular(20.sp))
            ),
            child: Text(comments),
          ),
          Expanded(child: Container(
            
          )),
          Card(
            elevation: 4.sp,
            child: Container(

              margin:EdgeInsets.symmetric(horizontal: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10.sp)
              ),
              child: Row(
                children: [
                  Flexible(child:TextFormField(
                    cursorColor: AppColors.purPleGradientOneColor,

                  decoration: InputDecoration(
suffixIcon:  Container(
  width: 24.w,
  height: 24.h,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10.sp),
      color: AppColors.purPleGradientTwoColor
  ),
  child: Center(
    child: Image.asset('asset/icon/sendIcon.png',color: AppColors.whiteColor),
  ),
),
                    enabledBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                      borderSide: BorderSide(color:AppColors.whiteColor,

                    ),),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                      borderSide: BorderSide(color: AppColors.whiteColor
                      ),),
                    hintText: 'Repaly',
                    hintStyle: TextStyle(
                      color: AppColors.blackColor
                    )
                  ),

                  ) ),


                ],
              ),
            ),
          ),
          SizedBox(height: 10.h,)
        ],
      ) ,
    ));
  }
}
