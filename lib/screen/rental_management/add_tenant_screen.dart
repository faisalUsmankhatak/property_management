import 'dart:convert';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../app_confiq/app_colors.dart';
import '../../app_confiq/app_style.dart';
import '../../controller/tenant_controller.dart';
import '../../widget/bottomBorderTextField.dart';
import '../../widget/drop_down_field.dart';
import '../../widget/form_button.dart';
import '../../widget/form_text_field.dart';
class AddTenantScreen extends StatefulWidget {
  const AddTenantScreen({Key? key}) : super(key: key);

  @override
  State<AddTenantScreen> createState() => _AddTenantScreenState();
}

class _AddTenantScreenState extends State<AddTenantScreen> {
  TenantController tenantController =Get.put(TenantController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton:
          FormButton(buttonText: 'Add Tenant', width: 310.w, radius: 100.sp,borderColor: AppColors.greyColor,bodyColor: AppColors.greyColor),
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
            title: Text("Add Tenant",
                style: AppStyles.appBarStyle()),
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
                              onPanDown: (details){

                                setState(() {

                                });
                              },
                              child:DropDownField(
                                label: 'Company Type',
                               isChangeIcon: tenantController.isChangeCompanyTypeDropDownIcon,
                                labelWidth: 95,

                                menu: tenantController.companyType,
                                onChange: (value) {

                                  tenantController.companyTypeController
                                      .text = value.toString();
                                  setState(() {});
                                },
                              )
                              // dropDown("Company Type",tenantController.tenantType,0, 0,79,true),
                          )

                      ),
                      SizedBox(
                          width:  tenantController.companyTypeController.text == 'Company'
                              ? 15.w
                              : 0.w),
                      tenantController.companyTypeController.text == 'Company'
                          ? Flexible(
                        child:GestureDetector(
                            onPanDown: (details){

                              setState(() {
                                // tenantController.isChangeDropDownIcon[1] =
                                // false;
                              });
                            },
                            child:DropDownField(
                              label: 'Tenant Type',
                              isChangeIcon: tenantController.isChangeTenantTypeDropDownIcon,
                              labelWidth: 85,
                              menu: tenantController.tenantType,
                              onChange: (value) {

                                tenantController.tenantTypeController
                                    .text = value.toString();
                                setState(() {});
                              },
                            )
                            // dropDown("Tenant Type",tenantController.companyType,1, 1,100,false),
                        ),

                      )
                          : SizedBox()
                    ],
                  ),
                  SizedBox(height: 18.h,),
                  tenantController.companyTypeController.text== 'Company'?
                  Container(

                 //  height:  ((tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Sole Trade')|| ( (tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Limited company')))?  290.h:(tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='UnRegistered')?230.h:37.5.h,
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(5.sp),
                        border: Border.all(color:tenantController.isHiddenCompanyDetails?AppColors.purPleGradientOneColor:AppColors.whiteColor,width: 1.sp)),
                    child: Column(
                      children: [
                        InkWell(
                          onTap:(){
                           // tenantController.isClickedCompanyDetails=true;
                            setState(() {
                              tenantController
                                  .isHiddenCompanyDetails =! tenantController
                                  .isHiddenCompanyDetails;
                            });
                          },
                          child:filterHidding('Company Details',tenantController.isHiddenCompanyDetails),

                        ),
                        tenantController.isHiddenCompanyDetails  ?      Container(
                          width: double.infinity,


                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                         // height:((tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Sole Trade')|| ( (tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='Limited company')))?  245.h:(tenantController.isHiddenCompanyDetails && tenantController.dropDownSelectedValue[1]=='UnRegistered')?180.h:37.5.h,
                          child: Column(
                              children: [

                                SizedBox(
                                  height: 20.h,
                                ),
                                AppFormTextField(
                                  isCompulsory: true,
                                  enabled: true,

                                  textController: tenantController.companyNameController,
                                  lablel: "Company Name",
                                  height: 40,
                                  labelWidth: 105,
                                ),

                                SizedBox(
                                  height: 18.h,
                                ),
                                (tenantController.tenantTypeController.text=='Sole Trade' || tenantController.tenantTypeController.text=='Limited company')?     Row(
                                  children: [
                                    Flexible(
                                        child: AppFormTextField(
                                          isCompulsory: true,
                                          enabled: true,
                                          textController: tenantController.registrationNoController,

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
                                           textController: tenantController.regCertificateController,

                                            lablel: 'Reg Certificate',
                                            suffixIcon: 'asset/icon/file.jpg',
                                            suffixIconTab:() {
                                              getImage(5);
                                            },
                                            labelWidth: 91))
                                  ],
                                ):
                                SizedBox(),
                                (tenantController.tenantTypeController.text=='Sole Trade' || tenantController.tenantTypeController.text=='Limited company')?      SizedBox(height: 18.h,):SizedBox(),
                                Row(
                                  children: [
                                    Flexible(
                                        child: AppFormTextField(
                                          isCompulsory: false,
                                          enabled: true,
                                          height: 40,
                                          typeKeyboard: TextInputType.number,
                                         textController: tenantController.landLineController,

                                          lablel: 'LandLine(PTCL)',
                                          labelWidth: 97,
                                        )),
                                    SizedBox(
                                      width: 18.w,
                                    ),
                                    Flexible(
                                        child: AppFormTextField(
                                            isCompulsory: true,
                                            enabled: true,
                                            height: 40,
                                            typeKeyboard: TextInputType.number,
                                            textController: tenantController.mobileNoController,

                                            lablel: 'Mobile No#',
                                            labelWidth: 80))
                                  ],
                                ),
                                SizedBox(
                                  height: 18.w,
                                ),
                                AppFormTextField(
                                    isCompulsory: true,
                                    enabled: true,
                                    height: 40,
                                    textController: tenantController.companyEmailController,

                                    lablel: 'Company Email',
                                    labelWidth: 100),

SizedBox(height: 18.h,),
                              ]
                          ),
                        ):SizedBox(),


                      ],
                    ),
                  ):SizedBox(),
                  tenantController.companyTypeController.text == 'Company'?   SizedBox(height: 18.h,):SizedBox(),
                  tenantController.companyTypeController.text == 'Company'?
                  Container(
                    width: double.infinity,
                    //height:tenantController.isHiddenContactPersonDetails? 290.h:36.5.h,

                    // ownerController.isHiddenContactPersonDetails? 280.h:37.5.h,
                    // (ownerController.isHiddenCompanyDetails && ownerController.companyTypeSelectedValue=='Sole Trade')?  370.h:(ownerController.isHiddenCompanyDetails && ownerController.companyTypeSelectedValue=='UnRegistered')?270.h.h:37.5.h,
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(5.sp),
                        border: Border.all(color:tenantController.isHiddenContactPersonDetails?AppColors.purPleGradientOneColor:AppColors.whiteColor,width: 1.sp)),
                    child: Column(
                      children: [
                        InkWell(
                          onTap:(){
                            setState(() {
                              tenantController
                                  .isHiddenContactPersonDetails =! tenantController
                                  .isHiddenContactPersonDetails;
                            });
                          },
                          child:    filterHidding('Contact Person Details',tenantController
                              .isHiddenContactPersonDetails),

                        ),

                        tenantController
                            .isHiddenContactPersonDetails?         Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                        //  height: tenantController.isHiddenContactPersonDetails? 240.h:37.5.h,
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
                                        textController: tenantController.contactPhoneNumberController,
                                        lablel: 'First Name',
                                        labelWidth: 75,

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
                                        textController: tenantController.contactLastNameController,
                                        lablel: 'Last Name',
                                        labelWidth: 75,

                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                              AppFormTextField(
                                isCompulsory: true,
                                enabled: true,
                                height: 40,
                                lablel: 'Phone Number',
                                typeKeyboard: TextInputType.number,
                                textController: tenantController.contactPhoneNumberController,
                                labelWidth: 96,

                              ),
                              SizedBox(
                                height: 18.w,
                              ),
                              AppFormTextField(
                                isCompulsory: true,
                                enabled: true,
                                lablel: 'Date Of Birth',
                                height: 40,
                                textController:  tenantController.contactDateOfBirthController,
                                labelWidth: 96,

                                suffixIcon:
                                'asset/icon/calendar.png',
                                suffixIconTab: () async {
                                  DateTime now =
                                  DateTime.now();
                                  DateTime? newDate =
                                  await showDatePicker(
                                      context: context,
                                      initialDate: now,
                                      firstDate:
                                      DateTime(1900),
                                      lastDate:
                                      DateTime(2023));
                                  DateFormat.yMd().format(newDate!);
                                  setState(() {
                                  //  tenantController.dateOfBirthController.text= DateFormat.yMd().format(newDate!);
                                  });
                                  print(newDate);
                                },
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                              AppFormTextField(
                                isCompulsory: true,
                                enabled: true,
                                lablel: 'Email',
                                height: 40,
                                textController:  tenantController.contactEmailController,
                                labelWidth: 43,

                              ),
                              SizedBox(
                                height: 18.h,
                              ),


                              AppFormTextField(
                                isCompulsory: true,
                                enabled: true,
                                lablel: 'Designation',
                                height: 40,
                                 textController:  tenantController.contactDesignationController,
                                labelWidth: 100,

                              ),
                              SizedBox(height: 18.h,),
                            ],
                          ),
                        )
                            :SizedBox(),

                      ],
                    ),
                  ):SizedBox(),


                  tenantController.companyTypeController.text == 'Person'
                      ? Column(
                    children: [

                      Container(
                        width: double.infinity,
                        //height:tenantController.isHiddenPersonDetails? 350.h:37.5.h,

                        // ownerController.isHiddenContactPersonDetails? 280.h:37.5.h,
                        // (ownerController.isHiddenCompanyDetails && ownerController.companyTypeSelectedValue=='Sole Trade')?  370.h:(ownerController.isHiddenCompanyDetails && ownerController.companyTypeSelectedValue=='UnRegistered')?270.h.h:37.5.h,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(8.sp),
                            border: Border.all(color:tenantController.isHiddenPersonDetails? AppColors.purPleGradientOneColor:Colors.transparent,width:tenantController.isHiddenPersonDetails? 1.sp:0)),
                        child: Column(
                            children: [
                              InkWell(
                                onTap:(){
                                 // tenantController.isClickedPersonDetails=true;
                                  setState(() {
                                    tenantController
                                        .isHiddenPersonDetails =! tenantController
                                        .isHiddenPersonDetails;
                                  });
                                },
                                child:    filterHidding('Person Details',tenantController
                                    .isHiddenPersonDetails),

                              ),

                              tenantController
                                  .isHiddenPersonDetails?         Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                              //  height: tenantController.isHiddenPersonDetails? 310.h:37.5.h,
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
                                                textController: tenantController.personFirstNameController,
                                                lablel: 'First Name',
                                                labelWidth: 75,

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
                                                textController: tenantController.personLastNameController,
                                                lablel: 'Last Name',

                                                labelWidth: 75,
                                              ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 18.h,
                                      ),
                                      AppFormTextField(
                                        isCompulsory: true,
                                        enabled: true,
                                        lablel: 'Phone Number',
                                        height: 40,
                                        typeKeyboard: TextInputType.number,
                                        textController: tenantController.personPhoneNumberController,

                                        labelWidth: 96,
                                      ),
                                      SizedBox(
                                        height: 15.w,
                                      ),
                                      AppFormTextField(
                                        height: 40,
                                        isCompulsory: true,
                                        enabled: true,

                                        lablel: 'Date Of Birth',
                                        labelWidth: 96,
                                        textController: tenantController.personDateOfBirthController,
                                        suffixIcon: 'asset/icon/calendar.png',
                                        suffixIconTab: () async {
                                          DateTime now = DateTime.now();
                                          var newDate = await showDatePicker(
                                              context: context,
                                              initialDate: now,
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2023));
                                          DateFormat.yMd().format(newDate!);
                                          setState(() {
                                            print(newDate);
                                           // tenantController.personDateOfBirthController.text=  DateFormat.yMd().format(newDate!);

                                          });
                                        },
                                      ),
                                      SizedBox(
                                        height: 18.h,
                                      ),
                                      AppFormTextField(
                                        isCompulsory: true,
                                        enabled: true,

                                        lablel: 'Email',
                                        textController: tenantController.personEmailController,
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

                                                 textController: tenantController.personNicNumberController,
                                                  lablel: 'Nic Number',
                                                  typeKeyboard: TextInputType.number,
                                                  labelWidth: 82,
                                                 // maskFormatter: CNICFormatter,
                                                  maxLine: 15,
                                                  height: 40,
                                                  onChanged: (value) {

                                                  })),
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
                                               // textController: ownerController.personPassportNoController,
                                                onChanged: (value) {

                                                },
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

                                              textController: tenantController.personImageController,
                                              lablel: "Image",
                                              height: 40,
                                              labelWidth: 47,
                                              suffixIcon: "asset/icon/file.jpg",
                                              suffixIconTab: () {
                                                getImage(0);
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Flexible(
                                            child: AppFormTextField(
                                              isCompulsory: true,
                                              enabled: true,

                                              textController: tenantController.personNicPhotoController,
                                              lablel: "NIC photo",
                                              height: 40,
                                              labelWidth: 70,
                                              suffixIcon: "asset/icon/file.jpg",
                                              suffixIconTab:() {
                                                getImage(1);
                                              },),
                                          )
                                        ],
                                      ),
