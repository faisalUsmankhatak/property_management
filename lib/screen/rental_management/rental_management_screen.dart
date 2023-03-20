import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:property_management/screen/rental_management/reports_listing_screen.dart';
import 'package:property_management/screen/rental_sales_management/property_details_screen.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
import '../../controller/rent_controller.dart';
import '../../controller/rental_sales_controller.dart';
import 'services_listing.dart';

class RentalManagementScreen extends StatelessWidget {
  String propertyType;
   RentalManagementScreen({required  this.propertyType});
   RentController rentalSalesController=Get.put(RentController());
  List list = [
    'Services',
    'Repairing',
    'Reports',
    'Invoices',
    'Comments',
    'currency'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         backgroundColor: AppColors.whiteColor,
         //Color(0xffEDF0F6),
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
         leading:
          InkWell(
            onTap: (){
              Get.back();
            },
            child: Container(
              width: 16.w,
              height: 14.h,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('asset/icon/back.png'))),
            ),
          ),
          title: Text("Rent Management",
              style: AppStyles.appBarStyle()),
          // actions: [
          //   PopupMenuButton(
          //       padding: EdgeInsets.zero,
          //       // constraints: BoxConstraints(maxWidth: 137.sp),
          //     shape: OutlineInputBorder(
          //       gapPadding: 0,
          //         borderSide: BorderSide(color: AppColors.whiteColor),
          //         borderRadius: BorderRadius.circular(10.sp)
          //         ),
          //     offset: Offset(-8.sp,43.sp),
          //       icon: Container(
          //         width: 25.w,
          //         height: 25.h,
          //         decoration: const BoxDecoration(
          //             image: DecorationImage(
          //                 image: AssetImage("asset/icon/appbarIcon2.png"))),
          //       ),
          //       onSelected: (val){
          //         navigate(val.toString());
          //       },
          //       itemBuilder: (BuildContext context){
          //     return list.map((e){
          //       return PopupMenuItem(
          //         padding: EdgeInsets.zero,
          //         child: Column(
          //         children: [
          //           Text(e),
          //           SizedBox(
          //             height: 12.h,
          //           ),
          //           popupMenuDriver(),
          //         ],
          //       ),
          //         value: e,
          //
          //       );
          //     }).toList();
          //
          //   }),
          //
          //   SizedBox(width: 16.w,)
          // ],
        ),
        body: SingleChildScrollView(
          child: Container(

            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 21.w),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 23.h,
                  ),
                  Text(
                    "Here Are all Properties\nAvailable for $propertyType",
                    style: TextStyle(fontFamily: 'Roboto-Black',color: AppColors.textFieldDefaultColor),
                  ),
                  SizedBox(height: 16.h,),
                  horizontalDriver(),
                  ListView.separated(
physics: NeverScrollableScrollPhysics(),

                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(

                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                     radius: 32.sp,
                        backgroundColor: AppColors.whiteColor,
foregroundColor: Colors.white,
                        backgroundImage:
                        AssetImage('asset/icon/human.png',),
                      ),
                      title: Text("G15 Property -Plot",style: AppStyles.titleStyle()),
                      subtitle: Row(
                        children: [
                          Text("03325156429",style: AppStyles.subTitleStyle()),
                          SizedBox(width: 5.w,),
                          Text(propertyType,overflow:TextOverflow.ellipsis,style: AppStyles.subTitleStyle(),)
                        ],
                      ),
                      onTap: () {
                    Get.to(PropertyDetailsScreen());
                      },
                      trailing: Image.asset('asset/icon/forword.png',color: AppColors.textFieldDefaultColor),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
  return horizontalDriver();
                  },),

                ],
              ),
            ),
          ),

        ),
      ),
    );
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
  Widget popupMenuDriver(){
    return   Container(
      height: 0.2.sp,
      color: Color(0xffD9D9D9),
    );
  }

   void navigate(String value){
if(value=='Services'){
  Get.to( ServicesListing());
}else if(value=='Reports'){
  Get.to(ReporstListingScreen());
}
   }





}
