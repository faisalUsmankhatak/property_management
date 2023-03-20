import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
import '../../controller/rent_controller.dart';
import 'invoices_details.dart';
class InvoicesListing extends StatelessWidget {
   InvoicesListing({Key? key}) : super(key: key);

  @override
  RentController rentController=Get.put(RentController());
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
        title: Text("Invoices",
            style: AppStyles.appBarStyle()),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(
                height: 28.h,
              ),
              Obx(()=> Container(

                //height: rentController.isHiddenPropertiesDetails.value? 400.h:38.h,
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(5.sp),
                    border: Border.all(color:rentController.isHiddenPropertiesDetails.value?AppColors.purPleGradientOneColor:AppColors.whiteColor,width: 1.sp)),
                child: Column(
                  children: [

                    InkWell(
                      onTap:(){
                        // tenantController.isClickedCompanyDetails=true;

                        rentController.isHiddenPropertiesDetails.value =! rentController.isHiddenPropertiesDetails.value;

                      },
                      child:filterHidding('Receivables ',rentController.isHiddenPropertiesDetails.value),

                    ),
                    rentController.isHiddenPropertiesDetails.value   ?      Container(
                      width: double.infinity,
                      // height:((tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Sole Trade')|| ( (tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Limited company')))?  245.h:(tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='UnRegistered')?180.h:37.5.h,
                      child:

                      Padding(
                        padding:  EdgeInsets.only(left: 5.w,right: 10.w),
                        child: ListView.separated(


                          shrinkWrap: true,
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return index>5?Column(
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap:(){

                                },
                                        child:  Text('See All',style: TextStyle(color: AppColors.purPleGradientTwoColor)),)
                                  ],
                                ),
                                SizedBox(height: 18.h,),
                              ],
                            ):ListTile(

                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                radius: 32.sp,
                                backgroundColor: AppColors.whiteColor,
                                foregroundColor: Colors.white,
                                backgroundImage:
                                AssetImage('asset/icon/human.png',),
                              ),
                              title: Text("G15 Property -Plot",style: AppStyles.titleStyle()),
                              subtitle: Text("03325156429",style: AppStyles.subTitleStyle()),
                              onTap: () {
                                Get.to(InvoicesDetails());
                              },
                              trailing: Image.asset('asset/icon/forword.png',color: AppColors.textFieldDefaultColor),

                            );
                          }, separatorBuilder: (BuildContext context, int index) {
                          return index==5?SizedBox(
                            height: 5,
                          ):horizontalDriver();
                        },),
                      ),





                    ):SizedBox(),


                  ],
                ),
              ),


              ),
              SizedBox(height: 18.h,),
              Obx(()=> Container(

               // height:rentController.isHiddenTenantsDetails.value?  400.h:40.h,
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(5.sp),
                    border: Border.all(color:rentController.isHiddenTenantsDetails.value?AppColors.purPleGradientOneColor:AppColors.whiteColor,width: 1.sp)),
                child: Column(
                  children: [

                    InkWell(
                      onTap:(){
                        // tenantController.isClickedCompanyDetails=true;

                        rentController.isHiddenTenantsDetails.value =! rentController.isHiddenTenantsDetails.value;

                      },
                      child:filterHidding('Payouts',rentController.isHiddenTenantsDetails.value),

                    ),
                    rentController.isHiddenTenantsDetails.value   ?      SizedBox(
                      width: double.infinity,
                      // height:((tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Sole Trade')|| ( (tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Limited company')))?  245.h:(tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='UnRegistered')?180.h:37.5.h,
                      child:

                      Padding(
                        padding:  EdgeInsets.only(left: 5.w,right: 10.w),
                        child: ListView.separated(


                          shrinkWrap: true,
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return receivablesListing(index: index,);
                          }, separatorBuilder: (BuildContext context, int index) {
                          return index==5?SizedBox(
                            height: 5,
                          ):horizontalDriver();
                        },),
                      ),





                    ):SizedBox(),


                  ],
                ),
              ),),
              SizedBox(height: 18.h,),

            ],
          ),
        ),
      ),
    ));
  }

  Widget horizontalDriver(){
    return
      Container(

        height: 0.5.h,
        decoration:   BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.topRight,
              colors: [
                Colors.black12,Colors.transparent
              ],
              //stops: [0.0, 0.9],
            )
        ),
        //Colors.black12.withOpacity(0.4),

      );
  }
  Widget filterHidding(String title,bool isIconChange,){
    return      Container(
      width: 312.w,
      padding: EdgeInsets.only(left: 5.w,top: 7.h,bottom: 7.h),
      decoration: BoxDecoration(
          color: AppColors.purPleGradientOneColor,
          borderRadius:
          BorderRadius.circular(3.sp),
          gradient: const LinearGradient(
              colors: [Color(0xff7742E0),
                Color(0xff7A539C)

              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 7.w),
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
          Icon(
              isIconChange
                  ? Icons.expand_more
                  : Icons.expand_less,
              color: AppColors.whiteColor),
          SizedBox(
            width: 7.w,
          )
        ],
      ),);
  }
}


class receivablesListing extends StatelessWidget {
  int index;
   receivablesListing({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return index>5?Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
                onTap:(){

                },
                child:  Text('See All',style: TextStyle(color: AppColors.purPleGradientTwoColor,fontFamily: 'Roboto-Black'),))
          ],
        ),
        SizedBox(height: 18.h,)
      ],
    ):ListTile(

      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 32.sp,
        backgroundColor: AppColors.whiteColor,
        foregroundColor: Colors.white,
        backgroundImage:
        AssetImage('asset/icon/human.png',),
      ),
      title: Text("G15 Property -Plot",style: AppStyles.titleStyle()),
      subtitle: Text("03325156429",style: AppStyles.subTitleStyle()),
      onTap: () {
        Get.to(InvoicesDetails());
      },
      trailing: Image.asset('asset/icon/forword.png',color: AppColors.textFieldDefaultColor),
    );
  }
}
