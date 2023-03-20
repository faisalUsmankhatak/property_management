import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:property_management/screen/rental_management/rental_management_screen.dart';
import 'package:property_management/screen/rental_management/report_detail_screen.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
class SeeAllPropertyReports extends StatelessWidget {
  const SeeAllPropertyReports({Key? key}) : super(key: key);

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
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('asset/icon/back.png'))),
          ),
        ),
        title: Text("Reports (Properties)",
            style: TextStyle(color: Color(0xff7A539C), fontSize: 20.sp)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 18.h,),
            Container(
              height: 170.h,
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.sp),
                      topLeft: Radius.circular(30.sp))),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25.sp,
                        backgroundImage:
                        AssetImage('asset/icon/human.png'),
                      ),
                      title: Text("G15 Property -Plot",style: AppStyles.boldTextStyle()),
                      subtitle: Text("03325156429"),
                      onTap: () {
                        Get.to(ReportDetailsScreen());
                      },
                      trailing: Icon(Icons.arrow_forward),
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                return horizontalDriver();
              },),
            )
          ],
        ),
      ),
    ));
  }
  Widget horizontalDriver(){
    return
      Container(

        height: 0.6.h,
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
}
