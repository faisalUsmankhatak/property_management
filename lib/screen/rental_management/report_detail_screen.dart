import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
class ReportDetailsScreen extends StatefulWidget {
  const ReportDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ReportDetailsScreen> createState() => _ReportDetailsScreenState();
}

class _ReportDetailsScreenState extends State<ReportDetailsScreen> {
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
                Get.back();
              },
              child: Container(
                width: 16.w,
                height: 14.h,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('asset/icon/back.png'))),
              ),
            ),
            title: Text("G15 Property Details",
                style: TextStyle(color: Color(0xff7A539C), fontSize: 20.sp)),
            actions: [
              Container(
                width: 25.w,
                height: 25.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("asset/icon/appbarIcon.png"))),
              ),
              SizedBox(
                width: 16.w,
              )
            ],
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
                          Row(
                            children: [
                              Text("Added by:",
                                  style: AppStyles.highlightsTextStyle()),
                              Expanded(child: SizedBox()),
                              Container(
                                  width: 150.w,
                                  alignment: Alignment.topRight,
                                  child: Text("Faisal Usman"))
                            ],
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                            children: [
                              Text("Property:",
                                  style:AppStyles.highlightsTextStyle()),
                              Expanded(child: SizedBox()),
                              Container(
                                  width: 150.w,
                                  alignment: Alignment.topRight,
                                  child: Text("Commercial"))
                            ],
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                            children: [
                              Text("Tenant:",
                                  style: AppStyles.highlightsTextStyle()),
                              Expanded(child: SizedBox()),
                              Container(
                                  width: 150.w,
                                  alignment: Alignment.topRight,
                                  child: Text("House"))
                            ],
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                            children: [
                              Text("Number:",
                                  style:AppStyles.highlightsTextStyle()),
                              Expanded(child: SizedBox()),
                              Container(

                                  width: 150.w,
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    " House No : 12, Street 2, Margala Road, F-6/3 Islamabad, Pakistan",
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                            children: [
                              Text("Email:",
                                  style: AppStyles.highlightsTextStyle()),
                              Expanded(child: SizedBox()),
                              Container(
                                  width: 150.w,
                                  alignment: Alignment.topRight,
                                  child: Text("G15 Markaz"))
                            ],
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                            children: [
                              Text("Address:",
                                  style: AppStyles.highlightsTextStyle()),
                              Expanded(child: SizedBox()),
                              Container(
                                  width: 150.w,
                                  alignment: Alignment.topRight,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("Faisal Usman"),
                                      SizedBox(width: 11.w,),
                                      InkWell(
                                          onTap: (){
                                            print("ei");
                                          //  Get.to( OwnerDetailsScreen());
                                          },
                                          child: Icon(Icons.arrow_forward_ios,size: 14,color: Color(0xff757D8A),))

                                    ],
                                  )),

                            ],
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                            children: [
                              Text("Rented Property:",
                                  style: AppStyles.highlightsTextStyle()),
                              Expanded(child: SizedBox()),
                              Container(
                                  width: 150.w,
                                  alignment: Alignment.topRight,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("Sabahat Hussain"),
                                      SizedBox(width: 11.w,),
                                      InkWell(
                                          onTap: (){
                                           // Get.to(TenantDetailsScreen());
                                          },
                                          child: Icon(Icons.arrow_forward_ios,size: 14,color: Color(0xff757D8A),))

                                    ],
                                  )),


                            ],
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Row(
                            children: [
                              Text("Commission Amount:",
                                  style: AppStyles.highlightsTextStyle()),
                              Expanded(child: SizedBox()),
                              Container(
                                width: 20.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.green, width: 2.sp)),
                                child: Icon(
                                  Icons.done,
                                  size: 13.sp,
                                  color: AppColors.greenColor,
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                "Active",
                                style: TextStyle(color: AppColors.greenColor),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                            children: [
                              Text("Pay Amount:",
                                  style: AppStyles.highlightsTextStyle()),
                              Expanded(child: SizedBox()),
                              Container(
                                width: 150.w,
                                alignment: Alignment.topRight,
                                child: const Text("PKR 99,99,00")
                              )
                            ],
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                            children: [
                              Text("Total Rent:",
                                  style: AppStyles.highlightsTextStyle()),
                              Expanded(child: SizedBox()),
                              Container(
                                  width: 150.w,
                                  alignment: Alignment.topRight,
                                  child: Text("PKR 99,99,00"))
                            ],
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                            children: [
                              Text("Total Arrears:",
                                  style:AppStyles.highlightsTextStyle()),
                              Expanded(child: SizedBox()),
                              Container(
                                  width: 150.w,
                                  alignment: Alignment.topRight,
                                  child: Text("PKR 99,99,00"))
                            ],
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                            children: [
                              Text("Total Pay:",
                                  style:AppStyles.highlightsTextStyle()),
                              Expanded(child: SizedBox()),
                              Container(
                                  width: 150.w,
                                  alignment: Alignment.topRight,
                                  child: Text("PKR 99,99,00"))
                            ],
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                            children: [
                              Text("Total Commission:",
                                  style:AppStyles.highlightsTextStyle()),
                              Expanded(child: SizedBox()),
                              Container(
                                  width: 150.w,
                                  alignment: Alignment.topRight,
                                  child: Text("PKR 99,99,00"))
                            ],
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                            children: [
                              Text("Print Invoice:",
                                  style:AppStyles.highlightsTextStyle()),
                              Expanded(child: SizedBox()),
                              Container(
                                  width: 150.w,
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                      onTap: (){

                                      },
                                      child: Text("Click Here")))
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
