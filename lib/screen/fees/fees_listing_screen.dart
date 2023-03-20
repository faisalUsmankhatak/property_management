import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/app_colors.dart';
class FeesScreen extends StatelessWidget {
   FeesScreen({Key? key}) : super(key: key);
  final ScrollController controller = ScrollController();
  final ScrollController controller2 = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
      Column(
        children: [

          SizedBox(
            height: 24.h,
          ),
          Scrollbar(
            controller: controller2,
            child: SingleChildScrollView(
              controller: controller2,
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      tableHead(),
                      SizedBox(
                        height: 5.h,
                      ),
                      //myTableRow(1),
                      SizedBox(
                        height: Get.height * 0.8,
                        width: 615.w,
                        child: ListView.separated(
                          shrinkWrap: true,
                          //physics: const NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return myTableRow(
                                index
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Container(
                              height: 0.4,
                              color: Colors.black.withOpacity(0.3),
                            );
                          },
                        ),
                      )
                    ],
                  )),
            ),
          )
        ],
      ),


    );
  }





  Widget tableHead() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
      child: Material(
        elevation: 5.sp,
        child: Container(
          height: 40.h,
          decoration:  BoxDecoration(
            color: AppColors.greenColor,
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 2.w),
                child: SizedBox(
                  width: 43.w,
                  child: Text(
                    "Sr.No",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp),
                  ),
                ),
              ),
              headerDivider(Colors.white24),
              SizedBox(
                width: 120.w,
                child: Text("Name",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
              headerDivider(Colors.white24),
              SizedBox(
                width: 120.w,
                child: Text("Email",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
              headerDivider(Colors.white24),
              SizedBox(
                width: 120.w,
                child: Text("Mobile",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
              headerDivider(Colors.white24),
              SizedBox(
                width: 120.w,
                child: Text("Details",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              ),
              headerDivider(Colors.white24),

            ],
          ),
        ),
      ),
    );
  }
  Widget myTableRow(int count,) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, top: 0.h, right: 10.w),
      child: Material(
        elevation: 5.sp,

        child: Container(
          height: 45.h,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.whiteColor, width: 1.w)),
          child: Row(
            children: [
              Container(
                width: 43.w,
                padding: EdgeInsets.only(left: 3.sp),
                child: Text(
                  count.toString(),
                  // style: AppStyles.listingStyle(),
                ),
              ),

              rowDivider(AppColors.greenColor),
              SizedBox(
                width: 120.w,
                child: Text("Faisal",
                  //style: AppStyles.listingStyle(),
                ),
              ),
              rowDivider(AppColors.greenColor),
              SizedBox(
                width: 120.w,
                child: Text(
                  " contractor.email!",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    // color: AppColors.appColorGreen,
                  ),
                ),
              ),
              rowDivider(AppColors.greenColor),
              Container(
                width: 120.w,
                padding: EdgeInsets.only(top: 3.h),
                child: Text(
                  "mobile!,",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    // color: AppColors.appColorGreen,
                  ),
                ),
              ),
              rowDivider(AppColors.greenColor),
              Container(
                width: 120.w,
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Text(
                  " phone!",
                  // style: TextStyle(color: AppColors.blueColor),
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
  Widget headerDivider(Color mycolor) {
    return VerticalDivider(
      color:mycolor,
      thickness: 1.5,
    );
  }
  Widget rowDivider(Color mycolor) {
    return VerticalDivider(
      color:mycolor,
      thickness: 0.8,
    );
  }
}
