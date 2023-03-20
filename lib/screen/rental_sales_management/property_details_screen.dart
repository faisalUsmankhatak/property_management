import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:property_management/screen/rental_sales_management/tenant_details_screen.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
import '../../controller/rental_sales_controller.dart';
import '../sales_management/add_agreement.dart';
import 'owner_details_screen.dart';

class PropertyDetailsScreen extends StatelessWidget {
   PropertyDetailsScreen({Key? key}) : super(key: key);
  RentalSalesController rentalSalesController=Get.put(RentalSalesController());
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
            child: Image.asset('asset/icon/back.png',color: AppColors.purPleGradientTwoColor),
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
                      PropertyDetails(label: 'Added by:', value: 'Faisal Usman'),

                      SizedBox(
                        height: 24.h,
                      ),
                      PropertyDetails(label: 'Property Category :', value: 'Commercial'),

                      SizedBox(
                        height: 24.h,
                      ),

                      PropertyDetails(label: 'Property Type:', value: 'House'),

                      SizedBox(
                        height: 24.h,
                      ),
                      PropertyDetails(label: 'Property Address:', value: 'House No : 12, Street 2, Margala Road, F-6/3 Islamabad, Pakistan'),

                      SizedBox(
                        height: 24.h,
                      ),
                      PropertyDetails(label: 'Area', value: 'G15 Markaz'),


                      SizedBox(
                        height: 24.h,
                      ),

                      Row(
                        children: [
                          Text("Owner Name:",
                              style: AppStyles.highlightsTextStyle()),
                          Expanded(child: SizedBox()),
                          Container(
                              width: 150.w,
                              alignment: Alignment.topRight,
                              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Faisal Usman",style: AppStyles.labelValueStyle()),
                                  SizedBox(width: 11.w,),
                                  InkWell(
                                      onTap: (){
                                        print("ei");
Get.to( OwnerDetailsScreen());
                                      },
                                      child: Icon(Icons.arrow_forward_ios,size: 14,color:AppColors.textFieldDefaultColor,))

                                ],
                              )),

                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        children: [
                          Text("Tenant Name:",
                              style: AppStyles.highlightsTextStyle()),
                          Expanded(child: SizedBox()),
                          Container(
                              width: 150.w,
                              alignment: Alignment.topRight,
                              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Sabahat Hussain",style: AppStyles.labelValueStyle()),
                                  SizedBox(width: 11.w,),
                                  InkWell(
                                      onTap: (){
                                        Get.to(const TenantDetailsScreen());
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
                          Text("Occopency Status:",
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
                            style: TextStyle(color: AppColors.greenColor,fontFamily: 'Roboto-Black'),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),

                      Row(
                        children: [
                          Text("Rent Invoice:",
                              style: AppStyles.highlightsTextStyle()),
                          Expanded(child: SizedBox()),
                          Container(
                            width: 150.w,
                            alignment: Alignment.topRight,
                            child: InkWell(
                                onTap: (){

                                },
                                child: TextButton(

                                  onPressed: (){}, child: Text("Click here to see",style: TextStyle(
                                  fontSize: 15.sp,
                                  color: AppColors.greenColor,

                                  fontFamily: 'Roboto-Black',

                                ),),

                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      PropertyDetails(label: 'Payments Received:', value: 'PKR 99,99,00'),

                      SizedBox(
                        height: 24.h,
                      ),
                      PropertyDetails(label: 'Belance:', value: 'PKR 99,99,00'),

                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        children: [
                          Text("Action:",
                              style:AppStyles.highlightsTextStyle()),
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
                                      TextStyle(color: AppColors.whiteColor,fontFamily: 'Roboto-Black')),
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

class PropertyDetails extends StatelessWidget {
  String? label;
  String? value;
   PropertyDetails({required this.label,required this.value});

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
