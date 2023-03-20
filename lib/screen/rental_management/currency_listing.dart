import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
import '../../widget/alert_button.dart';
import '../../widget/alert_dialog.dart';
import '../../widget/form_text_field.dart';
import '../../widget/myFloatingButton.dart';
import 'add_currency.dart';
class CurrencyListing extends StatelessWidget {
   CurrencyListing({Key? key}) : super(key: key);

  @override
  List<String> currency=['PKR','\$(Dolor)',];
  List<String> country=['Pakistan','United State'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      floatingActionButton: MyFloationButton(label: '',
          onPressFloating: (){
            Get.to(AddCurrency(status: 'New',));
          }),
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
        title: Text("All Currency List",
            style: AppStyles.appBarStyle()),
      ),
      body: Column(
        children: [
          SizedBox(height:75.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            width: double.infinity,
            child: ListView.separated(
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (context,index){
                return ListTile(
                  leading: Text((index+1).toString(),style: AppStyles.titleStyle()),
                  title: Text(currency[index],style: AppStyles.titleStyle()),
                  subtitle: Text(country[index],style: AppStyles.subTitleStyle()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      InkWell(
                          onTap:(){
                         Get.to(AddCurrency(status: 'Edit',));





                          },
                          child: Icon(Icons.edit,color: AppColors.textFieldDefaultColor,)),
                      SizedBox(width: 5.w,),
                      InkWell(
                          onTap: (){
                            GetMyDialoge();
                          },
                          child: Icon(Icons.delete,color: AppColors.textFieldDefaultColor,))

                    ],
                  ),
                  onTap: (){
                  },
                );
              }, separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 0.5.h,
                decoration:  BoxDecoration(
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
  Future addServices(){

    return Get.dialog(Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          children: [
            GestureDetector(
              onTap:() {
                Get.back();
              },
              child: Container(
                color: Colors.transparent,
                width: Get.width,
                height: Get.height,

              ),
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    height: 383.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: Color(0xffFFFFFF)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10.sp,),
                        Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10.w),
                            child: filterHidding('Add New Services')

                        ),
                        SizedBox(height: 15.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal:15.w ),
                          child: AppFormTextField(isCompulsory: false,lablel: 'Services Type',enabled: true,),
                        ),
                        SizedBox(height: 15.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal:15.w ),
                          child: AppFormTextField(isCompulsory: false,lablel: 'Services Charges',enabled: true,),
                        ),
                        SizedBox(height: 15.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal:15.w ),
                          child: AppFormTextField(isCompulsory: false,lablel: 'Description',enabled: true,),
                        ),
                        SizedBox(height: 15.h,),
                        //GridViewButton(title: 'Add',)
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 15.w),
                          child: AlertButton(label: 'Add',backGroundColor: AppColors.purPleGradientOneColor),
                        ),
                        SizedBox(height: 15.h,),
                        //GridViewButton(title: 'Add',)
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 15.w),
                          child: AlertButton(label: 'Back',backGroundColor: AppColors.whiteColor),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));

  }

  Future editServices(){

    return Get.dialog(Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          children: [
            GestureDetector(
              onTap:() {
                Get.back();
              },
              child: Container(
                color: Colors.transparent,
                width: Get.width,
                height: Get.height,

              ),
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    height: 383.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: Color(0xffFFFFFF)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10.sp,),
                        Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10.w),
                            child: filterHidding('Edit')

                        ),
                        SizedBox(height: 15.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal:15.w ),
                          child: AppFormTextField(isCompulsory: false,lablel: 'Services Type',enabled: true,),
                        ),
                        SizedBox(height: 15.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal:15.w ),
                          child: AppFormTextField(isCompulsory: false,lablel: 'Services Charges',enabled: true,),
                        ),
                        SizedBox(height: 15.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal:15.w ),
                          child: AppFormTextField(isCompulsory: false,lablel: 'Description',enabled: true,),
                        ),
                        SizedBox(height: 15.h,),
                        //GridViewButton(title: 'Add',)
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 15.w),
                          child: AlertButton(label: 'Update',backGroundColor: AppColors.purPleGradientOneColor),
                        ),
                        SizedBox(height: 15.h,),
                        //GridViewButton(title: 'Add',)
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 15.w),
                          child: AlertButton(label: 'Back',backGroundColor: AppColors.whiteColor),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));

  }
  Widget filterHidding(String title,) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 5.w, top: 15.h, bottom: 15.h),
      decoration: BoxDecoration(
          color: AppColors.purPleGradientOneColor,
          borderRadius: BorderRadius.circular(3.sp),
          gradient: LinearGradient(
              colors: [Color(0xff7742E0),
                Color(0xff7A539C)

              ],
              begin: Alignment.bottomCenter,
              end:Alignment.topCenter
          )),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: Text(
              title,
              style: AppStyles.stackContainerLabelStyle(),
            ),
          ),


        ],
      ),
    );
  }
}
