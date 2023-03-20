import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_management/app_confiq/app_style.dart';

import '../app_confiq/app_colors.dart';

class FormButton extends StatelessWidget {
  GestureTapCallback? onTap;
  String? buttonText;
  Color? textColor;
  Color? borderColor;
double? height;
double? radius;
double? width;
double? fontSize;
Color? bodyColor;

  FormButton({this.onTap, this.buttonText, this.height, this.radius,
    this.width, this.fontSize,this.bodyColor,this.textColor,this.borderColor});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      splashColor: Colors.white,
     borderRadius: BorderRadius.circular(radius??10.0.sp),
      child: Ink(
        width: width?.w,
        height:height?.h??45.sp,
        decoration: BoxDecoration(

          gradient:bodyColor!=null?null:  LinearGradient(
            colors: [
              Color(0xff7A539C),
              Color(0xff7742E0)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ),
          border:Border.all(color:borderColor??AppColors.purPleGradientOneColor ) ,

          borderRadius: BorderRadius.circular(radius?.sp??10.sp,),
         color:bodyColor?? AppColors.purPleGradientOneColor

        ),
        child:
        Center(
          child: Text(buttonText??"Button",style:  AppStyles.filterLabelStyle()),
        ),
        ),


    );
  }


}
