import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
import '../../widget/form_text_field.dart';
class TenantDetailsScreen extends StatelessWidget {
  const TenantDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffEDF0F6),
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

              },
              child: Container(
                width: 16.w,
                height: 14.h,
               child: Image.asset('asset/icon/back.png',color: AppColors.textFieldDefaultColor),
              ),
            ),
            title: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("G15 Property Details",
                    style:AppStyles.appBarStyle()),
                Text("(Tenant Details)",style: AppStyles.highlightsTextStyle(),)
              ],
            ),
            // actions: [
            //   Container(
            //     width: 25.w,
            //     height: 25.h,
            //     decoration: const BoxDecoration(
            //         image: DecorationImage(
            //             image: AssetImage("asset/icon/appbarIcon.png"))),
            //   ),
            //   SizedBox(
            //     width: 16.w,
            //   )
            // ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 50.sp,
                        foregroundImage: const AssetImage('asset/icon/human.png'),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Text("Faisal Usman",style: AppStyles.labelValueStyle(),)
                    ],
                  ),
//                     SizedBox(
//                       width: 29.w,
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                           width: 180.w,
//                           child: AppFormTextField(
//                             // textController: agentController.projectController.value,
// isCompulsory: false,
//
//                             enabled: true,
//                             lablel: "NIC Photo",
//
//                             height: 10.sp,
//
//                             suffixIcon: "asset/icon/file.jpg",
//                           ),
//                         ),
//                         SizedBox(
//                           height: 28.h,
//                         ),
//                         Container(
//                           width: 180.w,
//                           child: AppFormTextField(
//
//                             // textController: agentController.projectController.value,
// isCompulsory: false,
//                             enabled: true,
//                             lablel: "Passport Photo",
//
//                             height: 10.sp,
//
//                             suffixIcon: "asset/icon/file.jpg",
//                           ),
//                         ),
//                         SizedBox(
//                           height: 28.h,
//                         ),
//                         Container(
//                           width: 180.w,
//                           child: AppFormTextField(
//                             // textController: agentController.projectController.value,
// isCompulsory: false,
//                             enabled: true,
//                             lablel: "Passport Photo",
//
//                             height: 10.sp,
//
//                             suffixIcon: "asset/icon/file.jpg",
//                           ),
//                         ),
//                       ],
//                     )
                ],
              ),
              SizedBox(
                height: 8.h,
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
                                height: 20.h,
                              ),
                              TenantDetails(value: 'Faisal Usman',label: 'Added by:',),
                              // Row(
                              //   children: [
                              //     Text("Added by:",
                              //         style: AppStyles.highlightsTextStyle()),
                              //     Expanded(child: SizedBox()),
                              //     Container(
                              //         width: 150.w,
                              //         alignment: Alignment.topRight,
                              //         child: Text("Faisal Usman"))
                              //   ],
                              // ),
                              SizedBox(
                                height: 17.h,
                              ),
                              TenantDetails(value: 'Customer Type',label: 'Person',),

                              // Row(
                              //   children: [
                              //     Text("Customer Type",
                              //         style: AppStyles.highlightsTextStyle()),
                              //     Expanded(child: SizedBox()),
                              //     Container(
                              //         width: 150.w,
                              //         alignment: Alignment.topRight,
                              //         child: Text("Person"))
                              //   ],
                              // ),
                              SizedBox(
                                height: 17.h,
                              ),
                              TenantDetails(value: '03325156429',label: 'Number',),

                              // Row(
                              //   children: [
                              //     Text("Number",
                              //         style: AppStyles.highlightsTextStyle()),
                              //     Expanded(child: SizedBox()),
                              //     Container(
                              //         width: 150.w,
                              //         alignment: Alignment.topRight,
                              //         child: Text("03325156429"))
                              //   ],
                              // ),
                              SizedBox(
                                height: 17.h,
                              ),
                              TenantDetails(label: 'Email',value:'faisalusmankktk495@gmail.com' ),

                              // Row(
                              //   children: [
                              //     Text("Email", style: AppStyles.highlightsTextStyle()),
                              //     Expanded(child: SizedBox()),
                              //     Container(
                              //         width: 150.w,
                              //         alignment: Alignment.topRight,
                              //         child: Text(
                              //           "faisalusmankktk495@gmail.com",
                              //         ))
                              //   ],
                              // ),
                              SizedBox(
                                height: 17.h,
                              ),
                              TenantDetails(label: 'Date of Birth',value:'25-3-1993' ),

                              // Row(
                              //   children: [
                              //     Text("Date of Birth",
                              //         style: AppStyles.highlightsTextStyle()),
                              //     Expanded(child: SizedBox()),
                              //     Container(
                              //         width: 150.w,
                              //         alignment: Alignment.topRight,
                              //         child: Text("25-3-1993"))
                              //   ],
                              // ),

                       SizedBox(
                                height: 17.h,
                              ),
                              TenantDetails(label: 'National ID No',value:'101918-5681289-5' ),

                              // Row(
                              //   children: [
                              //     Text("National ID No",
                              //         style: AppStyles.highlightsTextStyle()),
                              //     Expanded(child: SizedBox()),
                              //     Container(
                              //       width: 150.w,
                              //       alignment: Alignment.topRight,
                              //       child: Text("101918-5681289-5"),
                              //     ),
                              //   ],
                              // ),
                                  SizedBox(
                                height: 17.h,
                              ),
                              TenantDetails(label: 'Passport Number',value:'12454534534' ),

                              // Row(
                              //   children: [
                              //     Text("Passport Number",
                              //         style: AppStyles.highlightsTextStyle()),
                              //     Expanded(child: SizedBox()),
                              //     Container(
                              //       width: 150.w,
                              //       alignment: Alignment.topRight,
                              //       child: Text("12454534534"),
                              //     ),
                              //   ],
                              // ),
                                SizedBox(
                                height: 17.h,
                              ),
                              TenantDetails(label: 'Payment Team',value:'Monthly' ),

                              // Row(
                              //   children: [
                              //     Text("Payment Team",
                              //         style: AppStyles.highlightsTextStyle()),
                              //     Expanded(child: SizedBox()),
                              //     Container(
                              //       width: 150.w,
                              //       alignment: Alignment.topRight,
                              //       child: Text("Monthly"),
                              //     ),
                              //   ],
                              // ),
                              SizedBox(
                                height: 17.h,
                              ),
                              TenantDetails(label: 'Present Address',value:'House No : 12, Street 2, Margala Road, F-6/3 Islamabad, Pakistan' ),

                              // Row(
                              //   children: [
                              //     Text("Present Address",
                              //         style: AppStyles.highlightsTextStyle()),
                              //      Expanded(child: SizedBox()),
                              //     Container(
                              //         width: 150.w,
                              //         child: Text(
                              //           "House No : 12, Street 2, Margala Road, F-6/3 Islamabad, Pakistan",
                              //           style: TextStyle(fontSize: 12.sp),
                              //         )),
                              //   ],
                              // ),
                                 SizedBox(
                                height: 17.h,
                              ),
                              TenantDetails(label: 'Permanent Address',value:'House No : 12, Street 2, Margala Road, F-6/3 Islamabad, Pakistan' ),

                              // Row(
                              //   children: [
                              //     Text("Permanent Address",
                              //         style: AppStyles.highlightsTextStyle()),
                              //      Expanded(child: SizedBox()),
                              //     Container(
                              //         width: 150.w,
                              //         child: Text(
                              //           "House No : 12, Street 2, Margala Road, F-6/3 Islamabad, Pakistan",
                              //           style: TextStyle(fontSize: 12.sp),
                              //         )),
                              //   ],
                              // ),

                              SizedBox(
                                height: 17.h,
                              ),
                              Row(
                                children: [
                                  Text('NIC Photo',
                                      style:AppStyles.highlightsTextStyle()),
                                  Expanded(child: const SizedBox()),
                                  Container(
                                      width: 150.w,

                                      alignment: Alignment.topRight,
                                      padding: EdgeInsets.zero,
                                      child: InkWell(
                                          onTap: (){

                                          },
                                          child: Text('see here',style: AppStyles.TextButtonStyle(),)))
                                ],
                              ),
                              SizedBox(
                                height: 17.h,
                              ),
                              Row(
                                children: [
                                  Text('Passport Photo',
                                      style:AppStyles.highlightsTextStyle()),
                                  Expanded(child: SizedBox()),
                                  Container(
                                      width: 150.w,

                                      padding: EdgeInsets.zero,
                                      alignment: Alignment.topRight,
                                      child: InkWell(
                                          onTap: (){

                                          },
                                          child: Text('see here',style: AppStyles.TextButtonStyle(),)))
                                ],
                              ),
                              SizedBox(
                                height: 17.h,
                              ),
                              Row(
                                children: [
                                  Text("Action:",
                                      style: AppStyles.highlightsTextStyle()),
                                  Expanded(child: SizedBox()),
                                  Card(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w, vertical: 3.h),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.sp),
                                          color: AppColors.greenColor),
                                      child: Text("Edit",
                                          style:
                                          TextStyle(color: AppColors.whiteColor)),
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
                                          style: TextStyle(color: AppColors.redColor)),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 34.h,
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

            ],
          ),
        ));
  }
}

class TenantDetails extends StatelessWidget {
  String? label;
  String? value;
  TenantDetails({required this.label,required this.value});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(label!,
            style:AppStyles.highlightsTextStyle()),
        Expanded(child: SizedBox()),
        Container(
            width: 150.w,
            alignment: Alignment.topRight,
            child: Text(value!,style: AppStyles.labelValueStyle(),))
      ],
    );
  }
}