SizedBox(height: 18.h,),
                                    ]
                                ),


                              ):SizedBox()
                            ]
                        ),
                      ),

                    ],
                  )
                      :SizedBox(),


                SizedBox(height: 18.h,),
                  ( tenantController.companyTypeController.text == 'Person' || tenantController.companyTypeController.text == 'Company' || tenantController.companyTypeController.text == 'Limited state') ?
                  Container(

                  //  height:  tenantController.isHiddenMailingAddress?  300.h:36.5.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        border: Border.all(color:tenantController.isHiddenMailingAddress? AppColors.purPleGradientOneColor:Colors.transparent,width:tenantController.isHiddenMailingAddress? 1.sp:0)),
                    child: Column(
                      children: [
                        InkWell(
                          onTap:(){
                            setState(() {
                              tenantController
                                  .isHiddenMailingAddress =! tenantController
                                  .isHiddenMailingAddress;
                            });
                          },
                          child:filterHidding('Mailing Address',tenantController.isHiddenMailingAddress),

                        ),
                        tenantController.isHiddenMailingAddress  ?      Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          height:255.h,
                          child: Column(
                            children: [
                              SizedBox(height: 10.h,),
                              Flexible(child: SizedBox(
                              //  height:45.h,

                                child: BottomBorderTextField(
                                  hintText: "Building Name/Number",

//hintText: "Building Name/Number",
                                  isCompulsory: false,
                                  controller:tenantController.mailingBuildingNameController,
                                ),
                              )),
                              SizedBox(height: 5.h,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: BottomBorderTextField(
                                    hintText: "Line One",
                                    // hintText: 'Line One',
                                    isCompulsory: false,
                                    controller:tenantController.mailingLineOneController,)),
                                  SizedBox(width: 20.w,),
                                  Flexible(child: BottomBorderTextField(
                                    hintText: "Line Two",
                                    isCompulsory: false,
                                    controller:tenantController.mailingLineTwoController,)),
                                ],
                              ),
                              SizedBox(height: 5.h,),
                              BottomBorderTextField(
                                hintText: "Area",
                                isCompulsory: true,
                                controller:tenantController.mailingAreaController,),
                              SizedBox(height: 5.h,),
                              Flexible(child: BottomBorderTextField(
                                hintText: "City",
                                isCompulsory: true,
                                controller:tenantController.mailingCityController,)),
                              SizedBox(width: 20.w,),
                              Flexible(child: BottomBorderTextField(
                                hintText: "Post Code",
                                isCompulsory: false,
                                controller:tenantController.mailingPostCodeController,)),
                              SizedBox(height:tenantController.isHiddenMailingAddress? 18.h:0.h,)
                            ],
                          ),
                        ):SizedBox(),


                      ],
                    ),
                  ):SizedBox(),

                  SizedBox(height: 18.h,),
                  ( tenantController.companyTypeController.text == 'Person' || tenantController.companyTypeController.text == 'Company' || tenantController.companyTypeController.text == 'Limited state') ?
                  Row(
                    children: [
                      Text("If Permanent Address is Same with Mailing Address",style: TextStyle(color: AppColors.purPleGradientOneColor,fontSize: 10.sp,fontFamily: 'Roboto-Black')),SizedBox(width: 2.w,),
                      Text('*',style: TextStyle(color: AppColors.redColor),),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: () {
                          setState(() {
                            tenantController.isPermanentMailingAddressSame=!tenantController.isPermanentMailingAddressSame;
                            if(tenantController.isPermanentMailingAddressSame){
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
                          child: Icon(Icons.done,size: 14.sp,color:tenantController.isPermanentMailingAddressSame? AppColors.blueColor:AppColors.whiteColor),
                        ),
                      )
                    ],):SizedBox(),
                  SizedBox(height: 5.h,),
                  ( tenantController.companyTypeController.text == 'Person' || tenantController.companyTypeController.text == 'Company' || tenantController.companyTypeController.text == 'Limited state') ?
                  Container(

                   // height:  tenantController.isHiddenPermanentAddress?  300.h:36.5.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        border: Border.all(color:tenantController.isHiddenPermanentAddress? AppColors.purPleGradientOneColor:Colors.transparent,width:tenantController.isHiddenPermanentAddress? 1.sp:0)),
                    child: Column(
                      children: [
                        InkWell(
                          onTap:(){
                            setState(() {
                              tenantController
                                  .isHiddenPermanentAddress =! tenantController
                                  .isHiddenPermanentAddress;
                            });
                          },
                          child:filterHidding('Permanent Address',tenantController.isHiddenPermanentAddress),

                        ),
                        tenantController.isHiddenPermanentAddress  ?      Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                         height:255.h,
                          child: Column(
                            children: [
                              SizedBox(height: 10.h,),
                              Flexible(child: SizedBox(
                               // height:45.h,

                                child: BottomBorderTextField(
                                  hintText: "Building Name/Number",

//hintText: "Building Name/Number",
                                  isCompulsory: false,
                                  controller:tenantController.permanentBuildingNameController,
                                ),
                              )),
                              SizedBox(height: 5.h,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: BottomBorderTextField(
                                    hintText: "Line One",
                                    // hintText: 'Line One',
                                    isCompulsory: false,
                                    controller:tenantController.permanentLineOneController,)),
                                  SizedBox(width: 20.w,),
                                  Flexible(child: BottomBorderTextField(
                                    hintText: "Line Two",
                                    isCompulsory: false,
                                    controller:tenantController.permanentLineTwoController,)),
                                ],
                              ),
                              SizedBox(height: 5.h,),
                              BottomBorderTextField(
                                hintText: "Area",
                                isCompulsory: true,
                                controller:tenantController.permanentAreaController,
                              ),
                              SizedBox(height: 5.h,),
                              Flexible(child: BottomBorderTextField(
                                hintText: "City",
                                isCompulsory: true,
                                controller:tenantController.permanentCityController,)),
                              SizedBox(width: 20.w,),
                              Flexible(child: BottomBorderTextField(
                                hintText: "Post Code",
                                isCompulsory: false,
                                controller:tenantController.permanentPostCodeController,)),
                              SizedBox(height:tenantController.isHiddenPermanentAddress? 18.h:0.h,)
                            ],
                          ),
                        ):SizedBox(),


                      ],
                    ),
                  ):SizedBox(),

