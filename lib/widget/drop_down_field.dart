import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:property_management/app_confiq/app_style.dart';
import '../app_confiq/app_colors.dart';
import '../controller/home_controller.dart';
import '../controller/rent_add_property_Controller.dart';
HomeController homeController=Get.find();
class DropDownField extends StatelessWidget {

List<dynamic> menu;
String label;
bool isChangeIcon;
double labelWidth;
ValueChanged? onChange;
String? selectValue;
DropDownField({required this.label,required this.menu, this.onChange,required this.labelWidth,required this.isChangeIcon,this.selectValue});
RentAddPropertyController propertyController=Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38.h,
      child: DropdownButtonFormField2(

        // itemSplashColor:AppColors.purPalGradientOneColor ,
        // itemHighlightColor:AppColors.purPalGradientOneColor,
        enableFeedback:true,
        //dropdownWidth: 310.w,
        offset: Offset(0.sp,-12.sp),
        decoration: InputDecoration(
focusColor:AppColors.purPleGradientOneColor ,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
              color: homeController.isRentPrimaryColor.value?AppColors.redGradientOneColor:AppColors.purPleGradientTwoColor,   width: 1.sp
              ),
              borderRadius: BorderRadius.circular(5.sp)),

          label: Padding(
              padding: EdgeInsets.only(left: 10.w,top: 6.h),
              child: Container(
                width: labelWidth.w,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: AppStyles.formLabelStyle()
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "*",
                      style: TextStyle(color: AppColors.redColor),
                    )
                  ],
                ),
              )),
          isDense: true,

          contentPadding:EdgeInsets. only(top: 10.h,bottom: 10.h,left: 0.w,right: 0.w),
          enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textFieldDefaultColor),
            borderRadius: BorderRadius.circular(5.sp),
          ),
disabledBorder:OutlineInputBorder(
  borderSide: BorderSide(color: AppColors.textFieldDefaultColor),
  borderRadius: BorderRadius.circular(5.sp),
),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textFieldDefaultColor),
            borderRadius: BorderRadius.circular(5.sp),
          ),
        ),
        isExpanded: true,
        value: selectValue??null,

        icon: Icon(
          isChangeIcon
              ?  Icons.expand_less
              : Icons.expand_more,
          color: Colors.black45,
        ),
        iconSize: 20.sp,
        buttonHeight: 45.sp,

        buttonPadding:  EdgeInsets.only(left: 10.w, right: 10.w),
        dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.sp),
            border: Border.all(color: homeController.isRentPrimaryColor.value?AppColors.redGradientOneColor:AppColors.purPleGradientTwoColor)
        ),
        items: menu.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            onTap: (){

            },
            child: Text(
              item,

              style: TextStyle(
                  fontSize: 12.sp, color: AppColors.textFieldDefaultColor,
fontFamily: 'Roboto-Black'
//backgroundColor: Colors.red
              ),
            ),
          );
        }).toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select gender.';
          }
        },

        onChanged: onChange,
        onSaved: (value) {
          print('onsasved');
        },
      ),
    );
  }
}
