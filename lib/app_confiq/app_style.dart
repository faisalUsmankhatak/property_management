

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';



class AppStyles{


  static TextStyle titleStyle() {
    return TextStyle(
        fontSize: 15.sp,
        //fontWeight: FontWeight.w700,
        color: AppColors.textFieldDefaultColor,

       // fontWeight: FontWeight.w700,
        fontFamily: 'Roboto-Black',

    );
  }


  static TextStyle appBarStyle({Color? color}) {
    return TextStyle(color:color?? Color(0xff7A539C), fontSize: 20.sp,fontFamily: 'Roboto-Black');
  }

  static TextStyle subTitleStyle() {
    return TextStyle(
      fontSize: 12.sp,
      //fontWeight: FontWeight.w700,
      //color: AppColors.blackColor,
      color: AppColors.textFieldDefaultColor,
      // fontWeight: FontWeight.w700,
      fontFamily: 'Roboto-Black',

    );
  }
  static TextStyle formLabelStyle() {
    return TextStyle(
      fontSize: 12.sp,
      //fontWeight: FontWeight.w700,
      //color: AppColors.blackColor,
      //color: AppColors.textFieldDefaultColor,
      // fontWeight: FontWeight.w700,
      fontFamily: 'Roboto-Black',

    );
  }

  static TextStyle filterLabelStyle() {
    return TextStyle(
      fontSize: 15.sp,
      //fontWeight: FontWeight.w700,
      //color: AppColors.blackColor,
      color: AppColors.whiteColor,
      // fontWeight: FontWeight.w700,
      fontFamily: 'Roboto-Black',

    );
  }
  static TextStyle labelValueStyle({Color? color}) {
    return TextStyle(
      fontSize: 15.sp,
      color:color?? AppColors.textFieldDefaultColor,

      fontFamily: 'Roboto-Black',

    );
  }
  static TextStyle highlightsTextStyle() {
    return TextStyle(
        fontSize: 14.sp,
        fontFamily: 'Roboto-Black',
        //fontWeight: FontWeight.w700,
        color: AppColors.highlightsColor
    );
  }
  static TextStyle TextButtonStyle({Color? color}) {
    return TextStyle(
        fontSize: 18.sp,
        fontFamily: 'Roboto-Black',
        //fontWeight: FontWeight.w700,
        color:color?? AppColors.purPleGradientTwoColor
    );
  }




  static TextStyle greenTextStyle() {
    return TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.greenColor
    );
  }
  static TextStyle formTextStyle() {
    return TextStyle(
        fontSize: 15.sp,

        //fontWeight: FontWeight.w700,
        color:Color(0xff91919F)
    );
  }






  static TextStyle boldTextStyle() {
    return TextStyle(
        fontSize: 18.sp,
        //fontWeight: FontWeight.w700,
        color: AppColors.blackColor
    );
  }


  static TextStyle dropDownLabelStyle() {
    return TextStyle(
        fontSize: 10.sp,
        //fontWeight: FontWeight.w700,
        color:AppColors.purPleGradientOneColor
    );
  }
  static TextStyle stackContainerLabelStyle() {
    return TextStyle(
        fontSize: 15.sp,

        //fontWeight: FontWeight.w700,
        color:AppColors.whiteColor
    );
  }
  static TextStyle hintTextStyleStyle() {
    return TextStyle(
        fontSize: 10.sp,

        //fontWeight: FontWeight.w700,
        color:AppColors.textFieldDefaultColor
    );
  }
}