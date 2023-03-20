import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:property_management/test.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
import '../../widget/alert_button.dart';
import '../../widget/alert_dialog.dart';
import '../../widget/form_text_field.dart';
import '../../widget/myFloatingButton.dart';
import 'add_currency.dart';
import 'comments_replay.dart';
class CommentsList extends StatelessWidget {
   CommentsList({Key? key}) : super(key: key);

  @override
  List<String> services=['Repair -100','Cleaning -99','Asd -200','Repair -100'];
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
          child:  Container(
            width: 16.w,
            height: 14.h,
            child: Image.asset('asset/icon/back.png',color: AppColors.purPleGradientTwoColor),
          ),
        ),
        title: Text("Comments List",
            style: AppStyles.appBarStyle()),
      ),
      body: Column(
        children: [
          SizedBox(height:75.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            width: double.infinity,
            child: ListView.separated(
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context,index){
                return ListTile(
                  leading:Stack(

                    clipBehavior:Clip.none ,
                    children: [
                      Text(index.toString()),
                      Positioned(
                        left:8.w,
                        top:-5,
                        child: Container(
                          width: 15.w,
                          height: 15.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.purPleGradientTwoColor
                          ),
                          child: Center(
                            child: Text('2',style: AppStyles.titleStyle()),
                          ),
                        ),
                      )
                    ],
                  ),

                  title: Text(services[index],style: AppStyles.titleStyle()),
                  subtitle: Text('Flat Repairing Services',style: AppStyles.subTitleStyle()),
                  trailing: Column(
                    children: [
                      Text('Pending',style: AppStyles.subTitleStyle()),
                      SizedBox(height: 5.h,),
                      Text('12.05 PM',style: AppStyles.subTitleStyle(),)
                    ],
                  ),
                  onTap: (){
                    Get.to( CommentsRepaly(comments:services[index] ,));
                  },
                );
              }, separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 0.5.h,
                decoration:  const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.black12,
                          Colors.transparent
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight
                    )
                ),
              );
            },),
          )
        ],
      ),
    ));
  }




}
