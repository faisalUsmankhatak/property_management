import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
import '../../controller/rent_add_property_Controller.dart';
import '../../widget/alert_button.dart';
import '../../widget/form_text_field.dart';

class InvoicesDetails extends StatelessWidget {
  InvoicesDetails({Key? key}) : super(key: key);
  List<String> imageBytes1 = [''];
  List<String> selectedItems = [];
  RentAddPropertyController propertyController = Get.find();

  // int isFieldSelected = 0;

  //Rx<List<dynamic>> imageBytes=[].obs;

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

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
        leading: InkWell(
          onTap: () {
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
        title: Text("Invoices( )",
            style: TextStyle(color: Color(0xff7A539C), fontSize: 20.sp)),
        actions: [
          Container(
            width: 25.w,
            height: 25.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/icon/appbarIcon.png"))),
          ),
          SizedBox(
            width: 16.w,
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 51.h,
          ),
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
                        height: 40.h,
                      ),
                      ListingData(
                        label: 'Added by:',
                        value: 'Faisal Usman',
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      ListingData(
                        label: 'Property Name:',
                        value: 'Commercial',
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      ListingData(
                        label: 'Owner Name:',
                        value: 'House',
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      ListingData(
                        label: 'Rent Number:',
                        value: '45453453',
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      ListingData(
                        label: 'Rent Amount:',
                        value: '45453453',
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        children: [
                          Text("Services Charges:",
                              style: AppStyles.highlightsTextStyle()),
                          Expanded(child: SizedBox()),
                          Container(
                              width: 150.w,
                              alignment: Alignment.topRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Faisal Usman"),
                                  SizedBox(
                                    width: 11.w,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        print("ei");
                                        //  Get.to( OwnerDetailsScreen());
                                      },
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 14,
                                        color: Color(0xff757D8A),
                                      ))
                                ],
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      ListingData(
                        label: 'Commission:',
                        value: '453453',
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      ListingData(
                        label: 'Invoice Amount:',
                        value: '453453',
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      ListingData(
                        label: 'Pay:',
                        value: '453453',
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      ListingData(
                        label: 'Arrears:',
                        value: 'Bi-month',
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      ListingData(
                        label: 'Repairing Pay:',
                        value: 'PKR 99,99,00',
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        children: [
                          Text("Invoices Status:",
                              style: AppStyles.highlightsTextStyle()),
                          Expanded(child: SizedBox()),
                          Container(
                              width: 150.w,
                              alignment: Alignment.topRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 20.h,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: AppColors
                                                .purPleGradientTwoColor,
                                            width: 1.sp),
                                    ),
                                    child: Center(child: Icon(Icons.done,size: 8.sp,color: AppColors.purPleGradientTwoColor),),
                                  ),
                                  SizedBox(
                                    width: 2.sp,
                                  ),
                                  Text(
                                    "Paid",
                                    style: AppStyles.labelValueStyle(
                                        color:
                                            AppColors.purPleGradientTwoColor),
                                  )
                                ],
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        children: [
                          Text("Repairing:",
                              style: AppStyles.highlightsTextStyle()),
                          Expanded(child: SizedBox()),
                          Container(
                              width: 150.w,
                              alignment: Alignment.topRight,
                              child: Text("PKR 99,99,00"))
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        children: [
                          Text("Action:",
                              style: AppStyles.highlightsTextStyle()),
                          Expanded(child: SizedBox()),
                          Container(
                              width: 150.w,
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {
                                  viewInvoice();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      color: Colors.green),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 5.h),
                                  child: const Text('View'),
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  Future viewInvoice() {
    return Get.dialog(Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
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
                    height: 550.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffFFFFFF)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: AppFormTextField(
                                  isCompulsory: false,
                                  lablel: 'Tenant Name',
                                  enabled: false,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: AppFormTextField(
                                    isCompulsory: false,
                                    lablel: 'Owner Name',
                                    enabled: false),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: AppFormTextField(
                              isCompulsory: true,
                              labelWidth: 120.sp,
                              lablel: 'Total Invoice Payment',
                              enabled: false),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: AppFormTextField(
                            isCompulsory: false,
                            lablel: 'Total Repair',
                            enabled: false,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: AppFormTextField(
                            isCompulsory: false,
                            lablel: 'Total Arrears',
                            enabled: false,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: multiSelectedDropDownField()),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: AppFormTextField(
                                  isCompulsory: false,
                                  lablel: 'Amount',
                                  enabled: true,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: AppFormTextField(
                                  isCompulsory: true,
                                  enabled: true,
                                  lablel: 'Date',
                                  height: 40,
                                  labelWidth: 81,
                                  suffixIcon: 'asset/icon/calendar.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: AppFormTextField(
                              isCompulsory: false,
                              lablel: 'Description (text box)',
                              enabled: true),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        //GridViewButton(title: 'Add',)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: AlertButton(
                              label: 'Applay',
                              backGroundColor: AppColors.greyColor),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        //GridViewButton(title: 'Add',)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: AlertButton(
                              label: 'Back',
                              backGroundColor: AppColors.greyColor),
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

  Widget multiSelectedDropDownField() {
    return SizedBox(
      height: 40.h,
      child: DropdownButtonFormField2(
        offset: Offset(0.sp, -12.sp),
        dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.sp)),
            border: Border.all(color: AppColors.purPleGradientOneColor)),
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w, right: 5.w),
          //symmetric(vertical: 10.sp,horizontal: 5.sp),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: propertyController.facilitiesLabelColor),
          ),
          disabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: propertyController.facilitiesLabelColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.purPleGradientTwoColor)),
          label: Text(
            'Select Repair Category',
            style: TextStyle(
              fontSize: 10.sp,
            ),
          ),
        ),
        // itemSplashColor: AppColors.purPalGradientOneColor,
        // itemHighlightColor: AppColors.purPalGradientOneColor,

        isExpanded: true,
        selectedItemHighlightColor: AppColors.purPleGradientOneColor,
        icon: Icon(
          true ? Icons.expand_less : Icons.expand_more,
          color: Colors.black45,
        ),

        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,

            //disable default onTap to avoid closing menu when selecting an item
            enabled: false,
            child: StatefulBuilder(
              builder: (context, menuSetState) {
                final _isSelected = selectedItems.contains(item);
                return InkWell(
                  onTap: () {
                    _isSelected
                        ? selectedItems.remove(item)
                        : selectedItems.add(item);
                    //This rebuilds the StatefulWidget to update the button's text
                    // setState(() {});
                    //This rebuilds the dropdownMenu Widget to update the check mark
                    menuSetState(() {});
                  },
                  child: Container(
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        _isSelected
                            ? Icon(Icons.check_box_outlined,
                                color: AppColors.purPleGradientOneColor)
                            : Icon(Icons.check_box_outline_blank,
                                color: AppColors.textFieldDefaultColor),
                        const SizedBox(width: 16),
                        Text(
                          item,
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
        //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
        value: selectedItems.isEmpty ? null : selectedItems.last,

        onChanged: (value) {
          print('ok');
        },

        buttonHeight: 20.sp,
        iconSize: 20.sp,
        //  buttonWidth: 140,
        itemHeight: 40,
        dropdownWidth: 310.w,

        itemPadding: EdgeInsets.zero,
        selectedItemBuilder: (context) {
          return items.map(
            (item) {
              return Container(
                alignment: AlignmentDirectional.topStart,
                //  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  selectedItems.join(', '),
                  style: const TextStyle(
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              );
            },
          ).toList();
        },
      ),
    );
  }
}

class ListingData extends StatelessWidget {
  String? label;
  String? value;

  ListingData({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label!, style: AppStyles.highlightsTextStyle()),
        Expanded(child: SizedBox()),
        Container(
            width: 150.w,
            alignment: Alignment.topRight,
            child: Text(
              value!,
              style: AppStyles.labelValueStyle(),
            ))
      ],
    );
  }
}
