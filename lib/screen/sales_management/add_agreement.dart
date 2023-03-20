import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:property_management/app_confiq/app_style.dart';

import '../../app_confiq/app_colors.dart';
import '../../controller/agreement_controller.dart';
import '../../widget/alert_button.dart';
import '../../widget/drop_down_field.dart';
import '../../widget/form_button.dart';
import '../../widget/form_text_field.dart';
class AddAgreement extends StatelessWidget {
  String status;
   AddAgreement({required this.status}) ;
List<String> property=['G15 Property','G1 Property','G Property'];
  AgreementController agreementController=Get.put(AgreementController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      floatingActionButton:  Padding(
          padding: EdgeInsets.only(left: 25.w,right: 5.w),
          child: FormButton(width: double.infinity,bodyColor: Colors.grey,buttonText: status,borderColor: Colors.grey.withOpacity(0.5),radius: 50.sp)),
      // Padding(
      //   padding:  EdgeInsets.symmetric(horizontal: 15.w),
      //   child: AlertButton(label: status,backGroundColor: AppColors.greyColor),
      // ),
      appBar: AppBar(
        backgroundColor:AppColors.backgroundColorTextColor,
        elevation: 4.sp,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(
                20.sp,
              ),
              bottomLeft: Radius.circular(20.sp),
            ),
            borderSide: BorderSide(color: AppColors.backgroundColorTextColor,)),
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: SizedBox(
            width: 16.w,
            height: 14.h,
            child: Image.asset('asset/icon/back.png',color: AppColors.textFieldDefaultColor),
          ),
        ),
        title: Text("Add $status Agreement",
            style:AppStyles.appBarStyle(color: AppColors.redGradientTwoColor)),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            SizedBox(height:50.h,),

                   Obx(()=>
                          DropDownField(
                label: 'Select Property',
                menu: property,
                selectValue:agreementController.selectPropertyController.value.text==''?null: agreementController.selectPropertyController.value.text,
                isChangeIcon: true, labelWidth: 95,
                onChange: (value){
                  agreementController.selectPropertyController.value.text;
                },

              ),
                   ),

            SizedBox(height: 18.h,),
            Row(
              children: [
                Flexible(child: AppFormTextField(enabled: true,textController: agreementController.propertyNameController, lablel: 'Property Name', isCompulsory: true,)),
                SizedBox(width: 18.h,),
                Flexible(child: AppFormTextField(enabled: true,textController: agreementController.ownerCNICNoController, lablel: 'Owner CNIC No', isCompulsory: true,)),

              ],
            ),

            SizedBox(height: 18.h,),
            Row(
              children: [
                Flexible(child: AppFormTextField(enabled: true,textController: agreementController.agentNameController, lablel: 'Agent Name', isCompulsory: true,)),
                SizedBox(width: 18.h,),
                Flexible(child: AppFormTextField(enabled: true,textController: agreementController.ownerCNICNoController, lablel: 'Agent CNIC NO', isCompulsory: true,)),

              ],
            ),

            SizedBox(height: 18.h,),
            Row(
              children: [
                Flexible(child: AppFormTextField(enabled: true,textController: agreementController.propertySalePriceController, lablel: 'Property Sale Price', isCompulsory: true,)),
                SizedBox(width: 18.h,),
                Flexible(child: AppFormTextField(enabled: true,textController: agreementController.percentageController, lablel: 'Percentage', isCompulsory: true)),

              ],
            ),

            SizedBox(height: 18.h,),
            AppFormTextField(enabled: true,textController: agreementController.commissionController, lablel: 'Commission', isCompulsory: true,),
            SizedBox(height: 15.h,),
            //GridViewButton(title: 'Add',)

          ],
        ),
      ),
    ));
  }
}
