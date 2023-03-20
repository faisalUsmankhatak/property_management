import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../app_confiq/app_colors.dart';
import '../app_confiq/app_style.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../controller/home_controller.dart';
import '../controller/owner_controller.dart';
HomeController homeController =Get.find();
class AppFormTextField extends StatelessWidget {
  bool? isPasswordVisible;
  String? suffixIcon;
  bool enabled;
  double? height;
  String lablel;
  ValueChanged<String>? onChanged;
  MultiValidator? validation;
  TextInputType? typeKeyboard;
  bool isCompulsory;
  double? labelWidth;
  MaskTextInputFormatter? maskFormatter;
  TextEditingController? textController;
  GestureTapCallback? suffixIconTab;

  int? maxLine;
Color? labelColor;
int? maxLines;
  AppFormTextField({required this.lablel,
    this.isPasswordVisible,

this.labelColor,
    this.height,
    this.maxLines,
    this.suffixIcon,
    this.maskFormatter,
    required this.enabled,
    this.suffixIconTab,
    this.textController, this.maxLine, this.validation, this.typeKeyboard, required this.isCompulsory, this.labelWidth, this.onChanged});

  OwnerController ownerController = Get.put(OwnerController());


  Widget build(BuildContext context) {
    return
        SizedBox(
          height:height?.h,
          child: Obx(()=>
             TextFormField(
              textAlign: TextAlign.start,

style: TextStyle(
  fontSize: 12.sp,
  color: AppColors.textFieldDefaultColor
),
maxLines: maxLines,
inputFormatters:maskFormatter==null?null:[
  maskFormatter!
],
              onChanged: onChanged ?? null,
              keyboardType: typeKeyboard,
              obscureText: isPasswordVisible ?? false,
              controller: textController,
             // maxLength: length ?? 50,

              validator: validation ?? MultiValidator(
                  []
              ),

              decoration: InputDecoration(
                enabled: enabled,
                  contentPadding: EdgeInsets.only(
                      bottom: 11.sp, top: 14.sp, left: 10.sp, right: 10.sp),
                counterText: '',
                suffixIcon: suffixIcon == null
                    ? null
                    : InkWell(
                  onTap: suffixIconTab,
                  child: Container(
                    width: 16.w,
                    height: 16.h,
                    decoration: BoxDecoration(

                        image: DecorationImage(image: AssetImage(suffixIcon!))),
                  ),
                ),
                //  labelText:lablel,

                label:
                Container(
                  width: labelWidth?.w,
                  //padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 3.h),

                  child: Row(
                    children: [
                      Text(lablel,style: AppStyles.formLabelStyle(), ),
                      isCompulsory ? SizedBox(width: 5.w,) : SizedBox(),
                      isCompulsory
                          ? Text("*", style: TextStyle(color: Colors.red),)
                          : SizedBox(),
                    ],
                  ),
                ),



                isDense: true,
disabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(5.sp),
    borderSide: BorderSide(color: AppColors.textFieldDefaultColor)
),
enabledBorder:   OutlineInputBorder(borderRadius: BorderRadius.circular(5.sp),
    borderSide: BorderSide(color: AppColors.textFieldDefaultColor)
),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:homeController.isRentPrimaryColor.value?AppColors.redGradientTwoColor: AppColors.purPleGradientTwoColor),
                    borderRadius: BorderRadius.circular(5.sp)
                ),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.sp),
                    borderSide: BorderSide(color: AppColors.textFieldDefaultColor)
                ),
              ),
            ),
          ),
        );
  }
}