SizedBox(height: 90.h,)


                ],
              ),
            ),
          ),
        ));
  }

  Widget filterHidding(String title,bool isIconChange,){
    return      Container(
      width: 312.w,
      padding: EdgeInsets.only(left: 5.w,top: 7.h,bottom: 7.h),
      decoration: BoxDecoration(
          color: AppColors.purPleGradientOneColor,
          borderRadius:
          BorderRadius.circular(3.sp),
          gradient: LinearGradient(
              colors: [Color(0xff7742E0),
                Color(0xff7A539C)

              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 7.w),
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
          Icon(
              isIconChange
                  ? Icons.expand_more
                  : Icons.expand_less,
              color: AppColors.whiteColor),
          SizedBox(
            width: 7.w,
          )
        ],
      ),);
  }
  void getImage(int? index) async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // file=File(result.files.single.path!);
      Uint8List imageBytes = await image.readAsBytes();
      tenantController.imageBase64 = base64Encode(imageBytes);
      setState(() {
        if(index==0){
         // tenantController.personImageController.text = image.name;

        }else if(index==1){
        //  ownerController.personAgreementController.text=image.name;
        }else if(index==2){
         // ownerController.regCertificateController.text=image.name;
        }else if(index==3){
        //  ownerController.companyLogoController.text=image.name;
        }else if(index==4){
        //  ownerController.agreementController.text=image.name;
        }else if(index==5){
        //  ownerController.regCertificateController.text=image.name;
        }

      });
    }
  }

  void assignPermanentAddressFieldValue() {
    tenantController.permanentBuildingNameController.text =
        tenantController.mailingBuildingNameController.text;
    tenantController.permanentLineOneController.text =
        tenantController.mailingLineOneController.text;
    tenantController.permanentLineTwoController.text =
        tenantController.mailingLineTwoController.text;
    tenantController.permanentAreaController.text =
        tenantController.mailingAreaController.text;
    tenantController.permanentCityController.text =
        tenantController.mailingCityController.text;
    tenantController.permanentPostCodeController.text =
        tenantController.mailingPostCodeController.text;
    setState(() {});
  }

  void clearPermanentAddressFieldValue() {
    tenantController.permanentBuildingNameController.clear();
    tenantController.permanentLineOneController.clear();
    tenantController.permanentLineTwoController.clear();
    tenantController.permanentAreaController.clear();
    tenantController.permanentCityController.clear();
    tenantController.permanentPostCodeController.clear();
    setState(() {});
  }
}

