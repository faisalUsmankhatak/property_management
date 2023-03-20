import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/app_colors.dart';
import '../../controller/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
   DashboardScreen({Key? key}) : super(key: key);
  DashboardController dashboardController=Get.find();
  @override
  Widget build(BuildContext context) {
 return    Padding(
   padding: EdgeInsets.symmetric(horizontal: 23.w),
   child: Column(
     children: [
       GridView.builder(
           itemCount: 6,
           shrinkWrap: true,
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             childAspectRatio: 181.w / 127.h,
             crossAxisSpacing: 12.w,
             mainAxisSpacing: 13.w,
           ),
           itemBuilder: (context, index) {
             return gridContainer(index);
           }),
       SizedBox(height: 31.h,),
       Material(
         shadowColor: Colors.grey.withOpacity(0.1),
         elevation: 5.sp,
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
         child: Container(

           height: 127.h,
           decoration: BoxDecoration(
             boxShadow: [
             BoxShadow(
                 color: Colors.grey.withOpacity(0.1),
                 blurRadius: 1,
                 spreadRadius: 1,
                 offset: const Offset(0,5)
             )
             ],
             borderRadius: BorderRadius.circular(10.sp)

           ),
           child: Padding(
             padding:  EdgeInsets.symmetric(horizontal: 10.h),
             child: Column(
               children: [
                 SizedBox(height: 17.h,),
                 Row(
                   children: [Text("New Renters"),
                     const Expanded(child: SizedBox()),
Text("Seee All"),
SizedBox(width: 6.w,),
                     Container(
                       width: 15.w,
                       height: 15.h,
                       decoration: const BoxDecoration(
                         image: DecorationImage(
                           image: AssetImage("asset/icon/forwerd.png")
                         )
                       ),
                     )
                   ],
                 ),
                 SizedBox(height: 10.h,),
                 Container(
                   height: 0.5.h,
                   color: AppColors.greenColor,
                 )
               ],
             ),
           ),
         ),
       ),
     ],
   ),
 );
    // return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,index){
    //
    // });
  }
  Widget gridContainer(int index,) {
    var data=   dashboardController.grideViewDataList[index];

    return Material(
      elevation: 5.sp,
      shadowColor: (index % 2 != 0)? Color(0xffF7F5FF):Colors.white,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),

      child: Container(

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),

            color: (index % 2 != 0)? Color(0xffF7F5FF):Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: const Offset(0,5)
              )
            ]
        ),

        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(data['title'],style: TextStyle(fontSize: 14.sp,color: data['color'])),
              SizedBox(height: 8.h,),
              Container(
                height: 0.3,
                color:data['color'] ,
              ),
              SizedBox(height: 2.h,),
              Text("0"),
              Container(
                height: 0.3,
                color:data['color'] ,
              ),
              SizedBox(height: 12.h,),
            //  GridViewButton(title: data['buttonTitle'],borderColor: data['color']),
            ],
          ),
        ),
      ),
    );
  }
}
