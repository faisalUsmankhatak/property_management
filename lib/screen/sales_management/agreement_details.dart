import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
import '../rental_sales_management/tenant_details_screen.dart';
import 'add_agreement.dart';
class AgreementDetails extends StatefulWidget {
  const AgreementDetails({Key? key}) : super(key: key);

  @override
  State<AgreementDetails> createState() => _AgreementDetailsState();
}

class _AgreementDetailsState extends State<AgreementDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundColorTextColor,
          appBar: AppBar(
            backgroundColor: AppColors.backgroundColorTextColor,
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
              child:Container(
                width: 16.w,
                height: 14.h,
                child: Image.asset('asset/icon/back.png',color: AppColors.textFieldDefaultColor),
              ),
            ),
            title: Text("G15 Property Details",
                style: AppStyles.appBarStyle()),

          ),
          body: Column(
            children: [

              SizedBox(
                height: 51.h,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.sp),
                      topRight: Radius.circular(20.sp),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 31.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40.h,
                          ),
                          AgreementData(label: 'Property Name:',value: 'Faisal Usman',),

                          SizedBox(
                            height: 24.h,
                          ),
                          AgreementData(label: 'Owner Name:',value: 'Commercial',),

                          // Row(
                          //   children: [
                          //     Text("Owner Name:",
                          //         style:AppStyles.highlightsTextStyle()),
                          //     Expanded(child: SizedBox()),
                          //     Container(
                          //         width: 150.w,
                          //         alignment: Alignment.topRight,
                          //         child: Text("Commercial"))
                          //   ],
                          // ),
                          SizedBox(
                            height: 24.h,
                          ),
                          AgreementData(label: 'Owner CNIC No#:',value: 'House',),

                          // Row(
                          //   children: [
                          //     Text("Owner CNIC No#:",
                          //         style: AppStyles.highlightsTextStyle()),
                          //     Expanded(child: SizedBox()),
                          //     Container(
                          //         width: 150.w,
                          //         alignment: Alignment.topRight,
                          //         child: Text("House"))
                          //   ],
                          // ),
                          SizedBox(
                            height: 24.h,
                          ),
                          AgreementData(label: 'Property Sale Price:',value: '3423432',),

                          // Row(
                          //   children: [
                          //     Text("Property Sale Price:",
                          //         style:AppStyles.highlightsTextStyle()),
                          //     Expanded(child: SizedBox()),
                          //     Container(
                          //
                          //         width: 150.w,
                          //         alignment: Alignment.topRight,
                          //         child: Text(
                          //           " House No : 12, Street 2, Margala Road, F-6/3 Islamabad, Pakistan",
                          //         ))
                          //   ],
                          // ),
                          SizedBox(
                            height: 24.h,
                          ),
                          AgreementData(label: 'Agent Commission:',value: '232',),

                          // Row(
                          //   children: [
                          //     Text("Agent Commission:",
                          //         style: AppStyles.highlightsTextStyle()),
                          //     Expanded(child: SizedBox()),
                          //     Container(
                          //         width: 150.w,
                          //         alignment: Alignment.topRight,
                          //         child: Text("G15 Markaz"))
                          //   ],
                          // ),
                          SizedBox(
                            height: 24.h,
                          ),
                          AgreementData(label: 'Commission Amount:',value: '232',),

                          // Row(
                          //   children: [
                          //     Text("Commission Amount:",
                          //         style: AppStyles.highlightsTextStyle()),
                          //     Expanded(child: SizedBox()),
                          //     Container(
                          //         width: 150.w,
                          //         alignment: Alignment.topRight,
                          //         child: Text("342564")),
                          //
                          //   ],
                          // ),
                          SizedBox(
                            height: 24.h,
                          ),
                          AgreementData(label: 'Agent Name:',value: 'Sabahat Hussain',),

                          // Row(
                          //   children: [
                          //     Text("Agent Name:",
                          //         style: AppStyles.highlightsTextStyle()),
                          //     Expanded(child: SizedBox()),
                          //     Container(
                          //         width: 150.w,
                          //         alignment: Alignment.topRight,
                          //         child: Row(mainAxisAlignment: MainAxisAlignment.end,
                          //           children: [
                          //             Text("Sabahat Hussain"),
                          //             SizedBox(width: 11.w,),
                          //             InkWell(
                          //                 onTap: (){
                          //                   Get.to(TenantDetailsScreen());
                          //                 },
                          //                 child: Icon(Icons.arrow_forward_ios,size: 14,color: Color(0xff757D8A),))
                          //
                          //           ],
                          //         )),
                          //
                          //
                          //   ],
                          // ),
                          SizedBox(
                            height: 24.h,
                          ),
                          AgreementData(label: 'Agent CNIC No#:',value: '14301-4819175-7',),

                          // Row(
                          //   children: [
                          //     Text("Agent CNIC No#:",
                          //         style: AppStyles.highlightsTextStyle()),
                          //     Expanded(child: SizedBox()),
                          //     Container(
                          //       width: 150.w,
                          //       height: 20.h,
                          //         alignment: Alignment.topRight,
                          //       child: const Text('14301-4819175-7')
                          //     ),
                          //
                          //   ],
                          // ),
                          SizedBox(
                            height: 24.h,
                          ),


                          Row(
                            children: [
                              Text("Commission Agreement:",
                                  style: AppStyles.highlightsTextStyle()),
                              Expanded(child: SizedBox()),
                              Container(
                                  width: 130.w,
                                  alignment: Alignment.topRight,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                          onTap:(){},
                                          child: Text("See or Print",style: AppStyles.labelValueStyle(color: AppColors.redGradientTwoColor),)),
                                      SizedBox(width: 11.w,),
                                      InkWell(
                                          onTap: (){
                                            // Get.to(TenantDetailsScreen());
                                          },
                                          child: Icon(Icons.arrow_forward_ios,size: 14,color: AppColors.textFieldDefaultColor,))

                                    ],
                                  )),
                            ],
                          ),

                          SizedBox(
                            height: 24.h,
                          ),

                          Row(
                            children: [
                              Text("Action:",
                                  style:AppStyles.highlightsTextStyle()),
                              Expanded(child: SizedBox()),
                              InkWell(
                                onTap: (){
                                  Get.to(AddAgreement(status: 'Edit',));
                                },
                                child: Card(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 3.h),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.sp),
                                        color: AppColors.greenColor),
                                    child: Text("Edit",
                                        style:
                                        TextStyle(color: AppColors.whiteColor,fontFamily: 'Roboto-Black')),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Card(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.w, vertical: 3.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.sp),
                                      color: AppColors.whiteColor),
                                  child: Text("Delete",
                                      style: TextStyle(color: AppColors.redColor,fontFamily: 'Roboto-Black')),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
class AgreementData extends StatelessWidget {
  String? label;
  String? value;
  AgreementData({required this.label,required this.value});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(label!,
            style:AppStyles.highlightsTextStyle()),
        Expanded(child: SizedBox()),
        Container(
            width: 146.w,
            alignment: Alignment.topRight,
            child: Text(value!,style: AppStyles.labelValueStyle(),))
      ],
    );
  }
}