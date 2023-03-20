import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:property_management/test.dart';
import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
import '../../controller/installment_controller.dart';
import '../../widget/bottomBorderTextField.dart';
import '../../widget/drop_down_field.dart';
import '../../widget/form_text_field.dart';

class OnInstallmentDetails extends StatefulWidget {
  const OnInstallmentDetails({Key? key}) : super(key: key);

  @override
  State<OnInstallmentDetails> createState() => _OnInstallmentDetailsState();
}

class _OnInstallmentDetailsState extends State<OnInstallmentDetails> {
  OnInstallmentController onInstallmentController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
            borderSide: BorderSide(color: AppColors.backgroundColorTextColor)),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: 16.w,
            height: 14.h,
            decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('asset/icon/back.png'))),
          ),
        ),
        title: Text("On Installment Details",
            style: AppStyles.appBarStyle(color: AppColors.redGradientTwoColor)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(
                height: 28.h,
              ),
              Container(
                //  height:  ((tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Sole Trade')|| ( (tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Limited company')))?  290.h:(tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='UnRegistered')?230.h:37.5.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    border: Border.all(
                        color: onInstallmentController.isHiddenCompanyDetails
                            ? AppColors.redGradientOneColor
                            : AppColors.whiteColor,
                        width: 1.sp)),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // tenantController.isClickedCompanyDetails=true;
                        setState(() {
                          onInstallmentController.isHiddenCompanyDetails =
                              !onInstallmentController.isHiddenCompanyDetails;
                        });
                      },
                      child: filterHidding('Company Details',
                          onInstallmentController.isHiddenCompanyDetails),
                    ),
                    onInstallmentController.isHiddenCompanyDetails
                        ? Container(
                            width: double.infinity,

                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            // height:((tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Sole Trade')|| ( (tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Limited company')))?  245.h:(tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='UnRegistered')?180.h:37.5.h,
                            child: Column(children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              ListingData(
                                label: 'Added by:',
                                value: 'Faisal Usman',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Property Category:',
                                value: 'Commercial',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Property Type:',
                                value: 'House',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'No Of Bedrooms:',
                                value: '2',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'No Of Kitchens:',
                                value: '4',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'No Of Washroom:',
                                value: '2',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'No Of Shops:',
                                value: '4',
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              ListingData(
                                label: 'No Of Flats/Apartments:',
                                value: '1',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Property Address:',
                                value: 'House 2,Street 4',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Area',
                                value: '23.5',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Square Feet',
                                value: '23.5',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Square Yard',
                                value: '23.5',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Kanal',
                                value: '23.5',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Marla',
                                value: '23.5',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Status',
                                value: '23.5',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Row(
                                children: [
                                  Text("Status",
                                      style: AppStyles.highlightsTextStyle()),
                                  Expanded(child: SizedBox()),
                                  Container(
                                      width: 150.w,
                                      alignment: Alignment.topRight,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 15.h,
                                            height: 15,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: AppColors
                                                        .redGradientTwoColor,
                                                    width: 1.sp)),
                                            child: Center(
                                              child: Icon(Icons.done,
                                                  color: AppColors
                                                      .redGradientTwoColor,
                                                  size: 10.sp),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.sp,
                                          ),
                                          Text(
                                            'On Installment',
                                            style: AppStyles.labelValueStyle(
                                                color: AppColors
                                                    .redGradientTwoColor),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                            ]),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Container(
                //  height:  ((tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Sole Trade')|| ( (tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Limited company')))?  290.h:(tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='UnRegistered')?230.h:37.5.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    border: Border.all(
                        color: onInstallmentController.isHiddenOwnerDetails
                            ? AppColors.redGradientOneColor
                            : AppColors.whiteColor,
                        width: 1.sp)),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // tenantController.isClickedCompanyDetails=true;
                        setState(() {
                          onInstallmentController.isHiddenOwnerDetails =
                              !onInstallmentController.isHiddenOwnerDetails;
                        });
                      },
                      child: filterHidding('Owner Details',
                          onInstallmentController.isHiddenOwnerDetails),
                    ),
                    onInstallmentController.isHiddenOwnerDetails
                        ? Container(
                            width: double.infinity,

                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            // height:((tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Sole Trade')|| ( (tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Limited company')))?  245.h:(tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='UnRegistered')?180.h:37.5.h,
                            child: Column(children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              ListingData(
                                label: 'Owner Name:',
                                value: 'Faisal Usman',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Number:',
                                value: '0332343535',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Email:',
                                value: 'faisalusmankktk495@gmail.com',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Date of Birth:',
                                value: '23/1/2001',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'National ID No:',
                                value: '34234324234',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Passport No:',
                                value: '34234324234',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Present Address:',
                                value: 'House 2,Street 4',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Permanent Address:',
                                value: 'House 2,Street 4',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Row(
                                children: [
                                  Text('NIC Photo',
                                      style: AppStyles.highlightsTextStyle()),
                                  Expanded(child: const SizedBox()),
                                  Container(
                                      width: 150.w,
                                      alignment: Alignment.topRight,
                                      padding: EdgeInsets.zero,
                                      child: InkWell(
                                          onTap: () {},
                                          child: Text(
                                            'see here',
                                            style: AppStyles.TextButtonStyle(
                                                color: AppColors
                                                    .redGradientTwoColor),
                                          ))),
                                  SizedBox(
                                    width: 2.sp,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        print("ei");
                                        // Get.to( OwnerDetailsScreen());
                                      },
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 14,
                                        color: AppColors.textFieldDefaultColor,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Row(
                                children: [
                                  Text('Passport Photo',
                                      style: AppStyles.highlightsTextStyle()),
                                  Expanded(child: SizedBox()),
                                  Container(
                                      width: 150.w,
                                      padding: EdgeInsets.zero,
                                      alignment: Alignment.topRight,
                                      child: InkWell(
                                          onTap: () {},
                                          child: Text(
                                            'see here',
                                            style: AppStyles.TextButtonStyle(
                                                color: AppColors
                                                    .redGradientTwoColor),
                                          ))),
                                  SizedBox(
                                    width: 2.sp,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        print("ei");
                                        // Get.to( OwnerDetailsScreen());
                                      },
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 14,
                                        color: AppColors.textFieldDefaultColor,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                            ]),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Container(
                //  height:  ((tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Sole Trade')|| ( (tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Limited company')))?  290.h:(tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='UnRegistered')?230.h:37.5.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    border: Border.all(
                        color: onInstallmentController.isHiddenBuyerDetails
                            ? AppColors.redGradientOneColor
                            : AppColors.whiteColor,
                        width: 1.sp)),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // tenantController.isClickedCompanyDetails=true;
                        setState(() {
                          onInstallmentController.isHiddenBuyerDetails =
                              !onInstallmentController.isHiddenBuyerDetails;
                        });
                      },
                      child: filterHidding('Buyer Details',
                          onInstallmentController.isHiddenBuyerDetails),
                    ),
                    onInstallmentController.isHiddenBuyerDetails
                        ? Container(
                            width: double.infinity,

                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            // height:((tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Sole Trade')|| ( (tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Limited company')))?  245.h:(tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='UnRegistered')?180.h:37.5.h,
                            child: Column(children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              ListingData(
                                label: 'Buyer Name:',
                                value: 'Faisal Usman',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Number:',
                                value: '033245345',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Email:',
                                value: 'faisalusmankktk495@gmail.com',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Date Of Birth:',
                                value: '12/2/2003',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'National ID No:',
                                value: '23432423',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Passport No:',
                                value: '23432423',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Present Address:',
                                value: 'House 2,Street 3',
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              ListingData(
                                label: 'Permanent Address:',
                                value: 'House 2,Street 3',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Row(
                                children: [
                                  Text('NIC Photo',
                                      style: AppStyles.highlightsTextStyle()),
                                  Expanded(child: const SizedBox()),
                                  Container(
                                      width: 150.w,
                                      alignment: Alignment.topRight,
                                      padding: EdgeInsets.zero,
                                      child: InkWell(
                                          onTap: () {},
                                          child: Text(
                                            'see here',
                                            style: AppStyles.TextButtonStyle(
                                                color: AppColors
                                                    .redGradientTwoColor),
                                          ))),
                                  SizedBox(width: 2.sp,),
                                  InkWell(
                                      onTap: (){
                                        print("ei");
                                        // Get.to( OwnerDetailsScreen());
                                      },
                                      child: Icon(Icons.arrow_forward_ios,size: 14,color:AppColors.textFieldDefaultColor,))
                                ],
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Row(
                                children: [
                                  Text('Passport Photo',
                                      style: AppStyles.highlightsTextStyle()),
                                  Expanded(child: SizedBox()),
                                  Container(
                                      width: 150.w,
                                      padding: EdgeInsets.zero,
                                      alignment: Alignment.topRight,
                                      child: InkWell(
                                          onTap: () {},
                                          child: Text(
                                            'see here',
                                            style: AppStyles.TextButtonStyle(
                                                color: AppColors
                                                    .redGradientTwoColor),
                                          ))),
                                  SizedBox(width: 2.sp,),
                                  InkWell(
                                      onTap: (){
                                        print("ei");
                                        // Get.to( OwnerDetailsScreen());
                                      },
                                      child: Icon(Icons.arrow_forward_ios,size: 14,color:AppColors.textFieldDefaultColor,))
                                ],
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                            ]),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Container(
                //  height:  ((tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Sole Trade')|| ( (tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Limited company')))?  290.h:(tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='UnRegistered')?230.h:37.5.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    border: Border.all(
                        color:
                            onInstallmentController.isHiddenInstallmentDetails
                                ? AppColors.redGradientOneColor
                                : AppColors.whiteColor,
                        width: 1.sp)),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // tenantController.isClickedCompanyDetails=true;
                        setState(() {
                          onInstallmentController.isHiddenInstallmentDetails =
                              !onInstallmentController
                                  .isHiddenInstallmentDetails;
                        });
                      },
                      child: filterHidding('Installment Plan',
                          onInstallmentController.isHiddenInstallmentDetails),
                    ),
                    onInstallmentController.isHiddenInstallmentDetails
                        ? Container(
                            width: double.infinity,

                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            // height:((tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Sole Trade')|| ( (tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Limited company')))?  245.h:(tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='UnRegistered')?180.h:37.5.h,
                            child: Column(children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              ListingData(
                                label: 'Property Sale Price:',
                                value: '3432423',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Down Payment:',
                                value: '432423',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Handover Amount:',
                                value: '54645654',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Payment Balloting:',
                                value: '20 May,1991',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Amount paid installment:',
                                value: '8000',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Row(
                                children: [
                                  Text('Installment Plan',
                                      style: AppStyles.highlightsTextStyle()),
                                  Expanded(child: const SizedBox()),
                                  Container(
                                      width: 150.w,
                                      alignment: Alignment.topRight,
                                      padding: EdgeInsets.zero,
                                      child: InkWell(
                                          onTap: () {},
                                          child: Text(
                                            '5 year',
                                            style: AppStyles.TextButtonStyle(
                                                color: AppColors
                                                    .redGradientTwoColor),
                                          ))),
                                  SizedBox(
                                    width: 2.sp,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        print("ei");
                                        // Get.to( OwnerDetailsScreen());
                                      },
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 14,
                                        color: AppColors.textFieldDefaultColor,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'No Of Installment:',
                                value: '12',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Installment Start Date:',
                                value: '12/1/2004',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Amount for Installment:',
                                value: '345234523',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Adjustment Price',
                                value: '345234523',
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListingData(
                                label: 'Belance',
                                value: '3452323',
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                            ]),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget filterHidding(
    String title,
    bool isIconChange,
  ) {
    return Container(
      width: 312.w,
      padding: EdgeInsets.only(left: 5.w, top: 7.h, bottom: 7.h),
      decoration: BoxDecoration(
          color: AppColors.purPleGradientOneColor,
          borderRadius: BorderRadius.circular(3.sp),
          gradient: LinearGradient(colors: [
            AppColors.redGradientOneColor,
            AppColors.redGradientTwoColor
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: Text(
              title,
              style: AppStyles.filterLabelStyle(),
            ),
          ),
          const Text(
            "*",
            style: TextStyle(color: Colors.red),
          ),
          Expanded(child: SizedBox()),
          Icon(isIconChange ? Icons.expand_more : Icons.expand_less,
              color: AppColors.whiteColor),
          SizedBox(
            width: 7.w,
          )
        ],
      ),
    );
  }

  void getImage(int? index) async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // file=File(result.files.single.path!);
      Uint8List imageBytes = await image.readAsBytes();
      onInstallmentController.imageBase64 = base64Encode(imageBytes);
      setState(() {
        if (index == 0) {
          // tenantController.personImageController.text = image.name;

        } else if (index == 1) {
          //  ownerController.personAgreementController.text=image.name;
        } else if (index == 2) {
          // ownerController.regCertificateController.text=image.name;
        } else if (index == 3) {
          //  ownerController.companyLogoController.text=image.name;
        } else if (index == 4) {
          //  ownerController.agreementController.text=image.name;
        } else if (index == 5) {
          //  ownerController.regCertificateController.text=image.name;
        }
      });
    }
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
            width: 140.w,
            alignment: Alignment.topRight,
            child: Text(
              value!,
              style: AppStyles.labelValueStyle(),
            ))
      ],
    );
  }
}
