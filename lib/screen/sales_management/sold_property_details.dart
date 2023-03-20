import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
import '../../controller/installment_controller.dart';
import '../../controller/sold_property_controller.dart';
import '../../widget/form_text_field.dart';
class SoldPropertyDetails extends StatelessWidget {
   SoldPropertyDetails({Key? key}) : super(key: key);

  @override
  SoldPropertyController soldPropertyController=Get.put(SoldPropertyController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
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
            borderSide: const BorderSide(color: Color(0xffEDF0F6))),
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child:  Container(
            width: 16.w,
            height: 14.h,
            child: Image.asset('asset/icon/back.png',color: AppColors.textFieldDefaultColor),
          ),
        ),
        title: Text("Sold Property Details",
            style: AppStyles.appBarStyle(color: AppColors.redGradientTwoColor)),
      ),
      body: SingleChildScrollView(
        child: Obx(()=>
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(
                  height: 28.h,
                ),

                Container(

                  //  height:  ((tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Sole Trade')|| ( (tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Limited company')))?  290.h:(tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='UnRegistered')?230.h:37.5.h,
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(5.sp),
                      border: Border.all(color:soldPropertyController.isHiddenPropertyDetails.value?AppColors.redGradientOneColor:AppColors.whiteColor,width: 1.sp)),
                  child: Column(
                    children: [
                      InkWell(
                        onTap:(){
                          // tenantController.isClickedCompanyDetails=true;

                            soldPropertyController.isHiddenPropertyDetails.value =! soldPropertyController.isHiddenPropertyDetails.value;

                        },
                        child:filterHidding('Company Details',soldPropertyController.isHiddenPropertyDetails.value),

                      ),
                      if (soldPropertyController.isHiddenPropertyDetails.value) Container(
                        width: double.infinity,


                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        // height:((tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Sole Trade')|| ( (tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Limited company')))?  245.h:(tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='UnRegistered')?180.h:37.5.h,
                        child: Column(
                            children: [

                              SizedBox(
                                height: 20.h,
                              ),
                              ListingData(label: 'Added by:', value: 'Faisal Usman'),

                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: 'Property Catagory:', value: 'Commercial'),


                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: 'Property Type:', value: 'House'),


                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: 'No Of Bedrooms:', value: '4'),


                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: 'No Of Kitchens:', value: '1'),


                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: 'No Of Washroom:', value: '6'),


                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: 'No Of Shops:', value: '2'),


                              SizedBox(
                                height: 50.h,
                              ),
                              ListingData(label: 'No Of Flats/Apartments:', value: '6'),


                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: 'Property Address:', value: 'House 3,Street 4,'),


                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: 'Area:', value: 'PKR 99,99,00'),


                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: 'Square Feet:', value: 'PKR 99,99,00'),


                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: 'Square Yard:', value: 'PKR 99,99,00'),

                              SizedBox(
                                height: 24.h,
                              ),

                              ListingData(label: 'Kanal:', value: 'PKR 99,99,00'),

                              SizedBox(
                                height: 24.h,
                              ),

                              ListingData(label: 'Marla:', value: 'PKR 99,99,00'),

                              SizedBox(
                                height: 24.h,
                              ),

                              ListingData(label: 'Status:', value: 'PKR 99,99,00'),

                              SizedBox(
                                height: 24.h,
                              ),
                              // Row(
                              //   children: [
                              //     Text("Status",
                              //         style:AppStyles.highlightsTextStyle()),
                              //     Expanded(child: SizedBox()),
                              //     Container(
                              //         width: 150.w,
                              //         alignment: Alignment.topRight,
                              //         child: Text("PKR 99,99,00"))
                              //   ],
                              // ),
                              SizedBox(height: 18.h,),
                            ]
                        ),
                      ) else SizedBox(),


                    ],
                  ),
                ),
                SizedBox(height: 18.h,),
                Container(

                  //  height:  ((tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Sole Trade')|| ( (tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Limited company')))?  290.h:(tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='UnRegistered')?230.h:37.5.h,
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(5.sp),
                      border: Border.all(color:soldPropertyController.isHiddenOwnerDetails.value?AppColors.redGradientOneColor:AppColors.whiteColor,width: 1.sp)),
                  child: Column(
                    children: [
                      InkWell(
                        onTap:(){
                          // tenantController.isClickedCompanyDetails=true;

                            soldPropertyController.isHiddenOwnerDetails.value =! soldPropertyController.isHiddenOwnerDetails.value;

                        },
                        child:filterHidding('Owner Details',soldPropertyController.isHiddenOwnerDetails.value),

                      ),
                      soldPropertyController.isHiddenOwnerDetails.value  ?      Container(
                        width: double.infinity,


                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        // height:((tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Sole Trade')|| ( (tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Limited company')))?  245.h:(tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='UnRegistered')?180.h:37.5.h,
                        child: Column(
                            children: [

                              SizedBox(
                                height: 20.h,
                              ),
                              ListingData(label: 'Owner Name:', value: 'Faisal Usman'),

                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: 'Number:', value: 'Commercial'),


                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: 'Email:', value: 'House'),


                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: 'Date of Birth:', value: '12/1/2001'),


                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: 'National ID No:', value: 'G15 Markaz'),


                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: 'Passport No:', value: '43423423423'),


                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: 'Present Address:', value: 'House 3,Street 2'),


                              SizedBox(
                                height: 50.h,
                              ),
                              ListingData(label: 'Permanent Address:', value: 'House 3,Street 2'),


                              SizedBox(
                                height: 24.h,
                              ),
                              Row(
                                children: [
                                  Text("CNIC Front:",
                                      style: AppStyles.highlightsTextStyle()),
                                  Expanded(child: SizedBox()),
                                  Container(
                                    width: 150.w,
                                    alignment: Alignment.topRight,
                                    child: InkWell(
                                        onTap: (){},
                                        child:  Text("See here",style: TextStyle( fontSize: 15.sp,
                                          color: AppColors.greenColor,

                                          fontFamily: 'Roboto-Black',),)),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Row(
                                children: [
                                  Text("CNIC Back:",
                                      style: AppStyles.highlightsTextStyle()),
                                  Expanded(child: SizedBox()),
                                  Container(
                                    width: 150.w,
                                    alignment: Alignment.topRight,
                                    child: InkWell(
                                        onTap: (){},
                                        child:  Text("See here",style: TextStyle( fontSize: 15.sp,
                                          color: AppColors.greenColor,

                                          fontFamily: 'Roboto-Black',),)),
                                  )
                                ],
                              ),

                              SizedBox(height: 18.h,),
                            ]
                        ),
                      ):SizedBox(),


                    ],
                  ),
                ),
                SizedBox(height: 18.h,),
                Container(

                  //  height:  ((tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Sole Trade')|| ( (tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Limited company')))?  290.h:(tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='UnRegistered')?230.h:37.5.h,
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(5.sp),
                      border: Border.all(color:soldPropertyController.isHiddenBuyerDetails.value?AppColors.redGradientOneColor:AppColors.whiteColor,width: 1.sp)),
                  child: Column(
                    children: [
                      InkWell(
                        onTap:(){
                          // tenantController.isClickedCompanyDetails=true;

                            soldPropertyController.isHiddenBuyerDetails.value =! soldPropertyController.isHiddenBuyerDetails.value;

                        },
                        child:filterHidding('Buyer Details',soldPropertyController.isHiddenBuyerDetails.value),

                      ),
                      soldPropertyController.isHiddenBuyerDetails.value  ?      Container(
                        width: double.infinity,


                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        // height:((tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Sole Trade')|| ( (tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Limited company')))?  245.h:(tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='UnRegistered')?180.h:37.5.h,
                        child: Column(
                            children: [

                              SizedBox(
                                height: 20.h,
                              ),
                              ListingData(label: 'Buyer Name:', value: 'Faisal Usman'),

                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: 'Number:', value: '03325432432'),


                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: 'Email:', value: 'faisalusmankktk495@gmail.com'),


                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: 'Date Of Birth:', value: '12/2/2001'),


                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: '"National ID No:', value: '4123423423'),


                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: '"Passport No:', value: '4123423423'),


                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: 'Present Address:', value: 'House 2, Street 3'),


                              SizedBox(
                                height: 50.h,
                              ),
                              ListingData(label: 'Permanent Address:', value: 'House 2, Street 3'),


                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(label: 'Permanent Address:', value: 'House 2, Street 3'),
                              SizedBox(
                                height: 24.h,
                              ),
                              Row(
                                children: [
                                  Text("CNIC Front:",
                                      style: AppStyles.highlightsTextStyle()),
                                  Expanded(child: SizedBox()),
                                  Container(
                                    width: 150.w,
                                    alignment: Alignment.topRight,
                                    child: InkWell(
                                        onTap: (){},
                                        child: Text("See here",style: TextStyle(
                                          fontSize: 15.sp,
                                          color: AppColors.greenColor,

                                          fontFamily: 'Roboto-Black',

                                        ),)),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Row(
                                children: [
                                  Text("CNIC Back",
                                      style: AppStyles.highlightsTextStyle()),
                                  Expanded(child: SizedBox()),
                                  Container(
                                      width: 150.w,
                                      alignment: Alignment.topRight,
                                      child: InkWell(
                                          onTap: (){},
                                          child: Text("See here",style: TextStyle(
                                            fontSize: 15.sp,
                                            color: AppColors.greenColor,

                                            fontFamily: 'Roboto-Black',

                                          ),)))
                                ],
                              ),

                              SizedBox(height: 18.h,),
                            ]
                        ),
                      ):SizedBox(),


                    ],
                  ),
                ),
                SizedBox(height: 18.h,),
                AppFormTextField(lablel: 'Property Sales Price', isCompulsory: true, enabled: true,labelWidth: 117),
                SizedBox(height: 18.h,),

              ],
            ),
          ),
        ),
      ),
    ));
  }
  Widget filterHidding(
      String title,
      bool isIconChange,
      ) {
    return Container(
      width: 312.w,
      padding: EdgeInsets.only(left: 5.w, top: 7.h, bottom: 7.h),
      decoration: BoxDecoration(
          color: AppColors.purPleGradientOneColor,
          borderRadius: BorderRadius.circular(3.sp),
          gradient:  LinearGradient(
              colors: [AppColors.redGradientOneColor, AppColors.redGradientTwoColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: Text(
              title,
              style: AppStyles.filterLabelStyle(),
            ),
          ),
          const Text(
            "*",
            style: TextStyle(color: Colors.red),
          ),
          Expanded(child: SizedBox()),
          Icon(isIconChange ? Icons.expand_more : Icons.expand_less,
              color: AppColors.whiteColor),
          SizedBox(
            width: 7.w,
          )
        ],
      ),
    );
  }

}

class ListingData extends StatelessWidget {
  String? label;
  String? value;
  ListingData({required this.label,required this.value});

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