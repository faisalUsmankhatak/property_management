import 'dart:convert';
import 'dart:typed_data';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
import '../../controller/owner_controller.dart';
import '../../widget/bottomBorderTextField.dart';
import '../../widget/drop_down_field.dart';
import '../../widget/form_button.dart';
import '../../widget/form_text_field.dart';

class AddOwnerScreen extends StatefulWidget {
  const AddOwnerScreen({Key? key}) : super(key: key);

  @override
  State<AddOwnerScreen> createState() => _AddOwnerScreenState();
}

class _AddOwnerScreenState extends State<AddOwnerScreen> {
  OwnerController ownerController = Get.find();
  final CNICFormatter = MaskTextInputFormatter(
    mask: '#####-#######-#',
  );

  test() {
    if (ownerController.firstNameController.text.length > 3) {}
    ;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ownerController.firstNameController.addListener(test);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          FormButton(buttonText: 'Add Owner', width: 310.w, radius: 100.sp,bodyColor: AppColors.greyColor, borderColor: AppColors.greyColor),
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
        title: Text("Add Owner",
            style: TextStyle(color: Color(0xff7A539C), fontSize: 20.sp)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(
                height: 28.h,
              ),

              Row(
                children: [
                  Flexible(
                      child: GestureDetector(
                          onPanDown: (details) {

                            setState(() {
ownerController.isChangeOwnerTypeIcon=true;
                            });
                          },
                          child: DropDownField(
                            label: 'Owner Type',
                            isChangeIcon: ownerController.isChangeOwnerTypeIcon,
                            labelWidth: 79,
                            menu: ownerController.ownerType,
                            onChange: (value) {
                              ownerController.ownerTypeController
                                  .text = value.toString();

                              setState(() {
                                ownerController.isChangeOwnerTypeIcon=false;

                              });
                            },
                          ),),),

                  SizedBox(
                      width:
                          ownerController.ownerTypeController.text == 'Company'
                              ? 15.w
                              : 0.w),
                  ownerController.ownerTypeController.text == 'Company'
                      ? Flexible(
                          child: GestureDetector(
                              onPanDown: (details) {

                                setState(() {
                                  ownerController.isChangeCompanyTypeIcon=true;
                                });
                              },
                              child:DropDownField(
                                label: 'Company Type',
                               isChangeIcon:ownerController. isChangeCompanyTypeIcon,
                                labelWidth: 105,
                                menu: ownerController.companyType,
                                onChange: (value) {
                                  ownerController.companyTypeController
                                      .text = value.toString();

                                  setState(() {
                                    ownerController.isChangeCompanyTypeIcon=false;
                                  });
                                },
                              )
                              // dropDown("Company Type",
                              //     ownerController.companyType, 1, 10, 80),
                          ),
                        )
                      : SizedBox()
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              ownerController.ownerTypeController.text == 'Person'
                  ? Column(
                      children: [
                        Container(
                          width: double.infinity,
                          // height:ownerController.isHiddenPersonDetails? 350.h:37.5.h,

                          // ownerController.isHiddenContactPersonDetails? 280.h:37.5.h,
                          // (ownerController.isHiddenCompanyDetails && ownerController.companyTypeSelectedValue=='Sole Trade')?  370.h:(ownerController.isHiddenCompanyDetails && ownerController.companyTypeSelectedValue=='UnRegistered')?270.h.h:37.5.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.sp),
                              border: Border.all(
                                  color: ownerController.isHiddenPersonDetails
                                      ? AppColors.purPleGradientOneColor
                                      : AppColors.whiteColor,
                                  width: 1.sp)),
                          child: Column(children: [
                            InkWell(
                              onTap: () {
                                ownerController.isClickedPersonDetails = true;
                                setState(() {
                                  ownerController.isHiddenPersonDetails =
                                      !ownerController.isHiddenPersonDetails;
                                });
                              },
                              child: filterHidding('Person Details',
                                  ownerController.isHiddenPersonDetails),
                            ),
                            ownerController.isHiddenPersonDetails
                                ? Container(
                                    width: double.infinity,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    //   height: ownerController.isHiddenPersonDetails? 310.h:37.5.h,
                                    child: Column(children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                              child: AppFormTextField(
                                                isCompulsory: true,

                                                enabled: true,
                                                textController: ownerController
                                                    .firstNameController,
                                                lablel: 'First Name',
                                                labelWidth: 75,

                                                height: 40,
                                              )),
                                          // Text(ownerController
                                          //     .companyFirstNameController.text),
                                          SizedBox(
                                            width: 18.w,
                                          ),
                                          Flexible(
                                              child: AppFormTextField(
                                                isCompulsory: true,
                                                enabled: true,

                                                height: 40,
                                                textController: ownerController
                                                    .lastNameController,
                                                lablel: 'Last Name',

                                                labelWidth: 75,
                                              ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 18.h,
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                              child: AppFormTextField(
                                                isCompulsory: true,
                                                enabled: true,
                                                lablel: 'Phone Number',
                                                height: 40,
                                                typeKeyboard:
                                                    TextInputType.number,
                                                textController: ownerController
                                                    .phoneNumberController,

                                                labelWidth: 96,
                                              )),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Flexible(
                                              child: AppFormTextField(
                                                height: 40,
                                                isCompulsory: true,
                                                enabled: true,

                                                lablel: 'Date Of Birth',
                                                labelWidth: 96,
                                                textController: ownerController
                                                    .dateOfBirthController,
                                                suffixIcon:
                                                    'asset/icon/calendar.png',
                                                suffixIconTab: () async {
                                                  DateTime now = DateTime.now();
                                                  var newDate =
                                                      await showDatePicker(
                                                          context: context,
                                                          initialDate: now,
                                                          firstDate:
                                                              DateTime(1900),
                                                          lastDate:
                                                              DateTime(2023));
                                                  DateFormat.yMd()
                                                      .format(newDate!);
                                                  setState(() {
                                                    print(newDate);
                                                    ownerController
                                                        .dateOfBirthController
                                                        .text = DateFormat
                                                            .yMd()
                                                        .format(newDate);
                                                  });
                                                },
                                              ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 18.h,
                                      ),
                                      AppFormTextField(
                                        isCompulsory: true,
                                        enabled: true,

                                        lablel: 'Email',
                                        textController: ownerController
                                            .emailController,
                                        labelWidth: 43,
                                        height: 40,
                                      ),
                                      SizedBox(
                                        height: 18.h,
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                              child: AppFormTextField(
                                                  isCompulsory: true,
                                                  enabled: true,

                                                  textController: ownerController
                                                      .nicNumberController,
                                                  lablel: 'Nic Number',
                                                  typeKeyboard:
                                                      TextInputType.number,
                                                  labelWidth: 82,
                                                  maskFormatter: CNICFormatter,
                                                  maxLine: 15,
                                                  height: 40,
                                                  onChanged: (value) {})),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Flexible(
                                              child: AppFormTextField(
                                                isCompulsory: false,
                                                enabled: true,

                                                lablel: 'Passport Number',
                                                height: 40,
                                                maxLine: 10,
                                                labelWidth: 100,
                                                textController: ownerController
                                                    .passportNumberController,
                                                onChanged: (value) {},
                                              ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 18.h,
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Focus(
                                              onFocusChange: (hasFocus) {
                                                setState(() => ownerController
                                                        .imageLabelColor =
                                                    hasFocus
                                                        ? AppColors.purPleGradientOneColor
                                                        : AppColors
                                                            .textFieldDefaultColor);
                                              },
                                              child: AppFormTextField(
                                                isCompulsory: true,
                                                enabled: true,
                                                labelColor: ownerController
                                                    .imageLabelColor,
                                                textController: ownerController
                                                    .imageController,
                                                lablel: "Image",
                                                height: 40,
                                                labelWidth: 47,
                                                suffixIcon:
                                                    "asset/icon/file.jpg",
                                                suffixIconTab: () {
                                                  getImage(0);
                                                },
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Flexible(
                                            child: AppFormTextField(
                                              isCompulsory: true,
                                              enabled: true,

                                              textController: ownerController
                                                  .agreementController,
                                              lablel: "Agreement",
                                              height: 40,
                                              labelWidth: 75,
                                              suffixIcon:
                                                  "asset/icon/file.jpg",
                                              suffixIconTab: () {
                                                getImage(1);
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 18.h,
                                      )
                                    ]),
                                  )
                                : SizedBox()
                          ]),
                        ),
                      ],
                    )
                  : ownerController.ownerTypeController.text == 'Company'
                      ? Container(
                          // height:  ((ownerController.isHiddenCompanyDetails && ownerController.dropDownSelectedValue[1]=='Sole Trade'|| (ownerController.isHiddenCompanyDetails && ownerController.dropDownSelectedValue[1]=='Limited company')))?  350.h:(ownerController.isHiddenCompanyDetails && ownerController.dropDownSelectedValue[1]=='UnRegistered')?290.h:37.5.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.sp),
                              border: Border.all(
                                  color: ownerController.isClickedCompanyDetails
                                      ? AppColors.purPleGradientOneColor
                                      : Colors.transparent,
                                  width: 1.sp)),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  ownerController.isClickedCompanyDetails =
                                      true;
                                  setState(() {
                                    ownerController.isHiddenCompanyDetails =
                                        !ownerController.isHiddenCompanyDetails;
                                  });
                                },
                                child: filterHidding('Company Details',
                                    ownerController.isHiddenCompanyDetails),
                              ),
                              ownerController.isHiddenCompanyDetails
                                  ? Container(
                                      width: double.infinity,

                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      // height:((ownerController.isHiddenCompanyDetails && ownerController.dropDownSelectedValue[1]=='Sole Trade')|| (ownerController.isHiddenCompanyDetails && ownerController.dropDownSelectedValue[1]=='Limited company'))?  295.h:(ownerController.isHiddenCompanyDetails && ownerController.dropDownSelectedValue[1]=='UnRegistered')?240.h:37.5.h,
                                      child: Column(children: [
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        AppFormTextField(
                                          isCompulsory: true,
                                          enabled: true,

                                          textController: ownerController
                                              .companyNameController,
                                          lablel: "Company Name",
                                          height: 40,
                                          labelWidth: 95,
                                        ),
                                        SizedBox(
                                          height: 18.h,
                                        ),
                                        (ownerController.companyTypeController.text ==
                                                    'Sole Trade' ||
                                                ownerController
                                                            .companyTypeController.text==
                                                    'Limited company')
                                            ? Row(
                                                children: [
                                                  Flexible(
                                                      child: AppFormTextField(
                                                        isCompulsory: true,
                                                        enabled: true,
                                                        textController:
                                                            ownerController
                                                                .registrationNoController,

                                                        lablel: 'Registration No',
                                                        labelWidth: 94,
                                                        height: 40,
                                                      )),
                                                  SizedBox(
                                                    width: 18.w,
                                                  ),
                                                  Flexible(
                                                      child: AppFormTextField(
                                                          isCompulsory: true,
                                                          enabled: true,
                                                          height: 40,
                                                          textController:
                                                              ownerController
                                                                  .regCertificateController,

                                                          lablel:
                                                              'Reg Certificate',
                                                          suffixIcon:
                                                              'asset/icon/file.jpg',
                                                          suffixIconTab: () {
                                                            getImage(5);
                                                          },
                                                          labelWidth: 91))
                                                ],
                                              )
                                            : SizedBox(),
                                        (ownerController.companyTypeController.text==
                                                    'Sole Trade' ||
                                                ownerController
                                                            .companyTypeController.text==
                                                    'Limited company')
                                            ? SizedBox(
                                                height: 18.h,
                                              )
                                            : SizedBox(),
                                        Row(
                                          children: [
                                            Flexible(
                                                child: AppFormTextField(
                                                  isCompulsory: false,
                                                  enabled: true,
                                                  height: 40,
                                                  typeKeyboard:
                                                      TextInputType.number,
                                                  textController: ownerController
                                                      .landLineController,

                                                  lablel: 'LandLine(PTCL)',
                                                  labelWidth: 88,
                                                )),
                                            SizedBox(
                                              width: 18.w,
                                            ),
                                            Flexible(
                                                child: AppFormTextField(
                                                    isCompulsory: true,
                                                    enabled: true,
                                                    height: 40,
                                                    typeKeyboard:
                                                        TextInputType.number,
                                                    textController:
                                                        ownerController
                                                            .mobileNoController,

                                                    lablel: 'Mobile No#',
                                                    labelWidth: 74))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 18.w,
                                        ),
                                        AppFormTextField(
                                            isCompulsory: true,
                                            enabled: true,
                                            height: 40,
                                            textController: ownerController
                                                .companyEmailController,

                                            lablel: 'Company Email',
                                            labelWidth: 95),
                                        SizedBox(
                                          height: 18.h,
                                        ),
                                        Row(
                                          children: [
                                            Flexible(
                                              child: AppFormTextField(
                                                isCompulsory: true,
                                                enabled: true,

                                                textController: ownerController
                                                    .companyLogoController,
                                                lablel: "Company Logo",
                                                height: 40,
                                                labelWidth: 90,
                                                suffixIcon:
                                                    "asset/icon/file.jpg",
                                                suffixIconTab: () {
                                                  getImage(3);
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              width: 18.w,
                                            ),
                                            Flexible(
                                              child: AppFormTextField(
                                                isCompulsory: true,
                                                enabled: true,

                                                textController:
                                                    ownerController
                                                        .agreementController,
                                                lablel: "Agreement",
                                                height: 40,
                                                labelWidth: 71,
                                                suffixIcon:
                                                    "asset/icon/file.jpg",
                                                suffixIconTab: () {
                                                  getImage(4);
                                                },
                                              ),
                                            )
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
                        )
                      : SizedBox(),
              SizedBox(
                height: 15.h,
              ),
              ownerController.ownerTypeController.text == 'Company'
                  ? Container(
                      width: double.infinity,
                      // height:ownerController.isHiddenContactPersonDetails? 290.h:37.5.h,

                      // ownerController.isHiddenContactPersonDetails? 280.h:37.5.h,
                      // (ownerController.isHiddenCompanyDetails && ownerController.companyTypeSelectedValue=='Sole Trade')?  370.h:(ownerController.isHiddenCompanyDetails && ownerController.companyTypeSelectedValue=='UnRegistered')?270.h.h:37.5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.sp),
                          border: Border.all(
                              color:
                                  ownerController.isHiddenContactPersonDetails
                                      ? AppColors.purPleGradientOneColor
                                      : Colors.transparent,
                              width: 1.sp)),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                ownerController.isHiddenContactPersonDetails =
                                    !ownerController
                                        .isHiddenContactPersonDetails;
                              });
                            },
                            child: filterHidding('Contact Person Details',
                                ownerController.isHiddenContactPersonDetails),
                          ),
                          ownerController.isHiddenContactPersonDetails
                              ? Container(
                                  width: double.infinity,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  //  height: ownerController.isHiddenContactPersonDetails? 240.h:37.5.h,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                              child: AppFormTextField(
                                                isCompulsory: true,
                                                enabled: true,
                                                textController: ownerController
                                                    .firstNameController,
                                                lablel: 'First Name',
                                                labelWidth: 72,

                                                height: 40,
                                              )),
                                          SizedBox(
                                            width: 18.w,
                                          ),
                                          Flexible(
                                              child: AppFormTextField(
                                                isCompulsory: true,
                                                enabled: true,
                                                height: 40,
                                                textController: ownerController
                                                    .lastNameController,
                                                lablel: 'Last Name',
                                                labelWidth: 71,

                                              ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 18.h,
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                              child: AppFormTextField(
                                                isCompulsory: true,
                                                enabled: true,
                                                height: 40,
                                                lablel: 'Phone Number',
                                                typeKeyboard:
                                                    TextInputType.number,
                                                textController: ownerController
                                                    .phoneNumberController,
                                                labelWidth: 95,

                                              )),
                                          SizedBox(
                                            width: 18.w,
                                          ),
                                          Flexible(
                                              child: AppFormTextField(
                                                isCompulsory: true,
                                                enabled: true,
                                                lablel: 'Date Of Birth',
                                                height: 40,
                                                textController: ownerController
                                                    .dateOfBirthController,
                                                labelWidth: 81,

                                                suffixIcon:
                                                    'asset/icon/calendar.png',
                                                suffixIconTab: () async {
                                                  DateTime now = DateTime.now();
                                                  DateTime? newDate =
                                                      await showDatePicker(
                                                          context: context,
                                                          initialDate: now,
                                                          firstDate:
                                                              DateTime(1900),
                                                          lastDate:
                                                              DateTime(2023));
                                                  DateFormat.yMd()
                                                      .format(newDate!);
                                                  setState(() {
                                                    ownerController
                                                            .dateOfBirthController
                                                            .text =
                                                        DateFormat.yMd()
                                                            .format(newDate);
                                                  });
                                                  print(newDate);
                                                },
                                              ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 18.h,
                                      ),
                                      AppFormTextField(
                                        isCompulsory: true,
                                        enabled: true,
                                        lablel: 'Email',
                                        height: 40,
                                        textController: ownerController
                                            .emailController,
                                        labelWidth:48,

                                      ),
                                      SizedBox(
                                        height: 18.h,
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                              child: AppFormTextField(
                                                  isCompulsory: true,
                                                  enabled: true,
                                                  height: 40,

                                                  textController: ownerController
                                                      .nicNumberController,
                                                  lablel: 'Nic Number',
                                                  typeKeyboard:
                                                      TextInputType.number,
                                                  labelWidth: 78,
                                                  maskFormatter: CNICFormatter,
                                                  maxLine: 15,
                                                  onChanged: (value) {})),
                                          SizedBox(
                                            width: 18.w,
                                          ),
                                          Flexible(
                                            child: AppFormTextField(
                                              isCompulsory: false,
                                              enabled: true,
                                              lablel: 'Passport Number',
                                              maxLine: 10,
                                              labelWidth: 103,

                                              height: 40,
                                              textController: ownerController
                                                  .passportNumberController,
                                              onChanged: (value) {},
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16.h,
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    )
                  : SizedBox(),
              ownerController.ownerTypeController.text == 'Company'
                  ? SizedBox(
                      height: 15.h,
                    )
                  : SizedBox(),
              // ownerController.dropDownSelectedValue[0] == 'Company'?
              (ownerController.ownerTypeController.text == 'Company' ||
                      ownerController.ownerTypeController.text == 'Person')
                  ? Container(
                width: double.infinity,
                      // height: ownerController.isHiddenMailingAddress
                      //     ? 290.h
                      //     : 37.5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.sp),
                          border: Border.all(
                              color: ownerController.isHiddenMailingAddress
                                  ? AppColors.purPleGradientOneColor
                                  : AppColors.whiteColor,
                              width: 1.sp)),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                ownerController.isHiddenMailingAddress =
                                    !ownerController.isHiddenMailingAddress;
                              });
                            },
                            child: filterHidding('Mailing Address',
                                ownerController.isHiddenMailingAddress),
                          ),
                          ownerController.isHiddenMailingAddress
                              ? Container(
                                 width: double.infinity,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                 // height: 238.h,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                 Row(children: [
                                   Flexible(
                                       child: SizedBox(
                                         height: 45.h,
                                         child: BottomBorderTextField(
                                           hintText: "Building Name/Number",

//hintText: "Building Name/Number",
                                           isCompulsory: false,
                                           controller: ownerController
                                               .mailingBuildingNameController,
                                         ),
                                       )),
                                 ],)  ,
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                              child: BottomBorderTextField(
                                            hintText: "Line One",
                                            // hintText: 'Line One',
                                            isCompulsory: false,
                                            controller: ownerController
                                                .mailingLineOneController,
                                          )),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Flexible(
                                              child: BottomBorderTextField(
                                            hintText: "Line Two",
                                            isCompulsory: false,
                                            controller: ownerController
                                                .mailingLineTwoController,
                                          )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      BottomBorderTextField(
                                        hintText: "Area",
                                        isCompulsory: true,
                                        controller: ownerController
                                            .mailingAreaController,
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                 Row(children: [Flexible(
                                     child: BottomBorderTextField(
                                       hintText: "City",
                                       isCompulsory: true,
                                       controller: ownerController
                                           .mailingCityController,
                                     )),],)    ,
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                     Row(children: [ Flexible(
                                         child: BottomBorderTextField(
                                           hintText: "Post Code",
                                           isCompulsory: false,
                                           controller:
                                           ownerController.mailingPostCodeController,
                                         )),],),
                                    SizedBox(height: 18.h,),
                                    ],
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    )
                  : SizedBox(),
              (ownerController.ownerTypeController.text== 'Company' ||
                      ownerController.ownerTypeController.text == 'Person')
                  ? SizedBox(
                      height: 15.h,
                    )
                  : SizedBox(),
              SizedBox(height: 13.h,),
              (ownerController.ownerTypeController.text== 'Company' ||
                      ownerController.ownerTypeController.text == 'Person')
                  ? Row(
                      children: [
                        Text(
                            "If Permanent Address is Same with Mailing Address",
                            style: TextStyle(
                                color: AppColors.purPleGradientOneColor, fontSize: 10.sp)),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: AppColors.redColor),
                        ),
                        Expanded(child: SizedBox()),
                        InkWell(
                          onTap: () {
                            setState(() {
                              ownerController.isPermanentMailingAddressSame=!ownerController.isPermanentMailingAddressSame;
                              if(ownerController.isPermanentMailingAddressSame){
                                  assignPermanentAddressFieldValue();
                              }else{
                                 clearPermanentAddressFieldValue();
                              }
                            });
                          },
                          child: Container(
                            width: 18.w,
                            height: 18.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.blueColor,width: 1.w),
                              borderRadius: BorderRadius.circular(5.sp),
                            ),
                            child: Icon(Icons.done,size: 14.sp,color:ownerController.isPermanentMailingAddressSame? AppColors.blueColor:AppColors.whiteColor),
                          ),
                        )

                      ],
                    )
                  : SizedBox(),
              SizedBox(
                height: 6.h,
              ),
              (ownerController.ownerTypeController.text == 'Company' ||
                      ownerController.ownerTypeController.text == 'Person')
                  ? Container(
                      // height: ownerController.isHiddenPermanentAddress
                      //     ? 290.h
                      //     : 37.5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.sp),
                          border: Border.all(
                              color: ownerController.isHiddenPermanentAddress
                                  ? AppColors.purPleGradientOneColor
                                  : AppColors.whiteColor,
                              width: 1.sp)),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                ownerController.isHiddenPermanentAddress =
                                    !ownerController.isHiddenPermanentAddress;
                              });
                            },
                            child: filterHidding('Permanent Address',
                                ownerController.isHiddenPermanentAddress),
                          ),
                          ownerController.isHiddenPermanentAddress
                              ? Container(
                                  width: double.infinity,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                 // height: 245.h,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      SizedBox(
                                        height: 45.h,
                                        child: BottomBorderTextField(
                                      hintText: "Building Name/Number",

//hintText: "Building Name/Number",
                                      isCompulsory: false,
                                      controller: ownerController
                                          .permanentBuildingNameController,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                              child: BottomBorderTextField(
                                            hintText: "Line One",
                                            // hintText: 'Line One',
                                            isCompulsory: false,
                                            controller: ownerController
                                                .permanentLineOneController,
                                          )),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Flexible(
                                              child: BottomBorderTextField(
                                            hintText: "Line Two",
                                            isCompulsory: false,
                                            controller: ownerController
                                                .permanentLineTwoController,
                                          )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      BottomBorderTextField(
                                        hintText: "Area",
                                        isCompulsory: true,
                                        controller: ownerController
                                            .permanentAreaController,
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      BottomBorderTextField(
                                        hintText: "City",
                                        isCompulsory: true,
                                        controller: ownerController
                                        .permanentCityController,
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      BottomBorderTextField(
                                        hintText: "Post Code",
                                        isCompulsory: false,
                                        controller: ownerController
                                        .permanentPostCodeController,
                                      ),
                                      SizedBox(height: 18.h,)
                                    ],
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    )
                  : SizedBox(),

              (ownerController.ownerTypeController.text == 'Company' ||
                      ownerController.ownerTypeController.text == 'Person')
                  ? SizedBox(
                      height: 90.h,
                    )
                  : SizedBox()
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
      ownerController.imageBase64 = base64Encode(imageBytes);
      setState(() {
        if (index == 0) {
          ownerController.imageController.text = image.name;
        } else if (index == 1) {
          ownerController.agreementController.text = image.name;
        } else if (index == 2) {
          ownerController.regCertificateController.text = image.name;
        } else if (index == 3) {
          ownerController.companyLogoController.text = image.name;
        } else if (index == 4) {
          ownerController.agreementController.text = image.name;
        } else if (index == 5) {
          ownerController.regCertificateController.text = image.name;
        }
      });
    }
  }





  void assignPermanentAddressFieldValue() {
    ownerController.permanentBuildingNameController.text =
        ownerController.mailingBuildingNameController.text;
    ownerController.permanentLineOneController.text =
        ownerController.mailingLineOneController.text;
    ownerController.permanentLineTwoController.text =
        ownerController.mailingLineTwoController.text;
    ownerController.permanentAreaController.text =
        ownerController.mailingAreaController.text;
    ownerController.permanentCityController.text =
        ownerController.mailingCityController.text;
    ownerController.permanentPostCodeController.text =
        ownerController.mailingPostCodeController.text;
    setState(() {});
  }

  void clearPermanentAddressFieldValue() {
    ownerController.permanentBuildingNameController.clear();
    ownerController.permanentLineOneController.clear();
    ownerController.permanentLineTwoController.clear();
    ownerController.permanentAreaController.clear();
    ownerController.permanentCityController.clear();
    ownerController.permanentPostCodeController.clear();
    setState(() {});
  }

  List<DropdownMenuItem<String>> _addDividersAfterItems(List items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: GestureDetector(
              child: Text(
                item,
                style: TextStyle(
                    fontSize: 15.sp, color: AppColors.textFieldDefaultColor),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          // if (item != items.last)
          //    DropdownMenuItem<String>(
          //     enabled: false,
          //     child: myDivider(),
          //
          //   ),
        ],
      );
    }
    return _menuItems;
  }

  Widget myDivider() {
    return Container(
      padding: EdgeInsets.zero,
      height: 0.6,
      color: AppColors.textFieldDefaultColor,
    );
  }
}
