import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
import '../../controller/rental_sales_controller.dart';
import '../../widget/form_text_field.dart';

class OwnerDetailsScreen extends StatelessWidget {
   OwnerDetailsScreen({Key? key}) : super(key: key);
  RentalSalesController rentalSalesController=Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffEDF0F6),
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
        leading:InkWell(
          onTap: (){
            Get.back();
          },
          child: Container(
            width: 16.w,
            height: 14.h,
            child: Image.asset('asset/icon/back.png',color: AppColors.textFieldDefaultColor),
          ),
        ),

        title: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("G15 Property Details",
                style: AppStyles.appBarStyle()),
            Text("(Owner Details)",style: AppStyles.highlightsTextStyle(),)
          ],
        ),

      ),
      body: Column(
        children: [
          SizedBox(height: 10.h,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 50.sp,
                    foregroundImage: const AssetImage('asset/icon/human.png'),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                   Text("Faisal Usman",style: AppStyles.labelValueStyle(),)
                ],
              ),

            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Obx(()=>
             Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.sp),
                    topRight: Radius.circular(20.sp),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 31.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        OwnerDetails(label: 'Added by:',value: 'Faisal Usman',),

                        SizedBox(
                          height: 17.h,
                        ),
                        OwnerDetails(label: 'Owner Type:',value: 'Person',),

                        SizedBox(
                          height: 17.h,
                        ),
                        OwnerDetails(label: 'Number',value: '03325156429',),
                        // Row(
                        //   children: [
                        //     Text("Number",
                        //         style: AppStyles.highlightsTextStyle()),
                        //     Expanded(child: SizedBox()),
                        //     Container(
                        //         width: 150.w,
                        //         alignment: Alignment.topRight,
                        //         child: Text("03325156429"))
                        //   ],
                        // ),
                        SizedBox(
                          height: 17.h,
                        ),
                        OwnerDetails(label: 'Email',value: 'faisalusmankktk495@gmail.com',),

                        SizedBox(
                          height: 17.h,
                        ),
                        OwnerDetails(label: 'Date of Birth',value: '25-3-1993',),

                        SizedBox(
                          height: 17.h,
                        ),
                        Row(
                          children: [
                            Text('NIC Photo',
                                style:AppStyles.highlightsTextStyle()),
                            Expanded(child: const SizedBox()),
                            Container(
                                width: 150.w,

                                alignment: Alignment.topRight,
                                padding: EdgeInsets.zero,
                                child: InkWell(
                                    onTap: (){

                                    },
                                    child: Text('see here',style: AppStyles.TextButtonStyle(),)))
                          ],
                        ),
                        SizedBox(
                          height: 17.h,
                        ),
                        Row(
                          children: [
                            Text('Passport Photo',
                                style:AppStyles.highlightsTextStyle()),
                            Expanded(child: SizedBox()),
                            Container(
                                width: 150.w,

                                padding: EdgeInsets.zero,
                                alignment: Alignment.topRight,
                                child: InkWell(
                                    onTap: (){

                                    },
                                    child: Text('see here',style: AppStyles.TextButtonStyle(),)))
                          ],
                        ),
                        SizedBox(
                          height: 17.h,
                        ),
                        rentalSalesController.isExpansionTileExpanded.value? SizedBox() :       Row(
                          children: [
                            Text("Full Details",
                                style: AppStyles.highlightsTextStyle()),
                            Expanded(child: SizedBox()),
                            Container(
                                width: 97.w,

                                child:Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("More",style: AppStyles.labelValueStyle(),),
                                    InkWell(
                                      onTap: (){
                                        rentalSalesController.isExpansionTileExpanded.value=!rentalSalesController.isExpansionTileExpanded.value;
                                      },
                                      child: Icon( Icons.keyboard_arrow_down
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                        rentalSalesController.isExpansionTileExpanded.value?      SizedBox(
                          height: 17.h,
                        ):SizedBox(),
                        rentalSalesController.isExpansionTileExpanded.value?
                        OwnerDetails(label: 'National ID No',value: '101918-5681289-5',)


                            :SizedBox(),
                        rentalSalesController.isExpansionTileExpanded.value?      SizedBox(
                          height: 17.h,
                        ):SizedBox(),
                        rentalSalesController.isExpansionTileExpanded.value?
                        OwnerDetails(label: 'Passport Number',value: '12454534534',)


                            :SizedBox(),
                        rentalSalesController.isExpansionTileExpanded.value?      SizedBox(
                          height: 17.h,
                        ):SizedBox(),
                        rentalSalesController.isExpansionTileExpanded.value?
                        OwnerDetails(label: 'Present Address',value: 'House No : 12, Street 2, F-6/3 Islamabad, Pakistan',)


                            :SizedBox(),
                        rentalSalesController.isExpansionTileExpanded.value?      SizedBox(
                          height: 17.h,
                        ):SizedBox(),
                        rentalSalesController.isExpansionTileExpanded.value?
                        OwnerDetails(label: 'Permanent Address',value: 'House No : 12, Street 2, Margala Road, F-6/3 Islamabad, Pakistan',)


                            :SizedBox(),

                        rentalSalesController.isExpansionTileExpanded.value?      SizedBox(
                          height: 17.h,
                        ):SizedBox(),

                        rentalSalesController.isExpansionTileExpanded.value?          Row(
                          children: [
                            Text("Action:",
                                style: AppStyles.highlightsTextStyle()),
                            Expanded(child: SizedBox()),
                            Card(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 3.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.sp),
                                    color: AppColors.greenColor),
                                child: Text("Edit",
                                    style:
                                        TextStyle(color: AppColors.whiteColor)),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Card(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 3.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.sp),
                                    color: AppColors.whiteColor),
                                child: Text("Delete",
                                    style: TextStyle(color: AppColors.redColor)),
                              ),
                            )
                          ],
                        ):SizedBox(),
                        SizedBox(
                          height: 24.h,
                        ),
                        InkWell(
                          onTap: (){

                            rentalSalesController.isViewOwnerProperty.value=! rentalSalesController.isViewOwnerProperty.value;
                            rentalSalesController.isExpansionTileExpanded.value=!rentalSalesController.isExpansionTileExpanded.value;
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 5.h),
                            decoration: BoxDecoration(
                           gradient: const LinearGradient(
                             colors: [
                               Color(0xff7A539C),
                               Color(0xff7742E0),
                             ],
                             begin: Alignment.topCenter,
                             end: Alignment.bottomCenter
                           ),
                              borderRadius: BorderRadius.circular(5.sp)
                            ),
                            child: Text("View Owner Properties",
                                style: AppStyles.filterLabelStyle()),
                          ),
                        ),
                        SizedBox(
                          height: 34.h,
                        ),
                            Obx(()=>
                           ListView.separated(

physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:  rentalSalesController.isViewOwnerProperty.value?  5:0,
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
                                title: Text("G15 Property -Plot",style: AppStyles.boldTextStyle()),
                                subtitle: Text("03325156429"),
                                onTap: () {
                                //  Get.to(PropertyDetailsScreen());
                                },
                                trailing: Image.asset('asset/icon/forword.png'),
                              );
                            }, separatorBuilder: (BuildContext context, int index) {
                            return horizontalDriver();
                          },),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
   Widget horizontalDriver(){
     return
       Container(

         height: 0.5.h,
         decoration:   const BoxDecoration(
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

class OwnerDetails extends StatelessWidget {
  String? label;
  String? value;
  OwnerDetails({required this.label,required this.value});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(label!,
            style:AppStyles.highlightsTextStyle()),
        const Expanded(child: SizedBox()),
        Container(
            width: 150.w,

            alignment: Alignment.topRight,
            child: Text(value!,style: AppStyles.labelValueStyle(),overflow:TextOverflow.ellipsis,maxLines: 4,))
      ],
    );
  }
}