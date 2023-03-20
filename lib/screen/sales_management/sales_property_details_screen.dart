import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
import '../../widget/form_button.dart';
import 'add_bayer_And_Installment.dart';
import 'add_buyer_details_for_sales.dart';
class SalesPropertyDetailsScreen extends StatefulWidget {
  const SalesPropertyDetailsScreen({Key? key}) : super(key: key);

  @override
  State<SalesPropertyDetailsScreen> createState() => _SalesPropertyDetailsScreenState();
}

class _SalesPropertyDetailsScreenState extends State<SalesPropertyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          // backgroundColor: Color(0xffEDF0F6),
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
              child:Container(
                width: 16.w,
                height: 14.h,
                child: Image.asset('asset/icon/back.png',color: AppColors.redGradientTwoColor),
              ),
            ),
            title: Text("G15 Property Details",
                style: AppStyles.appBarStyle(color: AppColors.redGradientTwoColor)),
            // actions: [
            //   Container(
            //     width: 25.w,
            //     height: 25.h,
            //     decoration: const BoxDecoration(
            //         image: DecorationImage(
            //             image: AssetImage("asset/icon/appbarRedMenuIcon.png"))),
            //   ),
            //   SizedBox(
            //     width: 16.w,
            //   )
            // ],
          ),
          body: Column(
            children: [

              // SizedBox(
              //   height: 51.h,
              // ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    // borderRadius: BorderRadius.only(
                    //   topLeft: Radius.circular(20.sp),
                    //   topRight: Radius.circular(20.sp),
                    // ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 31.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40.h,
                          ),
                          SalesPropertyDetails(label: 'Added by:',value: 'Faisal Usman',),

                          SizedBox(
                            height: 24.h,
                          ),
                          SalesPropertyDetails(label: 'Property Catagory:',value: 'Commercial',),


                          SizedBox(
                            height: 24.h,
                          ),
                          SalesPropertyDetails(label: 'Property Type:',value: 'House',),


                          SizedBox(
                            height: 24.h,
                          ),
                          SalesPropertyDetails(label: 'No Of Bedrooms:',value: '4',),


                          SizedBox(
                            height: 24.h,
                          ),
                          SalesPropertyDetails(label: 'No Of Kitchens:',value: '3',),


                          SizedBox(
                            height: 24.h,
                          ),
                          SalesPropertyDetails(label: 'No Of Washroom:',value: '7',),


                          SizedBox(
                            height: 24.h,
                          ),
                          SalesPropertyDetails(label: 'No Of Shops:',value: '0',),


                          SizedBox(
                            height: 50.h,
                          ),
                          SalesPropertyDetails(label: 'No Of Flats/Apartments:',value: '0',),


                          SizedBox(
                            height: 24.h,
                          ),
                          SalesPropertyDetails(label: 'No Of Floor:',value: '0',),
                          SizedBox(
                            height: 24.h,
                          ),
                          SalesPropertyDetails(label: 'Property Address:',value: 'House No : 12, Street 2, Margala Road, F-6/3 Islamabad, Pakistan',),


                          SizedBox(
                            height: 24.h,
                          ),
                          SalesPropertyDetails(label: 'Area:',value: 'PKR 99,99,00',),


                          SizedBox(
                            height: 24.h,
                          ),
                          SalesPropertyDetails(label: 'Square Feet:',value: 'PKR 99,99,00',),


                          SizedBox(
                            height: 24.h,
                          ),
                          SalesPropertyDetails(label: 'Square Yard:',value: 'PKR 99,99,00',),

                          SizedBox(
                            height: 24.h,
                          ),
                          SalesPropertyDetails(label: 'Kanal:',value: 'PKR 99,99,00',),


                          SizedBox(
                            height: 24.h,
                          ),
                          SalesPropertyDetails(label: 'Marla:',value: 'PKR 99,99,00',),


                          SizedBox(
                            height: 24.h,
                          ),

                          SalesPropertyDetails(label: 'Status:',value: 'PKR 99,99,00',),

                          SizedBox(
                            height: 24.h,
                          ),



                          InkWell(
                            onTap: (){
                              bootomSheet();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border:Border.all(color: AppColors.redGradientOneColor,width: 1.w),
                                borderRadius: BorderRadius.circular(10.sp)
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                              child:Text('View Property Owners Details',style: TextStyle(
                                  color: AppColors.redColor
                              ),) ,
                            ),
                          ),

SizedBox(height: 10.h,),
                          Container(
                            height: 0.9,
                            color:AppColors.textFieldDefaultColor
                          ),
                          SizedBox(height: 18.h,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: (){
                                  Get.to(const AddBuyerDetailsForSales());
                                //  bootomSheet();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.redGradientOneColor,
                                      // border:Border.all(color: AppColors.redGradientOneColor,width: 1.w),
                                      borderRadius: BorderRadius.circular(10.sp)
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                                  child:Text('Sales',style: TextStyle(
                                      color: AppColors.whiteColor
                                  ),) ,
                                ),
                              ),

                              InkWell(
                                onTap: (){
                                  Get.to(const AddBuyerAndInstallment());
                                //  bootomSheet();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff2093FE),
                                      // border:Border.all(color: AppColors.redGradientOneColor,width: 1.w),
                                      borderRadius: BorderRadius.circular(10.sp)
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                                  child:Text('Installment',style: TextStyle(
                                      color: AppColors.whiteColor
                                  ),) ,
                                ),
                              ),

                              InkWell(
                                onTap: (){
                               //   bootomSheet();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff37B899),
                                      // border:Border.all(color: AppColors.redGradientOneColor,width: 1.w),
                                      borderRadius: BorderRadius.circular(10.sp)
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                                  child:Text('Edit',style: TextStyle(
                                      color: AppColors.whiteColor
                                  ),) ,
                                ),
                              ),

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
Future<void>  bootomSheet() {
 return showModalBottomSheet<void>(
   isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20.sp),topLeft: Radius.circular(20.sp))),
    builder: (BuildContext context) {
      return Container(
       // height: 100.h,
        
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20.sp),topLeft: Radius.circular(20.sp))
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[


           InkWell(
             onTap: () {
               Get.back();
             },
             child: Container(

               alignment: Alignment.center,
               child: Icon(Icons.close,size: 30.sp),
             ),
           ),
            SizedBox(height: 30.h,),
            SalesPropertyDetails(label: 'Owner Type:',value: 'Person',),

            // Row(
            //   children: [
            //     Text("Owner Type",
            //         style:AppStyles.highlightsTextStyle()),
            //     Expanded(child: SizedBox()),
            //     Container(
            //         width: 150.w,
            //         alignment: Alignment.topRight,
            //         child: Text("Person"))
            //   ],
            // ),
            SizedBox(height: 18.h,),
            SalesPropertyDetails(label: 'Owner Name:',value: 'Faisal Usman',),

            // Row(
            //   children: [
            //     Text("Owner Name",
            //         style:AppStyles.highlightsTextStyle()),
            //     Expanded(child: SizedBox()),
            //     Container(
            //         width: 150.w,
            //         alignment: Alignment.topRight,
            //         child: Text("Faisal Usman"))
            //   ],
            // ),
            SizedBox(height: 18.h,),
            SalesPropertyDetails(label: 'Number:',value: 'Faisal Usman',),

            // Row(
            //   children: [
            //     Text("Number",
            //         style:AppStyles.highlightsTextStyle()),
            //     Expanded(child: SizedBox()),
            //     Container(
            //         width: 150.w,
            //         alignment: Alignment.topRight,
            //         child: Text("Faisal Usman"))
            //   ],
            // ),
            SizedBox(height: 18.h,),
            SalesPropertyDetails(label: 'Email:',value: 'Faisal Usman',),

            // Row(
            //   children: [
            //     Text("Email",
            //         style:AppStyles.highlightsTextStyle()),
            //     Expanded(child: SizedBox()),
            //     Container(
            //         width: 150.w,
            //         alignment: Alignment.topRight,
            //         child: Text("Faisal Usman"))
            //   ],
            // ),
            SizedBox(height: 18.h,),
            SalesPropertyDetails(label: 'Date Of Birth:',value: 'Faisal Usman',),

            // Row(
            //   children: [
            //     Text("Date Of Birth",
            //         style:AppStyles.highlightsTextStyle()),
            //     Expanded(child: SizedBox()),
            //     Container(
            //         width: 150.w,
            //         alignment: Alignment.topRight,
            //         child: Text("Faisal Usman"))
            //   ],
            // ),
            SizedBox(height: 18.h,),
            SalesPropertyDetails(label: 'National ID No:',value: 'Faisal Usman',),

            // Row(
            //   children: [
            //     Text("National ID No",
            //         style:AppStyles.highlightsTextStyle()),
            //     Expanded(child: SizedBox()),
            //     Container(
            //         width: 150.w,
            //         alignment: Alignment.topRight,
            //         child: Text("Faisal Usman"))
            //   ],
            // ),
            SizedBox(height: 18.h,),
            SalesPropertyDetails(label: 'Passport No:',value: 'Faisal Usman',),

            // Row(
            //   children: [
            //     Text("Passport No",
            //         style:AppStyles.highlightsTextStyle()),
            //     Expanded(child: SizedBox()),
            //     Container(
            //         width: 150.w,
            //         alignment: Alignment.topRight,
            //         child: Text("Faisal Usman"))
            //   ],
            // ),
            SizedBox(height: 18.h,),
            SalesPropertyDetails(label: 'Present Address:',value: 'Faisal Usman',),

            // Row(
            //   children: [
            //     Text("Present Address",
            //         style:AppStyles.highlightsTextStyle()),
            //     Expanded(child: SizedBox()),
            //     Container(
            //         width: 150.w,
            //         alignment: Alignment.topRight,
            //         child: Text("Faisal Usman"))
            //   ],
            // ),
            SizedBox(height: 18.h,),
            SalesPropertyDetails(label: 'Permanent Address:',value: 'Faisal Usman',),

            // Row(
            //   children: [
            //     Text("Permanent Address",
            //         style:AppStyles.highlightsTextStyle()),
            //     Expanded(child: SizedBox()),
            //     Container(
            //         width: 150.w,
            //         alignment: Alignment.topRight,
            //         child: Text("Faisal Usman"))
            //   ],
            // ),




            SizedBox(height: 18.h,),
           // SalesPropertyDetails(label: 'CNIC Front:',value: 'Faisal Usman',),
            Row(
              children: [
                Text("CNIC Front:",
                    style: AppStyles.highlightsTextStyle()),
                Expanded(child: SizedBox()),
                Container(
                    width: 150.w,
                    alignment: Alignment.topRight,
                    child: Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("See here",style: AppStyles.labelValueStyle(color: AppColors.redGradientTwoColor)),
                        SizedBox(width: 11.w,),
                        InkWell(
                            onTap: (){
                              print("ei");
                          //    Get.to( OwnerDetailsScreen());
                            },
                            child: Icon(Icons.arrow_forward_ios,size: 14,color:AppColors.redGradientTwoColor,))

                      ],
                    )),

              ],
            ),

            SizedBox(height: 18.h,),

            Row(
              children: [
                Text("CNIC Front:",
                    style: AppStyles.highlightsTextStyle()),
                Expanded(child: SizedBox()),
                Container(
                    width: 150.w,
                    alignment: Alignment.topRight,
                    child: Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("See here",style: AppStyles.labelValueStyle(color: AppColors.redGradientTwoColor)),
                        SizedBox(width: 11.w,),
                        InkWell(
                            onTap: (){
                              print("ei");
                              //    Get.to( OwnerDetailsScreen());
                            },
                            child: Icon(Icons.arrow_forward_ios,size: 14,color:AppColors.redGradientTwoColor,))

                      ],
                    )),

              ],
            ),
            SizedBox(height: 18.h,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    Get.to(const AddBuyerDetailsForSales());
                    //bootomSheet();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.redGradientOneColor,
                        // border:Border.all(color: AppColors.redGradientOneColor,width: 1.w),
                        borderRadius: BorderRadius.circular(10.sp)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                    child:Text('Sales',style: TextStyle(
                        color: AppColors.whiteColor
                    ),) ,
                  ),
                ),

                InkWell(
                  onTap: (){
                    Get.to(const AddBuyerAndInstallment());
                   // bootomSheet();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff2093FE),
                        // border:Border.all(color: AppColors.redGradientOneColor,width: 1.w),
                        borderRadius: BorderRadius.circular(10.sp)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                    child:Text('Installment',style: TextStyle(
                        color: AppColors.whiteColor
                    ),) ,
                  ),
                ),

                InkWell(
                  onTap: (){
                    bootomSheet();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff37B899),
                        // border:Border.all(color: AppColors.redGradientOneColor,width: 1.w),
                        borderRadius: BorderRadius.circular(10.sp)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                    child:Text('Edit',style: TextStyle(
                        color: AppColors.whiteColor
                    ),) ,
                  ),
                ),

              ],
            ),
            SizedBox(height: 18.h,),
          ],
        ),
      );
    },
  );

}
}

class SalesPropertyDetails extends StatelessWidget {
  String? label;
  String? value;
  SalesPropertyDetails({required this.label,required this.value});

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