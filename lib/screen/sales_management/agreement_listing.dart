import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
import '../../controller/agreement_controller.dart';
import '../../widget/myFloatingButton.dart';
import 'add_agreement.dart';
import 'agreement_details.dart';
class AgreementListing extends StatelessWidget {
  AgreementListing({Key? key}) : super(key: key);
  AgreementController agreementController = Get.put(AgreementController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        //Color(0xffEDF0F6),
        floatingActionButton: MyFloationButton(label: 'fgfr',onPressFloating: (){
          Get.to(AddAgreement(status: 'New',));
        }),
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColorTextColor,
          elevation: 4.sp,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(
                  20.sp,
                ),
                bottomLeft: Radius.circular(20.sp),
              ),
              borderSide: BorderSide(color: AppColors.backgroundColorTextColor,)),
          leading:
          InkWell(
            onTap: () {
              Get.back();
            },
            child: SizedBox(
              width: 16.w,
              height: 14.h,
              child: Image.asset('asset/icon/back.png',color: AppColors.textFieldDefaultColor),
            ),
          ),
          title: Text("Agreement List",
              style: AppStyles.appBarStyle(color: AppColors.redGradientTwoColor)),

        ),
        body: SingleChildScrollView(
          child: Container(

            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.w),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 23.h,
                  ),
                  Text(
                    "Here Are all Properties\nAvailable Which are Agreement List",
                    style: AppStyles.labelValueStyle(color: AppColors.redGradientTwoColor),
                  ),
                  SizedBox(height: 16.h,),
                  horizontalDriver(),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),

                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return AgreementList();
                    },
                    separatorBuilder: (BuildContext context, int index) {
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

  Widget horizontalDriver() {
    return
      Container(

        height: 0.5.h,
        decoration:  BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft, end: Alignment.topRight,
              colors: [
                Colors.black12, Colors.transparent
              ],
              //stops: [0.0, 0.9],
            )
        ),
        //Colors.black12.withOpacity(0.4),

      );
  }

  Widget popupMenuDriver() {
    return Container(
      height: 0.2.sp,
      color: Color(0xffD9D9D9),
    );
  }
}

class AgreementList extends StatelessWidget {
  const AgreementList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(

      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 32.sp,
        backgroundColor: AppColors.whiteColor,
        foregroundColor: Colors.white,
        backgroundImage:
        AssetImage('asset/icon/human.png',),
      ),
      title: Text("Property Name", style: AppStyles
          .titleStyle()),
      subtitle: Row(
        children: [
          Text("Agent Name - commission",style: AppStyles.subTitleStyle()),

        ],
      ),
      onTap: () {
        Get.to(AgreementDetails());
      },
      trailing: Image.asset('asset/icon/forword.png'),
    );
  }
}

//   void navigate(String value){
//     if(value=='Services'){
//       Get.to( ServicesListing());
//     }else if(value=='Reports'){
//       Get.to(ReporstListingScreen());
//     }
// }
