import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:property_management/app_confiq/app_style.dart';

import '../app_confiq/app_colors.dart';
import '../controller/home_controller.dart';
HomeController homeController=Get.put(HomeController());
class BottomBorderTextField extends StatelessWidget {
  String? label;
  TextEditingController controller;
  bool isCompulsory;
  GestureTapCallback? onTap;
String? hintText;
  BottomBorderTextField(
      {this.hintText, this.label,this.onTap, required this.controller, required this.isCompulsory});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>TextFormField(
          minLines: 1,
          maxLines: 1,
style: TextStyle(
  fontSize: 12.sp,
    color: AppColors.textFieldDefaultColor
),
      onTap: onTap,
      //  mouseCursor: MaterialStateMouseCursor.clickable,
          controller: controller,
          textAlign: TextAlign.left,
          decoration: InputDecoration(

            focusedBorder:  UnderlineInputBorder(
              borderSide: BorderSide(width: 1.sp,color:homeController.isRentPrimaryColor.value?AppColors.redGradientOneColor:AppColors.purPleGradientTwoColor )
            ),
hintText: hintText??'',
hintStyle:AppStyles.formLabelStyle() ,

// label: Row(
//   children: [
//     Text(label??'',style: AppStyles.dropDownLabelStyle(),),
//     isCompulsory?  SizedBox(width: 5.w,):SizedBox(),
//     isCompulsory?  Text("*",style: TextStyle(color: AppColors.redColor),):SizedBox()
//
//   ],
// ),
            contentPadding: EdgeInsets.all(0.0),


            border: UnderlineInputBorder(

                borderSide: BorderSide(
                    color: AppColors.purPleGradientOneColor,
                )

            ),)
      ),
    );
  }
}
