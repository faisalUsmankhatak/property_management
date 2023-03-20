import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:property_management/screen/sales_management/sold_property_details.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
class SoldPropertyListing extends StatelessWidget {
  const SoldPropertyListing({Key? key}) : super(key: key);

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
          child: Container(
            width: 16.w,
            height: 14.h,
            child: Image.asset('asset/icon/back.png',color: AppColors.textFieldDefaultColor),
          ),
        ),
        title: Text("Sold Property List",
            style: AppStyles.appBarStyle(color: AppColors.redGradientTwoColor)),
      ),
      body:  SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 23.h,
                ),
                Text(
                  "Here Are all Properties Which\nare On  Sold Property",
                  style: AppStyles.labelValueStyle(color: AppColors.redGradientTwoColor)),

                SizedBox(
                  height: 16.h,
                ),
                horizontalDriver(),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const ListingData();
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return horizontalDriver();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
  Widget horizontalDriver() {
    return Container(
      height: 0.5.h,
      decoration:  const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft, end: Alignment.topRight,
            colors: [Colors.black12, Colors.transparent],
            //stops: [0.0, 0.9],
          )),
      //Colors.black12.withOpacity(0.4),
    );
  }
}
class ListingData extends StatelessWidget {
  const ListingData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 32.sp,
        backgroundColor: AppColors.whiteColor,
        foregroundColor: Colors.white,
        backgroundImage: AssetImage(
          'asset/icon/human.png',
        ),
      ),
      onTap: (){
        Get.to(SoldPropertyDetails());
      },
      title: Text("Buyer Name -03325156429",
          style: AppStyles.titleStyle()),
      subtitle: Text('Property Name- Property owner name',style: AppStyles.subTitleStyle()),
      trailing: Image.asset('asset/icon/forword.png',color: AppColors.textFieldDefaultColor),
    );
  }
}
