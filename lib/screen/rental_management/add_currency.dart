import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:property_management/app_confiq/app_style.dart';

import '../../app_confiq/app_colors.dart';
import '../../widget/alert_button.dart';
import '../../widget/form_button.dart';
import '../../widget/form_text_field.dart';
class AddCurrency extends StatelessWidget {
  String status;
   AddCurrency({required this.status}) ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 25.w,right: 5.w),
          child: FormButton(width: double.infinity,bodyColor: Colors.grey,buttonText: '$status Currency',borderColor: Colors.grey.withOpacity(0.5),radius: 50.sp)),
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
          child:  Container(
            width: 16.w,
            height: 14.h,
            child: Image.asset('asset/icon/back.png',color: AppColors.purPleGradientTwoColor),
          ),
        ),
        title: Text("$status Currency",
            style: AppStyles.appBarStyle()),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            SizedBox(height:50.h,),
            AppFormTextField(enabled: true, lablel: 'Currency Name', isCompulsory: true,labelWidth: 100),
            SizedBox(height: 18.h,),
            AppFormTextField(enabled: true, lablel: 'Symbol', isCompulsory: true,labelWidth: 60),
            SizedBox(height: 18.h,),
            AppFormTextField(enabled: true, lablel: 'Description', isCompulsory: true,labelWidth: 80),
            SizedBox(height: 15.h,),

            //GridViewButton(title: 'Add',)
            // Padding(
            //   padding:  EdgeInsets.symmetric(horizontal: 15.w),
            //   child: AlertButton(label: 'Add',backGroundColor: AppColors.purPleGradientOneColor),
            // ),
          ],
        ),
      ),
    ));
  }
}
