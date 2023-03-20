import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_confiq/app_colors.dart';

class HomeController extends GetxController {
  RxList<Color> boxColor = [
    //rent color
    Color(0xff7742E0).withOpacity(0.5),

//sales color
    Color(0xffD45757).withOpacity(0.3),

  ].obs;

  List list = [
    'Services',
    // 'Repairing',
    'Reports',
    'Invoices',
    'Comments',
    'currency'
  ];
  List rent = [
    'Add Property',
    'Properties List',
    'Add Owner',
    'Add Tenants',
    'Add Rent',
    'More Options'
  ];
  List sale = [
    'Add Property',
    'Properties List',
    'On Installment',
    'Sold Property',
    'Agreement'
  ];

  RxList GrideViewData = [
    {
      "title": "Rent Management",
      "subtitle": "Last updated 2 hours ago",
      "popopIcon": "asset/icon/rentpop.png",
      "ImagePath": "asset/icon/rent.png",
      'linearGradientColor1':AppColors.purPleGradientOneColor  ,
      'linearGradientColor2':AppColors.purPleGradientTwoColor,
      'popupIconColor':AppColors.whiteColor
    },
    {
      "title": "Sales Management",
      "subtitle": "Last updated 2 hours ago",
      "popopIcon": "asset/icon/rentpop.png",
      "ImagePath": "asset/icon/sale.png",
      'linearGradientColor1':AppColors.redGradientOneColor ,
      'linearGradientColor2':AppColors.redGradientTwoColor,
      'popupIconColor':AppColors.whiteColor
    },
  ].obs;


  static const int _purplePrimaryValue = 0xff7742E0;
    MaterialColor purpleColor =  MaterialColor(
    _purplePrimaryValue,
    <int, Color>{
      50: AppColors.purPleGradientOneColor,
      100: AppColors.purPleGradientOneColor,
      200: AppColors.purPleGradientOneColor,
      300: AppColors.purPleGradientOneColor,
      400: AppColors.purPleGradientOneColor,
      500: AppColors.purPleGradientOneColor,
      600: AppColors.purPleGradientOneColor,
      700: AppColors.purPleGradientOneColor,
      800: AppColors.purPleGradientOneColor,
      900: AppColors.purPleGradientOneColor,
    },
  );
  static const int _redPrimaryValue = 0xffD45757;
  MaterialColor redColor =  MaterialColor(
    _redPrimaryValue,
    <int, Color>{
      50: AppColors.redGradientOneColor,
      100: AppColors.redGradientOneColor,
      200: AppColors.redGradientOneColor,
      300: AppColors.redGradientOneColor,
      400: AppColors.redGradientOneColor,
      500: AppColors.redGradientOneColor,
      600: AppColors.redGradientOneColor,
      700: AppColors.redGradientOneColor,
      800: AppColors.redGradientOneColor,
      900: AppColors.redGradientOneColor,
    },
  );
  RxBool isRentPrimaryColor=false.obs;
}
